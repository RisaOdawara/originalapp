import 'package:firebase_intern_sample_app/model/album_model.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class SecondPage extends StatelessWidget {
  final Album myAlbum;

  const SecondPage({required this.myAlbum, super.key});
  @override
  Widget build(BuildContext context) {
    ThemeData(
        primarySwatch: Colors.blueGrey,
        textTheme: GoogleFonts.zenMaruGothicTextTheme());
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.black87),
      body: Container(
        height: double.infinity,
        color: Colors.black87,
        width: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                myAlbum.imagePath,
                width: width,
              ),
              const SizedBox(height: 15),
              Text(
                myAlbum.title,
                style: const TextStyle(
                    fontSize: 35,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 15),
              const Text(
                'アーティスト：',
                style: TextStyle(
                    fontSize: 15,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                myAlbum.artist,
                style: const TextStyle(fontSize: 15, color: Colors.white),
              ),
              const SizedBox(height: 10),
              const Text(
                'デザイナー：',
                style: TextStyle(
                    fontSize: 15,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                myAlbum.designer,
                style: const TextStyle(fontSize: 15, color: Colors.white),
              ),
              const SizedBox(height: 10),
              const Text(
                'リリース年：',
                style: TextStyle(
                    fontSize: 15,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                myAlbum.release,
                style: const TextStyle(fontSize: 15, color: Colors.white),
              ),
              const SizedBox(height: 10),
              const Text(
                'タイプ：',
                style: TextStyle(
                    fontSize: 15,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                myAlbum.type,
                style: const TextStyle(fontSize: 15, color: Colors.white),
              ),
              const SizedBox(height: 10),
              const Text(
                'ジャンル：',
                style: TextStyle(
                    fontSize: 15,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                myAlbum.genre,
                style: const TextStyle(fontSize: 15, color: Colors.white),
              ),
              const SizedBox(height: 30),
              SizedBox(
                height: 40,
                width: 125,
                child: ElevatedButton(
                  style: const ButtonStyle(
                      backgroundColor:
                          MaterialStatePropertyAll(Colors.white70)),
                  onPressed: () async {
                    final url = Uri.parse(
                      myAlbum.music,
                    );
                    if (await canLaunchUrl(url)) {
                      launchUrl(url);
                    }
                  },
                  child: const Text(
                    '聞いてみる',
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
