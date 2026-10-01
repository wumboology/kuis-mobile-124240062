import 'package:flutter/material.dart';
import '../models/data.dart';

class DetailPage extends StatefulWidget {
  Product product;

  DetailPage({required this.product});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  int quantity = 1;

  bool isLiked = false;

  int likeCount = 0;

  String selectedSize = '';

  @override
  void initState() {
    super.initState();

    likeCount = widget.product.likeCount;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFF7FF),

      appBar: AppBar(
        backgroundColor: Color(0xFFFFF7FF),
        elevation: 0,

        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),

          onPressed: () {
            Navigator.pop(context);
          },
        ),

        title: Text(
          'Detail Produk',

          style: TextStyle(
            color: Colors.black87,
            fontSize: 16,
          ),
        ),
      ),

      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(15),

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,

            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),

                child: Image.network(
                  widget.product.imageUrl,

                  width: double.infinity,
                  height: 180,

                  fit: BoxFit.cover,
                ),
              ),

              SizedBox(height: 15),

              Text(
                widget.product.productName,

                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),

              SizedBox(height: 5),

              Text(
                widget.product.type,

                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 13,
                ),
              ),

              SizedBox(height: 8),

              Text(
                widget.product.price,

                style: TextStyle(
                  color: Colors.green,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),

              SizedBox(height: 20),

              Text(
                'Jumlah Produk',

                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),

              Row(
                children: [
                  IconButton(
                    onPressed: () {
                      setState(() {
                        if (quantity > 1) {
                          quantity--;
                        }
                      });
                    },

                    icon: Icon(
                      Icons.remove_circle_outline,
                    ),
                  ),

                  Text(
                    '$quantity',

                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  IconButton(
                    onPressed: () {
                      setState(() {
                        if (quantity < widget.product.stock) {
                          quantity++;
                        }
                      });
                    },

                    icon: Icon(
                      Icons.add_circle_outline,
                    ),
                  ),
                ],
              ),

              SizedBox(height: 5),

              Row(
                children: [
                  Icon(
                    Icons.favorite,
                    color: Colors.red,
                    size: 18,
                  ),

                  SizedBox(width: 5),

                  Text(
                    '$likeCount likes',
                    style: TextStyle(
                      fontSize: 12,
                    ),
                  ),

                  SizedBox(width: 10),

                  Text(
                    'Stok: ${widget.product.stock}',
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 12,
                    ),
                  ),

                  IconButton(
                    onPressed: () {
                      setState(() {
                        if (isLiked) {
                          likeCount--;
                          isLiked = false;
                        } else {
                          likeCount++;
                          isLiked = true;
                        }
                      });
                    },

                    icon: Icon(
                      isLiked
                          ? Icons.favorite
                          : Icons.favorite_border,

                      color: Colors.red,
                    ),
                  ),
                ],
              ),

              SizedBox(height: 15),

              Text(
                'Ukuran',

                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),

              SizedBox(height: 10),

              Wrap(
                spacing: 8,
                runSpacing: 8,

                children: widget.product.sizes.map(
                  (size) {
                    bool isSelected =
                        selectedSize == size;

                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedSize = size;
                        });
                      },

                      child: Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 15,
                          vertical: 9,
                        ),

                        decoration: BoxDecoration(
                          color: isSelected
                              ? Color(0xFF6B4DB3)
                              : Colors.white,

                          border: Border.all(
                            color: Color(0xFF6B4DB3),
                          ),

                          borderRadius:
                              BorderRadius.circular(6),
                        ),

                        child: Text(
                          size,

                          style: TextStyle(
                            color: isSelected
                                ? Colors.white
                                : Colors.black,

                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    );
                  },
                ).toList(),
              ),

              SizedBox(height: 10),

              if (selectedSize.isNotEmpty)
                Text(
                  'Ukuran dipilih: $selectedSize',

                  style: TextStyle(
                    color: Color(0xFF6B4DB3),
                    fontSize: 13,
                  ),
                ),

              SizedBox(height: 20),

              Text(
                'Deskripsi',

                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),

              SizedBox(height: 8),

              Text(
                widget.product.details,

                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 13,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}