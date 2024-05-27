import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:praktikum06/bloc/login/login_cubit.dart';
import 'package:praktikum06/ui/home_screen.dart';
import '../utils/routes.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailEdc = TextEditingController();
  final passEdc = TextEditingController();
  bool passInvisible = false;

  Future<UserCredential> signInWithGoogle() async {
    final GoogleSignInAccount? gUser = await GoogleSignIn().signIn();
    final GoogleSignInAuthentication gAuth = await gUser!.authentication;
    final credential = GoogleAuthProvider.credential(
      accessToken: gAuth.accessToken,
      idToken: gAuth.idToken,
    );
    return await FirebaseAuth.instance.signInWithCredential(credential).then(
        (value) async => await Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => HomeScreen()),
            (route) => false));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<LoginCubit, LoginState>(
        listener: (context, state) {
          if (state is LoginLoading) {
            ScaffoldMessenger.of(context)
              ..hideCurrentSnackBar()
              ..showSnackBar(SnackBar(content: Text('Loading..')));
          }
          if (state is LoginFailure) {
            ScaffoldMessenger.of(context)
              ..hideCurrentSnackBar()
              ..showSnackBar(SnackBar(
                content: Text(state.msg),
                backgroundColor: Colors.red,
              ));
          }
          if (state is LoginSuccess) {
            ScaffoldMessenger.of(context)
              ..hideCurrentSnackBar()
              ..showSnackBar(SnackBar(
                content: Text(state.msg),
                backgroundColor: Colors.green,
              ));
            Navigator.pushNamedAndRemoveUntil(context, rHome, (route) => false);
          }
        },
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 30, vertical: 70),
          child: ListView(
            children: [
              Center(
                child: Column(
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Selamat Datang",
                      style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                        color: Color(0xff3D4DE0),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      width: 200,
                      height: 200,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/images/login.jpg'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Opacity(
                opacity: 0.5,
                child: Column(
                  children: [
                    SizedBox(
                      height: 15,
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    TextFormField(
                      controller: emailEdc,
                      decoration: InputDecoration(
                        hintText: 'Masukan email',
                        contentPadding:
                            EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                        prefixIcon: Icon(Icons.email, color: Colors.grey),
                        border: OutlineInputBorder(),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      controller: passEdc,
                      decoration: InputDecoration(
                        hintText: 'Masukan password',
                        contentPadding:
                            EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                        prefixIcon: Icon(Icons.lock, color: Colors.grey),
                        suffixIcon: IconButton(
                          icon: Icon(passInvisible
                              ? Icons.visibility
                              : Icons.visibility_off),
                          onPressed: () {
                            setState(() {
                              passInvisible = !passInvisible;
                            });
                          },
                        ),
                        border: OutlineInputBorder(),
                      ),
                      obscureText: !passInvisible,
                    ),
                    SizedBox(
                      height: 50,
                    ),
                  ],
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  context
                      .read<LoginCubit>()
                      .login(email: emailEdc.text, password: passEdc.text);
                },
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  padding: EdgeInsets.all(20),
                  backgroundColor: Color(0xff3D4DE0),
                  // gradient: LinearGradient(
                  //   colors: [Color(0xFF90CAF9), Color(0xFF42A5F5), Color(0xFF1E88E5)],
                  // ),
                ),
                child: Text(
                  "Login",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  OutlinedButton(
                    onPressed: () {
                      signInWithGoogle();
                    },
                    style: OutlinedButton.styleFrom(
                      side: BorderSide(
                          color: Colors.black), // Warna garis tepi hitam
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: Row(
                      children: [
                        CircleAvatar(
                          radius: 15.0,
                          backgroundImage: AssetImage(
                            'assets/images/googleLogo.png',
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          "Login dengan Google",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 25,
              ),
              Row(
                mainAxisAlignment:
                    MainAxisAlignment.center, //Menengahkan elemen horizontal
                children: [
                  Text("Belum punya akun ?"),
                  TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/register');
                      },
                      child: Text(
                        "Daftar",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Color(0xff3D4DE0)),
                      ))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
