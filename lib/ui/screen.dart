import 'package:firebase_intern_sample_app/ui/user/user_list_page.dart';
import 'package:firebase_intern_sample_app/ui/user/user_profile_page.dart';
import 'package:flutter/material.dart';

class _ScreenState extends State<Screen> {
  int selectedIndex = 0;
  List<Widget> pageList = [UserListPage(), UserProfilePage()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pageList[selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.white,
        backgroundColor: Colors.black87,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.home_outlined,
                color: Colors.grey,
              ),
              label: ''),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.perm_identity_outlined,
                color: Colors.grey,
              ),
              label: '')
        ],
        currentIndex: selectedIndex,
        onTap: (index) {
          setState(() {
            selectedIndex = index;
          });
        },
      ),
    );
  }
}

class Screen extends StatefulWidget {
  const Screen({Key? key}) : super(key: key);

  @override
  _ScreenState createState() => _ScreenState();
}
