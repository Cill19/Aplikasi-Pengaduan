# LaporGuys

LaporGuys adalah aplikasi pelaporan insiden yang dirancang untuk memudahkan masyarakat dalam melaporkan berbagai kejadian dan insiden di sekitar mereka. Aplikasi ini dilengkapi dengan fitur-fitur untuk melaporkan insiden, mengakses panduan keselamatan, dan layanan darurat.

## Fitur

- **Laporan Insiden**: Pengguna dapat melaporkan insiden dengan detail lengkap.
- **Panduan Keselamatan**: Panduan tentang berbagai situasi darurat dan cara mengatasinya.
- **Layanan Darurat**: Informasi kontak darurat yang bisa dihubungi.

## Teknologi yang Digunakan

- **Flutter**: Framework untuk pengembangan aplikasi mobile.
- **Firebase**: Backend untuk otentikasi, database, dan hosting.
- **Flutter Bloc**: State management untuk aplikasi Flutter.

## Instalasi

1. **Clone Repository**
   ```sh
   git clone https://github.com/username/LaporGuys.git
   cd LaporGuys
2. **Install Dependencies**
   ```sh
   flutter pub get
4. **Configure Firebase**
   ```sh
   Ikuti petunjuk di Firebase Documentation untuk mengonfigurasi proyek Firebase Anda.
   Salin file google-services.json (untuk Android) dan GoogleService-Info.plist (untuk iOS) ke direktori yang sesuai.
6. **Run Application**
   ```sh
   flutter run
8. **Struktur Proyek**
   ```sh
   lib/
   ├── bloc/               # Business Logic Components
   ├── ui/                 # User Interface
   │   ├── onboarding.dart
   │   ├── article_detail_screen.dart
   │   ├── detail_pengaduan.dart
   │   └── pengaduan_screen.dart
   ├── utils/              # Utilities
   │   ├── routes.dart
   │   └── firebase_options.dart
   └── main.dart           # Entry Point

# Cara Penggunaan
   ## Laporan Insiden
      Buka aplikasi dan pilih "Laporan Insiden".
      Isi form laporan dengan detail insiden.
      Klik "Kirim" untuk mengirim laporan.
   ## Panduan Keselamatan
      Pilih "Panduan Keselamatan" dari menu utama.
      Baca panduan yang tersedia untuk berbagai situasi darurat.
   ## Layanan Darurat
      Pilih "Layanan Darurat" dari menu utama.
      Hubungi kontak darurat yang tersedia sesuai kebutuhan.
# Kontribusi
   Fork repository ini.
   Buat branch baru untuk fitur atau perbaikan Anda (git checkout -b fitur-anda).
   Commit perubahan Anda (git commit -am 'Tambah fitur').
   Push ke branch (git push origin fitur-anda).
   Buat Pull Request.
   Lisensi
   Proyek ini dilisensikan di bawah lisensi MIT. Lihat file LICENSE untuk informasi lebih lanjut.

# Kontak
   Untuk pertanyaan atau dukungan lebih lanjut, silakan hubungi kami di:

   Email: aqilbahri1234@gmail.com

# Terima kasih telah menggunakan LaporGuys! 🚀
### Penjelasan
- **Fitur**: Menjelaskan fitur utama aplikasi.
- **Teknologi yang Digunakan**: Daftar teknologi yang digunakan dalam pengembangan aplikasi.
- **Instalasi**: Panduan untuk mengkloning repository, menginstal dependensi, mengonfigurasi Firebase, dan menjalankan aplikasi.
- **Struktur Proyek**: Gambaran umum tentang struktur direktori proyek.
- **Cara Penggunaan**: Petunjuk singkat untuk menggunakan fitur utama aplikasi.
- **Kontribusi**: Instruksi untuk berkontribusi pada proyek.
- **Lisensi**: Informasi lisensi proyek.
- **Kontak**: Informasi kontak untuk pertanyaan atau dukungan.
- **Screenshots**: Tangkapan layar aplikasi untuk memberikan gambaran visual kepada pengguna.
