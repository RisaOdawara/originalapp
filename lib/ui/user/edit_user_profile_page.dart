import 'dart:io';

import 'package:flutter/material.dart';

import '../screen.dart';

class EditUserProfilePage extends StatefulWidget {
  const EditUserProfilePage({Key? key}) : super(key: key);

  @override
  State<EditUserProfilePage> createState() => _EditUserProfilePageState();
}

class _EditUserProfilePageState extends State<EditUserProfilePage> {
  File? image;
  TextEditingController userNameController = TextEditingController();
  TextEditingController selfIntroductionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    TextEditingController userNameController = TextEditingController();
    TextEditingController selfIntroductionController = TextEditingController();
    return Scaffold(
      backgroundColor: Colors.black26,
      appBar: AppBar(
        backgroundColor: Colors.black12,
        title: const Text('プロフィール編集'),
      ),
      body: Container(
          width: double.infinity,
          padding: EdgeInsets.only(left: 50, right: 50),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 80,
                child: Icon(Icons.add),
              ),
              const SizedBox(height: 40),
              TextField(
                style: TextStyle(color: Colors.white),
                controller: userNameController,
                decoration: const InputDecoration(
                    enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white)),
                    hintText: '名前',
                    hintStyle: TextStyle(color: Colors.white)),
                maxLength: 10,
              ),
              const SizedBox(height: 30),
              TextField(
                style: TextStyle(color: Colors.white),
                controller: selfIntroductionController,
                decoration: const InputDecoration(
                    enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white)),
                    hintText: '自己紹介',
                    hintStyle: TextStyle(color: Colors.white)),
                maxLength: 25,
              ),
              const SizedBox(height: 80),
              SizedBox(
                height: 40,
                width: 100,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      shape: StadiumBorder(), primary: Colors.white70),
                  onPressed: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Screen()));
                  },
                  child: const Text(
                    '登録',
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87),
                  ),
                ),
              ),
            ],
          )),
    );
  }
}
