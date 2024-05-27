import 'package:flutter/material.dart';
import 'package:praktikum06/ui/kebijakan_privasi.dart';
import 'package:praktikum06/ui/layanan_pelanggan.dart';
import 'package:praktikum06/ui/tentang_kami.dart';
import 'edit_profile_screen.dart';
import 'personal_info_screen.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  late String _username;
  late String _email;

  @override
  void initState() {
    super.initState();
    // Initialize user data
    _username = 'Nama Pengguna'; // Replace with actual user data
    _email = 'email@example.com'; // Replace with actual user data
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Profil",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            UserInfoSection(username: _username, email: _email),
            SizedBox(height: 20),
            Expanded(
              child: ListView(
                children: [
                  ProfileMenuItem(
                    icon: Icons.person,
                    text: 'Informasi Pribadi',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => PersonalInfoScreen(),
                        ),
                      );
                    },
                  ),
                  ProfileMenuItem(
                    icon: Icons.info,
                    text: 'Tentang Kami',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AboutUsScreen(),
                        ),
                      );
                    },
                  ),
                  ProfileMenuItem(
                    icon: Icons.support,
                    text: 'Layanan Pelanggan',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CustomerServiceScreen(),
                        ),
                      );
                    },
                  ),
                  ProfileMenuItem(
                    icon: Icons.privacy_tip,
                    text: 'Kebijakan Privasi',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => PrivacyPolicyScreen(),
                        ),
                      );
                    },
                  ),
                  ProfileMenuItem(
                    icon: Icons.logout,
                    text: 'Keluar',
                    onTap: () {
                      _confirmLogout(context);
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _navigateToEditProfile() async {
    // Navigate to Edit Profile screen and wait for the result
    final result = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => EditProfileScreen(
          initialUsername: _username,
          initialEmail: _email,
        ),
      ),
    );

    // Update user data if there are changes
    if (result != null && result is Map<String, String>) {
      setState(() {
        _username = result['username']!;
        _email = result['email']!;
      });
    }
  }

  void _confirmLogout(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Konfirmasi Keluar"),
          content: Text("Apakah Anda yakin ingin keluar?"),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Tutup dialog
              },
              child: Text("Batal"),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text("Keluar"),
            ),
          ],
        );
      },
    );
  }
}

class UserInfoSection extends StatelessWidget {
  final String username;
  final String email;

  UserInfoSection({required this.username, required this.email});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          radius: 30,
          backgroundImage:
              AssetImage('assets/avatar.png'), // Replace with user's avatar
        ),
        SizedBox(width: 10),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Halo, $username!',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(email),
          ],
        ),
      ],
    );
  }
}

class ProfileMenuItem extends StatelessWidget {
  final IconData icon;
  final String text;
  final VoidCallback onTap;

  ProfileMenuItem(
      {required this.icon, required this.text, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon),
      title: Text(text),
      trailing: Icon(Icons.arrow_forward_ios),
      onTap: onTap,
    );
  }
}
