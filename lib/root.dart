// Mengimpor library Material dari Flutter
// Digunakan untuk menggunakan widget seperti Scaffold dan BottomNavigationBar
import 'package:flutter/material.dart';


// Membuat halaman Root
// Root digunakan sebagai halaman utama setelah login
class Root extends StatefulWidget {

  // Menyimpan username yang dikirim dari halaman Login
  String username;

  // Constructor Root
  // Username wajib diberikan ketika membuat Root
  Root({required this.username});

  // Membuat state untuk Root
  @override
  State<Root> createState() => _RootState();
}


// State dari Root
class _RootState extends State<Root> {

  // Menyimpan index halaman yang sedang dipilih
  // 0 = Home
  // 1 = Profile
  int currentIndex = 0;


  // Membuat tampilan Root
  @override
  Widget build(BuildContext context) {

    // Membuat daftar halaman yang akan digunakan
    List<Widget> pages = [

      // Halaman Home dan mengirim username ke Home
    

      // Halaman Profile dan mengirim username ke Profile
    
    ];


    // Scaffold digunakan sebagai struktur dasar halaman
    return Scaffold(

      // Menampilkan halaman berdasarkan currentIndex
      body: pages[currentIndex],

      // Membuat Bottom Navigation di bagian bawah
      bottomNavigationBar: BottomNavigationBar(

        // Menentukan menu yang sedang aktif
        currentIndex: currentIndex,

        // Function yang dijalankan ketika menu ditekan
        onTap: (index) {

          // Memberitahu Flutter bahwa ada perubahan halaman
          setState(() {

            // Mengubah halaman sesuai menu yang dipilih
            currentIndex = index;
          });
        },

        // Warna icon dan teks menu yang sedang aktif
        selectedItemColor: Color(0xFF7352B8),

        // Warna icon dan teks menu yang tidak aktif
        unselectedItemColor: Colors.grey,

        // Daftar menu pada Bottom Navigation
        items: [

          // Menu Home
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),

          // Menu Profile
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}