import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:praktikum06/ui/login.dart';
import 'profile_screen.dart';
import 'pengaduan_screen.dart';
import 'article_detail_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  final List<Widget> _children = [
    HomeScreenContent(),
    PengaduanScreen(),
    ProfileScreen(),
  ];

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTabTapped,
        currentIndex: _currentIndex,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Beranda',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.report),
            label: 'Pengaduan',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profil',
          ),
        ],
      ),
    );
  }
}

class HomeScreenContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Lapor Guys",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blue,
      ),
      body: SingleChildScrollView(
        child: Column(
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
              "Di balik kemewahan kehidupan urban, ternyata tersimpan sisi lain yang memberi pengaruh bagi kesehatan, terutama kesehatan mental Anda. Masalah kesehatan mental di indonesia terutama bagi masyarakat yang tinggal di perkotaan nyatanya bukan isapan jempol belaka.",
              'assets/images/artikel4.png',
            ),
            buildArticleCard(
              context,
              "Manfaat Olahraga Rutin",
              "Olahraga rutin memiliki banyak manfaat bagi tubuh dan pikiran. Apa saja manfaat olahraga dan bagaimana cara memulainya? Yuk, kita bahas.",
              'assets/images/artikel5.png',
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          GoogleSignIn().signOut();
          FirebaseAuth.instance
              .signOut()
              .then((value) => Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const LoginScreen(),
                    ),
                    (route) => false,
                  ));
        },
        child: const Icon(Icons.logout),
      ),
    );
  }

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
      child: Card(
        elevation: 5,
        margin: EdgeInsets.all(10),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.vertical(top: Radius.circular(15)),
              child: Image.asset(
                imagePath, // Menggunakan asset image
                height: 150,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    description,
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey[700],
                    ),
                    maxLines: 2, // Menampilkan hanya 2 baris dari deskripsi
                    overflow: TextOverflow
                        .ellipsis, // Menyembunyikan teks yang overflow
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
