import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: PanduanKeselamatanScreen(),
  ));
}

class PanduanKeselamatanScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final safetyGuides = [
      {
        'title': 'Kebakaran',
        'imagePath': 'assets/images/kebakaran.jpg',
        'screenTitle': 'Panduan Keselamatan Kebakaran',
        'steps': [
          'Hubungi pemadam kebakaran segera.',
          'Jika api kecil, gunakan alat pemadam api.',
          'Jika tidak dapat dikendalikan, keluar dari bangunan dengan aman.',
          'Tutup pintu di belakang Anda untuk menahan penyebaran api.',
          'Jangan gunakan lift.',
          'Merangkaklah jika ada asap untuk menghindari asap beracun.',
        ],
      },
      {
        'title': 'Gempa Bumi',
        'imagePath': 'assets/images/gempabumi.jpg',
        'screenTitle': 'Panduan Keselamatan Gempa Bumi',
        'steps': [
          'Berlindung di bawah meja yang kuat.',
          'Menjauh dari jendela dan benda yang bisa jatuh.',
          'Jika berada di luar, menjauhlah dari bangunan, pohon, dan tiang listrik.',
          'Setelah gempa berhenti, evakuasi ke tempat terbuka dengan tenang.',
          'Periksa diri sendiri dan orang lain untuk cedera.',
          'Dengarkan informasi dari sumber terpercaya.',
        ],
      },
      {
        'title': 'Insiden Medis',
        'imagePath': 'assets/images/insidenmedis.jpg',
        'screenTitle': 'Panduan Keselamatan Insiden Medis',
        'steps': [
          'Hubungi layanan darurat medis segera.',
          'Berikan pertolongan pertama jika Anda terlatih.',
          'Jangan pindahkan korban kecuali benar-benar diperlukan.',
          'Jaga korban tetap nyaman dan tenang.',
          'Periksa pernapasan dan denyut nadi korban.',
          'Ikuti instruksi dari petugas medis saat mereka tiba.',
        ],
      },
      {
        'title': 'Pertolongan Pertama Luka Ringan',
        'imagePath': 'assets/images/pertolonganpertama.jpg',
        'screenTitle': 'Panduan Pertolongan Pertama Luka Ringan',
        'steps': [
          'Bersihkan luka dengan air bersih.',
          'Gunakan antiseptik untuk mencegah infeksi.',
          'Tutupi luka dengan perban steril.',
          'Ganti perban secara teratur dan periksa tanda-tanda infeksi.',
          'Jika luka tidak sembuh atau memburuk, konsultasikan dengan dokter.',
        ],
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text('Panduan Keselamatan'),
        backgroundColor: Colors.blueAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 16.0,
            mainAxisSpacing: 16.0,
          ),
          itemCount: safetyGuides.length,
          itemBuilder: (context, index) {
            final guide = safetyGuides[index];
            return buildSafetyCard(
              context,
              guide['title'] as String,
              guide['imagePath'] as String,
              guide['screenTitle'] as String,
              guide['steps'] as List<String>,
            );
          },
        ),
      ),
    );
  }

  Widget buildSafetyCard(BuildContext context, String title, String imagePath,
      String screenTitle, List<String> steps) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => PanduanDetailScreen(
              title: screenTitle,
              steps: steps,
            ),
          ),
        );
      },
      child: Container(
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
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(imagePath, width: 80, height: 80),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(
                title,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PanduanDetailScreen extends StatelessWidget {
  final String title;
  final List<String> steps;

  const PanduanDetailScreen({
    Key? key,
    required this.title,
    required this.steps,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        backgroundColor: Colors.blueAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: steps.length,
          itemBuilder: (context, index) {
            return buildStepCard(index + 1, steps[index]);
          },
        ),
      ),
    );
  }

  Widget buildStepCard(int stepNumber, String stepDescription) {
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
      child: Row(
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
              stepDescription,
              style: TextStyle(
                fontSize: 16,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
