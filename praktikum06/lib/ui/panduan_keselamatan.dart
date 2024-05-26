import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: PanduanKeselamatanScreen(),
  ));
}

class PanduanKeselamatanScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Panduan Keselamatan'),
        backgroundColor: Colors.blueAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            buildSafetyCard(
              context,
              'Kebakaran',
              'assets/images/fire.png',
              'Panduan Keselamatan Kebakaran',
              [
                'Hubungi pemadam kebakaran segera.',
                'Jika api kecil, gunakan alat pemadam api.',
                'Jika tidak dapat dikendalikan, keluar dari bangunan dengan aman.',
                'Tutup pintu di belakang Anda untuk menahan penyebaran api.',
                'Jangan gunakan lift.',
                'Merangkaklah jika ada asap untuk menghindari asap beracun.',
              ],
            ),
            buildSafetyCard(
              context,
              'Gempa Bumi',
              'assets/images/earthquake.png',
              'Panduan Keselamatan Gempa Bumi',
              [
                'Berlindung di bawah meja yang kuat.',
                'Menjauh dari jendela dan benda yang bisa jatuh.',
                'Jika berada di luar, menjauhlah dari bangunan, pohon, dan tiang listrik.',
                'Setelah gempa berhenti, evakuasi ke tempat terbuka dengan tenang.',
                'Periksa diri sendiri dan orang lain untuk cedera.',
                'Dengarkan informasi dari sumber terpercaya.',
              ],
            ),
            buildSafetyCard(
              context,
              'Insiden Medis',
              'assets/images/medical.png',
              'Panduan Keselamatan Insiden Medis',
              [
                'Hubungi layanan darurat medis segera.',
                'Berikan pertolongan pertama jika Anda terlatih.',
                'Jangan pindahkan korban kecuali benar-benar diperlukan.',
                'Jaga korban tetap nyaman dan tenang.',
                'Periksa pernapasan dan denyut nadi korban.',
                'Ikuti instruksi dari petugas medis saat mereka tiba.',
              ],
            ),
            buildSafetyCard(
              context,
              'Pertolongan Pertama Luka Ringan',
              'assets/images/first_aid.png',
              'Panduan Pertolongan Pertama Luka Ringan',
              [
                'Bersihkan luka dengan air bersih.',
                'Gunakan antiseptik untuk mencegah infeksi.',
                'Tutupi luka dengan perban steril.',
                'Ganti perban secara teratur dan periksa tanda-tanda infeksi.',
                'Jika luka tidak sembuh atau memburuk, konsultasikan dengan dokter.',
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget buildSafetyCard(BuildContext context, String title, String imagePath,
      String screenTitle, List<String> steps) {
    return Card(
      elevation: 4,
      margin: EdgeInsets.symmetric(vertical: 10),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: ListTile(
        leading: Image.asset(imagePath, width: 50),
        title: Text(
          title,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        trailing: Icon(Icons.arrow_forward_ios),
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
            return Card(
              margin: EdgeInsets.symmetric(vertical: 8),
              child: ListTile(
                leading: CircleAvatar(
                  backgroundColor: Colors.blueAccent,
                  child: Text(
                    '${index + 1}',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                title: Text(steps[index]),
              ),
            );
          },
        ),
      ),
    );
  }
}
