import 'package:flutter/material.dart';
import 'login.dart';

class ProfilePage extends StatelessWidget {
  String username;

  ProfilePage({required this.username});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFF7FF),

      appBar: AppBar(
        backgroundColor: Color(0xFFF2EAF7),

        elevation: 0,

        title: Text(
          'Profile',

          style: TextStyle(
            color: Colors.black87,
          ),
        ),
      ),

      body: Center(
        child: Column(
          mainAxisAlignment:
              MainAxisAlignment.center,

          children: [
            Container(
              width: 70,
              height: 70,

              decoration: BoxDecoration(
                color: Color(0xFFE8D9FF),

                shape: BoxShape.circle,
              ),

              child: Icon(
                Icons.person,
                color: Color(0xFF5E3B9E),
                size: 40,
              ),
            ),

            SizedBox(height: 15),

            Text(
              'Username',

              style: TextStyle(
                color: Colors.grey,
                fontSize: 13,
              ),
            ),

            SizedBox(height: 5),

            Text(
              username,

              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),

            SizedBox(height: 25),

            OutlinedButton.icon(
              onPressed: () {
                Navigator.pushAndRemoveUntil(
                  context,

                  MaterialPageRoute(
                    builder: (context) => LoginPage(),
                  ),

                  (route) => false,
                );
              },

              icon: Icon(
                Icons.logout,
                size: 17,
              ),

              label: Text(
                'Logout',
              ),

              style: OutlinedButton.styleFrom(
                foregroundColor:
                    Color(0xFF6B4DB3),

                shape: RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.circular(20),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}