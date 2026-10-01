import 'package:flutter/material.dart';
import '../models/data.dart';
import 'detail.dart';

class HomePage extends StatefulWidget {
  String username;

  HomePage({required this.username});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController searchController =
      TextEditingController();

  String selectedCategory = 'Semua';

  @override
  Widget build(BuildContext context) {
    List<Product> filteredProducts = catalog.where((product) {
      bool cocokSearch = product.productName
          .toLowerCase()
          .contains(searchController.text.toLowerCase());

      bool cocokKategori =
          selectedCategory == 'Semua' ||
          product.type == selectedCategory;

      return cocokSearch && cocokKategori;
    }).toList();

    return Scaffold(
      backgroundColor: Color(0xFFFFF7FF),

      appBar: AppBar(
        backgroundColor: Color(0xFFF2EAF7),
        elevation: 0,

        title: Text(
          'UNIQLO',
          style: TextStyle(
            color: Colors.black87,
          ),
        ),
      ),

      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(10),

            child: TextField(
              controller: searchController,

              onChanged: (value) {
                setState(() {});
              },

              decoration: InputDecoration(
                hintText: 'Cari produk...',

                prefixIcon: Icon(
                  Icons.search,
                ),

                filled: true,
                fillColor: Colors.white,

                border: OutlineInputBorder(
                  borderRadius:
                      BorderRadius.circular(20),

                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),

          Container(
            height: 45,

            child: ListView(
              scrollDirection: Axis.horizontal,

              padding: EdgeInsets.symmetric(
                horizontal: 10,
              ),

              children: [
                categoryButton('Semua'),

                categoryButton('T-Shirt'),

                categoryButton('Jacket'),

                categoryButton('Pants'),

                categoryButton('Bag'),

                categoryButton('Accessories'),
              ],
            ),
          ),

          SizedBox(height: 5),

          Expanded(
            child: filteredProducts.isEmpty
                ? Center(
                    child: Text(
                      'Produk tidak ditemukan',
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                  )
                : Padding(
                    padding: EdgeInsets.all(10),

                    child: GridView.builder(
                      itemCount:
                          filteredProducts.length,

                      gridDelegate:
                          SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                        childAspectRatio: 0.70,
                      ),

                      itemBuilder: (context, index) {
                        Product product =
                            filteredProducts[index];

                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,

                              MaterialPageRoute(
                                builder: (context) =>
                                    DetailPage(
                                  product: product,
                                ),
                              ),
                            );
                          },

                          child: Container(
                            decoration: BoxDecoration(
                              color: Color(0xFFF8F0FA),

                              borderRadius:
                                  BorderRadius.circular(
                                10,
                              ),

                              border: Border.all(
                                color:
                                    Color(0xFFE4D9E8),
                              ),
                            ),

                            child: Column(
                              crossAxisAlignment:
                                  CrossAxisAlignment.start,

                              children: [
                                ClipRRect(
                                  borderRadius:
                                      BorderRadius.only(
                                    topLeft:
                                        Radius.circular(
                                      10,
                                    ),
                                    topRight:
                                        Radius.circular(
                                      10,
                                    ),
                                  ),

                                  child: Image.network(
                                    product.imageUrl,

                                    width:
                                        double.infinity,

                                    height: 105,

                                    fit: BoxFit.cover,
                                  ),
                                ),

                                Padding(
                                  padding:
                                      EdgeInsets.all(8),

                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment
                                            .start,

                                    children: [
                                      Text(
                                        product.productName,

                                        maxLines: 1,

                                        overflow:
                                            TextOverflow
                                                .ellipsis,

                                        style: TextStyle(
                                          fontWeight:
                                              FontWeight
                                                  .bold,

                                          fontSize: 13,
                                        ),
                                      ),

                                      SizedBox(height: 5),

                                      Text(
                                        product.price,

                                        style: TextStyle(
                                          fontSize: 12,
                                        ),
                                      ),

                                      SizedBox(height: 5),

                                      Row(
                                        children: [
                                          Icon(
                                            Icons.favorite,

                                            color: Colors
                                                .red,

                                            size: 14,
                                          ),

                                          SizedBox(width: 4),

                                          Text(
                                            '${product.likeCount} likes',

                                            style:
                                                TextStyle(
                                              fontSize: 11,
                                            ),
                                          ),
                                        ],
                                      ),

                                      SizedBox(height: 3),

                                      Text(
                                        'Stok: ${product.stock}',

                                        style: TextStyle(
                                          color:
                                              Colors.grey,

                                          fontSize: 11,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
          ),
        ],
      ),
    );
  }

  Widget categoryButton(String category) {
    bool isSelected =
        selectedCategory == category;

    return Padding(
      padding: EdgeInsets.only(right: 8),

      child: GestureDetector(
        onTap: () {
          setState(() {
            selectedCategory = category;
          });
        },

        child: Container(
          padding: EdgeInsets.symmetric(
            horizontal: 15,
            vertical: 8,
          ),

          decoration: BoxDecoration(
            color: isSelected
                ? Color(0xFF6B4DB3)
                : Colors.white,

            borderRadius:
                BorderRadius.circular(20),

            border: Border.all(
              color: Color(0xFF6B4DB3),
            ),
          ),

          child: Center(
            child: Text(
              category,

              style: TextStyle(
                color: isSelected
                    ? Colors.white
                    : Color(0xFF6B4DB3),

                fontSize: 12,

                fontWeight:
                    FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}