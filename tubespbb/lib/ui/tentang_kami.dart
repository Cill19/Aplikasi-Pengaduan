import 'package:flutter/material.dart';

class AboutUsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tentang Kami"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Tentang Kami',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Text(
              'Kami adalah perusahaan yang bergerak di bidang teknologi informasi. Kami bertekad untuk memberikan solusi inovatif dan berkualitas bagi para pelanggan kami.',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 20),
            Center(
              child: Image.asset(
                'assets/login.jpg', // Ganti dengan gambar tentang kami
                width: 300,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
