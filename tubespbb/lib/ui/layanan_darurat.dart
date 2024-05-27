import 'package:flutter/material.dart';

class LayananDaruratScreen extends StatelessWidget {
  const LayananDaruratScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Panggilan Darurat',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blue,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 40,
              backgroundImage: AssetImage(
                  'assets/images/service.jpg'), // Replace with your image
            ),
            SizedBox(height: 20),
            Text(
              'Layanan Darurat',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Text(
              'Berikut kontak servis darurat LaporGuys yang bisa di hubungi pada jam operasional',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey[700],
              ),
            ),
            SizedBox(height: 30),
            EmergencyContactCard(
              title: 'Purwokerto',
              subtitle: 'Senin-Jumat 08.00-16.00 WIB\nSabtu 06.00 - 16.00 WIB',
              phoneNumber: '021-6012044',
            ),
            EmergencyContactCard(
              title: 'Purbalingga',
              subtitle: '24 Jam',
              phoneNumber: '1500-989',
            ),
          ],
        ),
      ),
    );
  }
}

class EmergencyContactCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final String phoneNumber;

  const EmergencyContactCard({
    Key? key,
    required this.title,
    required this.subtitle,
    required this.phoneNumber,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.red,
      margin: EdgeInsets.symmetric(vertical: 8.0),
      child: ListTile(
        leading: Icon(Icons.phone, color: Colors.white),
        title: Text(
          title,
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        subtitle: Text(
          subtitle,
          style: TextStyle(color: Colors.white),
        ),
        trailing: Text(
          phoneNumber,
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: LayananDaruratScreen(),
  ));
}
