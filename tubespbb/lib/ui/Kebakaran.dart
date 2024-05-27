import 'package:flutter/material.dart';

class KebakaranScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Panduan Keselamatan Kebakaran'),
        backgroundColor: Colors.blueAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            StepCard(
              stepNumber: 1,
              description: 'Hubungi pemadam kebakaran segera.',
              imagePath: 'assets/images/kebakaran.jpg',
            ),
            StepCard(
              stepNumber: 2,
              description: 'Jika api kecil, gunakan alat pemadam api.',
              imagePath: 'assets/images/kebakaran.jpg',
            ),
            StepCard(
              stepNumber: 3,
              description:
                  'Jika tidak dapat dikendalikan, keluar dari bangunan dengan aman.',
              imagePath: 'assets/images/kebakaran.jpg',
            ),
            StepCard(
              stepNumber: 4,
              description:
                  'Tutup pintu di belakang Anda untuk menahan penyebaran api.',
              imagePath: 'assets/images/kebakaran.jpg',
            ),
            StepCard(
              stepNumber: 5,
              description: 'Jangan gunakan lift.',
              imagePath: 'assets/images/kebakaran.jpg',
            ),
            StepCard(
              stepNumber: 6,
              description:
                  'Merangkaklah jika ada asap untuk menghindari asap beracun.',
              imagePath: 'assets/images/kebakaran.jpg',
            ),
          ],
        ),
      ),
    );
  }
}

class StepCard extends StatelessWidget {
  final int stepNumber;
  final String description;
  final String imagePath;

  StepCard({
    required this.stepNumber,
    required this.description,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            spreadRadius: 2,
            blurRadius: 5,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CircleAvatar(
                backgroundColor: Colors.blueAccent,
                child: Text(
                  '$stepNumber',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              SizedBox(width: 16),
              Expanded(
                child: Text(
                  description,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 16),
          Image.asset(imagePath, height: 150, fit: BoxFit.cover),
        ],
      ),
    );
  }
}
