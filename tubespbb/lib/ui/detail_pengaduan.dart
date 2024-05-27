import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailPengaduan extends StatefulWidget {
  const DetailPengaduan({Key? key}) : super(key: key);

  @override
  _DetailPengaduanState createState() => _DetailPengaduanState();
}

class _DetailPengaduanState extends State<DetailPengaduan> {
  // URL WhatsApp yang dituju
  static const String whatsappUrl = 'https://wa.link/ru3c16';

  // Kontroller untuk TextFormField
  final TextEditingController _textController = TextEditingController();

  // Method untuk membersihkan kontroller setelah layar di dispose
  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  // Method untuk membuka URL WhatsApp
  void _openWhatsApp(BuildContext context, String message) async {
    // Encode pesan untuk menghindari karakter khusus
    final encodedMessage = Uri.encodeComponent(message);

    // Gabungkan URL dengan pesan
    final url = '$whatsappUrl?text=$encodedMessage';

    // Buka URL dengan aplikasi WhatsApp
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Tidak dapat membuka WhatsApp.'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail Pengaduan', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Form Laporan',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            // Tambahkan box untuk pengisian teks pengaduan
            TextFormField(
              controller: _textController, // Gunakan kontroller
              maxLines: 5,
              maxLength: 200, // Batasi maksimal 200 karakter
              decoration: InputDecoration(
                hintText: 'Tuliskan pengaduan Anda di sini...',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            // Tambahkan tombol untuk membuka WhatsApp
            ElevatedButton.icon(
              onPressed: () {
                // Dapatkan nilai teks dari TextFormField menggunakan kontroller
                final text = _textController.text;
                // Panggil method untuk membuka URL WhatsApp dengan pesan yang dimasukkan oleh pengguna
                _openWhatsApp(context, text);
              },
              icon: Image.asset(
                'assets/images/wa.png',
                width: 24,
                height: 24,
              ), // Ikon dari aset
              label: Text('Kirim via WhatsApp'),
              style: ElevatedButton.styleFrom(
                backgroundColor:
                    Color(0xFF25D366), // Warna hijau seperti logo WhatsApp
              ),
            ),
          ],
        ),
      ),
    );
  }
}
