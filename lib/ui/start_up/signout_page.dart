import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_intern_sample_app/ui/start_up/sign_in_page.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class SignoutPage extends StatefulWidget {
  const SignoutPage({super.key});

  @override
  State<SignoutPage> createState() => _HomePageState();
}

class _HomePageState extends State<SignoutPage> {
  Future<void> singOut() async {
    await GoogleSignIn().signOut();
    await FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black12,
      appBar: AppBar(
        backgroundColor: Colors.black87,
      ),
      body: Stack(
        children: [
          Positioned(
              left: 80,
              top: 160,
              child: Container(
                  padding: EdgeInsets.all(20),
                  alignment: Alignment.center,
                  width: 270,
                  height: 270,
                  child: Image.asset(
                    'lib/assets/home_2.png',
                    fit: BoxFit.contain,
                  ))),
          Positioned(
            left: 145,
            top: 470,
            child: SizedBox(
              height: 50,
              width: 130,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    shape: StadiumBorder(), primary: Colors.white70),
                onPressed: () async {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    },
                  );
                  await singOut();
                  if (!mounted) {
                    return;
                  }
                  Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(builder: (context) {
                      return const SignInPage();
                    }),
                    (route) => false,
                  );
                },
                child: const Text(
                  'ログアウト',
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
