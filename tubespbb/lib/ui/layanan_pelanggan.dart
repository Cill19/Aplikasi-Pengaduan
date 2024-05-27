import 'package:flutter/material.dart';

class CustomerServiceScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Layanan Pelanggan"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Layanan Pelanggan',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Text(
              'Kami siap membantu Anda dengan segala pertanyaan dan masalah yang Anda hadapi. Silakan hubungi kami melalui email atau telepon.',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 20),
            Text(
              'Email: support@example.com', // Ganti dengan email layanan pelanggan aktual
              style: TextStyle(fontSize: 18),
            ),
            Text(
              'Telepon: +123456789', // Ganti dengan nomor telepon layanan pelanggan aktual
              style: TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
