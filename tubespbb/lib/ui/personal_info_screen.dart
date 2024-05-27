import 'package:flutter/material.dart';

class PersonalInfoScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Informasi Pribadi"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage(
                    'assets/avatar.png'), // Ganti dengan foto pengguna
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Nama: Nama Pengguna', // Ganti dengan nama pengguna aktual
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Text(
              'Email: email@example.com', // Ganti dengan email aktual
              style: TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
