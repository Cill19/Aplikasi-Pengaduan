import 'package:flutter/material.dart';
import 'package:praktikum06/ui/article_detail_screen.dart';
import 'detail_pengaduan.dart';
import 'panduan_keselamatan.dart';
import 'layanan_darurat.dart';

class PengaduanScreen extends StatelessWidget {
  const PengaduanScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Pengaduan",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blue,
      ),
      body: Stack(
        children: [
          Container(
            color: Colors.blue,
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
          ),
          Positioned(
            bottom: 0,
            left: 0,
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.7,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          buildFeatureContainer(
                            context,
                            'Pengaduan',
                            'assets/images/pengaduan.jpg',
                            DetailPengaduan(),
                          ),
                          buildFeatureContainer(
                            context,
                            'Panduan Keselamatan',
                            'assets/images/panduankeselamatan.jpg',
                            PanduanKeselamatanScreen(),
                          ),
                          buildFeatureContainer(
                            context,
                            'Layanan Darurat',
                            'assets/images/layanandarurat.jpg',
                            LayananDaruratScreen(),
                          ),
                        ],
                      ),
                      SizedBox(height: 20),
                      Text(
                        'Artikel',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 10),
                      Container(
                        height: 250,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: [
                            buildArticleCard(
                              context,
                              "Mengenal Lebih Dekat Nyamuk Wolbachia",
                              "Kementerian Kesehatan menerapkan inovasi teknologi Wolbachia untuk menurunkan kasus penyebaran Demam Berdarah Dengue (DBD) di Indonesia. Efektifkah metode tersebut dalam mencegah kasus DBD, lalu bagaimana cara kerjanya? Yuk mengenal lebih dekat nyamuk ber-Wolbachia!",
                              'assets/images/artikel1.png',
                            ),
                            buildArticleCard(
                              context,
                              "Pentingnya Vaksinasi COVID-19",
                              "Vaksinasi COVID-19 sangat penting untuk menekan angka penyebaran virus. Bagaimana cara kerja vaksin dan apa saja jenis vaksin yang tersedia? Mari kita bahas lebih lanjut.",
                              'assets/images/artikel2.png',
                            ),
                            buildArticleCard(
                              context,
                              "Pentingnya Self Care dan Perhatikan Kebutuhan Diri Sendiri Meski Sibuk",
                              "Padatnya rutinitas sehari-hari kerap membuat banyak orang lupa akan kebutuhan diri sendiri. Padahal meskipun sibuk, self care atau merawat diri adalah kewajiban yang harus tetap diupayakan.",
                              'assets/images/artikel3.png',
                            ),
                            buildArticleCard(
                              context,
                              "Waspadai Ancaman Masalah Kesehatan Mental di Kota Besar",
                              "Di balik kemewahan kehidupan urban, ternyata tersimpan sisi lain yang memberi pengaruh bagi kesehatan, terutama kesehatan mental Anda. Masalah kesehatan mental di indonesia terutama bagi masyarakat yang tinggal di perkotaan nyatanya bukan isapan jempol belaka",
                              'assets/images/artikel4.png',
                            ),
                            buildArticleCard(
                              context,
                              "Manfaat Olahraga Rutin",
                              "Olahraga rutin memiliki banyak manfaat bagi tubuh dan pikiran. Apa saja manfaat olahraga dan bagaimana cara memulainnya? Yuk, kita bahas.",
                              'assets/images/artikel5.png',
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Fungsi untuk membangun container fitur
  Widget buildFeatureContainer(BuildContext context, String title,
      String imagePath, Widget destination) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => destination,
          ),
        );
      },
      child: Container(
        width: MediaQuery.of(context).size.width / 3 - 24,
        height: 180,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Colors.grey.shade400),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              spreadRadius: 1,
              blurRadius: 5,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              imagePath,
              height: 80,
            ),
            SizedBox(height: 10),
            Text(
              title,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  // Fungsi untuk membangun kartu artikel
  Widget buildArticleCard(BuildContext context, String title,
      String description, String imagePath) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ArticleDetailScreen(
              title: title,
              description: description,
              imagePath: imagePath,
            ),
          ),
        );
      },
      child: Container(
        width: 200,
        margin: EdgeInsets.only(right: 16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              spreadRadius: 2,
              blurRadius: 5,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 120,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(15),
                ),
                image: DecorationImage(
                  image: AssetImage(imagePath),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    description,
                    style: TextStyle(fontSize: 14),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
