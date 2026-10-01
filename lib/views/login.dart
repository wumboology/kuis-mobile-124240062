// Mengimpor library Material dari Flutter
// Digunakan untuk menggunakan widget seperti Text, TextField, Scaffold, dll.
import 'package:flutter/material.dart';

// Mengimpor data user dari file data.dart
import '../models/data.dart';

// Mengimpor Root untuk berpindah ke halaman utama setelah login berhasil
import '../root.dart';


// Membuat halaman LoginPage
// StatefulWidget digunakan karena halaman login memiliki state
class LoginPage extends StatefulWidget {

  // Membuat state untuk LoginPage
  @override
  State<LoginPage> createState() => _LoginPageState();
}


// State dari LoginPage
class _LoginPageState extends State<LoginPage> {

  // Controller untuk mengambil teks yang dimasukkan pada username
  TextEditingController usernameController =
      TextEditingController();

  // Controller untuk mengambil teks yang dimasukkan pada password
  TextEditingController passwordController =
      TextEditingController();


  // Function untuk melakukan proses login
  void login() {

    // Mengambil username yang diketik oleh user
    String username = usernameController.text;

    // Mengambil password yang diketik oleh user
    String password = passwordController.text;


    // Mengecek apakah username atau password masih kosong
    if (username.isEmpty || password.isEmpty) {

      // Menampilkan pesan jika username atau password kosong
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Username dan password harus diisi'),
        ),
      );

      // Menghentikan proses login
      return;
    }


    // Mengecek apakah username dan password sesuai dengan data user
    if (username == user1.username &&
        password == user1.password) {

      // Jika login berhasil, pindah ke halaman Root
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => Root(
            // Mengirim username ke halaman Root
            username: username,
          ),
        ),
      );

    } else {

      // Menampilkan pesan jika username atau password salah
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Username atau password salah'),
        ),
      );
    }
  }


  // Membuat tampilan halaman login
  @override
  Widget build(BuildContext context) {

    // Scaffold digunakan sebagai struktur dasar halaman
    return Scaffold(

      // Mengatur warna background halaman
      backgroundColor: Color(0xFFFFF5FF),

      // Bagian utama dari halaman
      body: SafeArea(

        // Membuat isi halaman berada di tengah
        child: Center(

          // Membuat halaman dapat di-scroll jika layar terlalu kecil
          child: SingleChildScrollView(

            // Memberikan jarak di sekitar isi halaman
            child: Padding(
              padding: EdgeInsets.all(20),

              // Column digunakan untuk menyusun widget dari atas ke bawah
              child: Column(
                children: [

                  // Menampilkan logo Gacoan
                  Image.network(
                    "https://play-lh.googleusercontent.com/bB_cyOTbQfFmV4IaeqTIFJVc1Wm4UdQwQai8GjthG4uaXrTHNZTKsMtg9_9058GeZGLgoJzIasYYdFkSvdyQ",
                    width: 150,
                    height: 150,
                  ),

                  // Memberikan jarak antara logo dan teks
                  SizedBox(height: 5),

                  // Menampilkan teks selamat datang
                  Text(
                    'Selamat Datang di Uniqlo \nSelamat berbelanja',

                    // Mengatur style teks
                    style: TextStyle(
                      fontSize: 11,
                      color: Colors.grey,
                    ),
                  ),

                  // Memberikan jarak sebelum username
                  SizedBox(height: 15),

                  // TextField untuk memasukkan username
                  TextField(

                    // Menghubungkan TextField dengan usernameController
                    controller: usernameController,

                    // Mengatur tampilan TextField
                    decoration: InputDecoration(

                      // Teks petunjuk di dalam TextField
                      hintText: 'username',

                      // Mengatur jarak tulisan dari sisi TextField
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: 15,
                        vertical: 10,
                      ),

                      // Membuat border TextField berbentuk rounded
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ),

                  // Memberikan jarak antara username dan password
                  SizedBox(height: 10),

                  // TextField untuk memasukkan password
                  TextField(

                    // Menghubungkan TextField dengan passwordController
                    controller: passwordController,

                    // Membuat password selalu tersembunyi
                    obscureText: true,

                    // Mengatur tampilan TextField password
                    decoration: InputDecoration(

                      // Teks petunjuk di dalam TextField
                      hintText: 'password',

                      // Mengatur jarak tulisan dari sisi TextField
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: 15,
                        vertical: 10,
                      ),

                      // Membuat border TextField berbentuk rounded
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ),

                  // Memberikan jarak antara password dan tombol Login
                  SizedBox(height: 12),

                  // Mengatur ukuran tombol Login
                  SizedBox(
                    width: 120,
                    height: 35,

                    // Membuat tombol Login
                    child: ElevatedButton(

                      // Menjalankan function login ketika tombol ditekan
                      onPressed: login,

                      // Mengatur tampilan tombol
                      style: ElevatedButton.styleFrom(

                        // Mengatur warna background tombol
                        backgroundColor: Color(0xFF2196F3),

                        // Mengatur warna tulisan tombol
                        foregroundColor: Colors.white,

                        // Membuat sudut tombol menjadi rounded
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),

                      // Tulisan pada tombol
                      child: Text(
                        'Login',

                        // Mengatur ukuran tulisan
                        style: TextStyle(
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}