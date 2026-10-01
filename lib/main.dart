import 'package:flutter/material.dart';
import 'views/login.dart';

void main() {
  // Menjalankan aplikasi Flutter
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Menghilangkan tulisan DEBUG di pojok kanan atas
      debugShowCheckedModeBanner: false,

      // Halaman pertama yang dibuka
      home: LoginPage(),
    );
  }
}