import 'package:flutter/material.dart';
import '../models/data.dart';
import '../root.dart';

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController usernameController =
      TextEditingController();

  TextEditingController passwordController =
      TextEditingController();

  void login() {
    String username = usernameController.text;
    String password = passwordController.text;

    if (username.isEmpty || password.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Username dan password harus diisi'),
        ),
      );

      return;
    }

    if (username == account.username &&
        password == account.password) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => Root(
            username: username,
          ),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Username atau password salah'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFF7FF),

      body: Padding(
        padding: EdgeInsets.all(25),

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,

          children: [
        Image.asset(
  'lib/assets/uniqlo.png',
  width: 120,
  height: 120,
  fit: BoxFit.contain,
),

            SizedBox(height: 20),

            Text(
              'Selamat Datang di Uniqlo',
              style: TextStyle(
                color: Colors.grey,
                fontSize: 14,
              ),
            ),

            Text(
              'Selamat Berbelanja',
              style: TextStyle(
                color: Colors.grey,
                fontSize: 14,
              ),
            ),

            SizedBox(height: 35),

            TextField(
              controller: usernameController,

              decoration: InputDecoration(
                hintText: 'username',

                filled: true,
                fillColor: Colors.white,

                contentPadding: EdgeInsets.symmetric(
                  horizontal: 15,
                  vertical: 12,
                ),

                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),

                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide(
                    color: Colors.grey,
                  ),
                ),
              ),
            ),

            SizedBox(height: 15),

            TextField(
              controller: passwordController,

              obscureText: true,

              decoration: InputDecoration(
                hintText: 'password',

                filled: true,
                fillColor: Colors.white,

                contentPadding: EdgeInsets.symmetric(
                  horizontal: 15,
                  vertical: 12,
                ),

                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),

                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide(
                    color: Colors.grey,
                  ),
                ),
              ),
            ),

            SizedBox(height: 25),

            SizedBox(
              width: 120,
              height: 40,

              child: ElevatedButton(
                onPressed: login,

                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF2196F3),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),

                child: Text(
                  'Login',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}