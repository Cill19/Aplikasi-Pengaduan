import 'package:flutter/material.dart';
import 'package:praktikum06/ui/login.dart';

class OnboardingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue, // Latar belakang biru
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'SafetyNet Central',
              style: TextStyle(
                fontSize: 32,
                color: Colors.white, // Warna teks putih
              ),
            ),

            SizedBox(height: 20), // Spasi antara teks dan gambar
            Image.asset(
              'assets/images/onboarding.png', // Path gambar
              width: 200, // Lebar gambar
              height: 200, // Tinggi gambar
            ),
            SizedBox(height: 20), // Spasi antara teks
            Text(
              'Thanks for being the best student',
              style: TextStyle(
                fontSize: 16,
                color: Colors.white, // Warna teks putih
              ),
            ),
            SizedBox(height: 40), // Spasi antara gambar dan tombol
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LoginScreen()),
                );
              },
              child: Text('Start'),
            ),
          ],
        ),
      ),
    );
  }
}
