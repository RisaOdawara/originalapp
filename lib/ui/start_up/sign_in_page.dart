import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_intern_sample_app/ui/screen.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  Future<UserCredential> signInWithGoogle() async {
    final googleUser = await GoogleSignIn().signIn();
    final googleAuth = await googleUser?.authentication;
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );
    final UserCredential result =
        await FirebaseAuth.instance.signInWithCredential(credential);
    final user = result.user;
    final users = user?.uid;

    FirebaseFirestore.instance.collection('user').doc(users).set({
      'uid': users,
    });
    return result;
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
                    await signInWithGoogle();
                    if (!mounted) {
                      return;
                    }
                    Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(builder: (context) {
                        return const Screen();
                      }),
                      (route) => false,
                    );
                  },
                  child: const Text(
                    'ログイン',
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87),
                  ),
                ),
              ),
            ),
          ],
        ));
  }
}
