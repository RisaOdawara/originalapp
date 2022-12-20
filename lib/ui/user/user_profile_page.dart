import 'package:firebase_intern_sample_app/model/account_model.dart';
import 'package:firebase_intern_sample_app/ui/user/edit_user_profile_page.dart';
import 'package:flutter/material.dart';

class UserProfilePage extends StatefulWidget {
  const UserProfilePage({Key? key}) : super(key: key);

  @override
  State<UserProfilePage> createState() => _UserProfilePageState();
}

class _UserProfilePageState extends State<UserProfilePage> {
  Account myAccount = Account(
    id: '1',
    imagePath:
        'https://reraku.jp/wp-content/themes/reraku/src/images/shared/courses/hiro.jpg',
    userName: 'りっちゃん',
    selfIntroduction: '＃横浜＃大学生＃犬＃旅行＃洋楽＃映画',
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      appBar: AppBar(
        backgroundColor: Colors.black12,
        title: const Text('プロフィール'),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {},
          ),
        ],
      ),
      body: Container(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              backgroundColor: Colors.black12,
              radius: 80,
              child: Image.asset('lib/assets/home_2.png'),
            ),
            const SizedBox(height: 10),
            Text(
              myAccount.userName,
              style: TextStyle(fontSize: 30, color: Colors.white),
            ),
            const SizedBox(height: 30),
            Text(
              myAccount.selfIntroduction,
              style: TextStyle(fontSize: 15, color: Colors.white),
            ),
            const SizedBox(height: 80),
            SizedBox(
              height: 40,
              width: 100,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    shape: StadiumBorder(), primary: Colors.white70),
                onPressed: () async {
                  await Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => EditUserProfilePage()));
                },
                child: const Text(
                  '編集',
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
    );
  }
}
