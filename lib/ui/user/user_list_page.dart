import 'package:firebase_intern_sample_app/data/albums.dart';
import 'package:firebase_intern_sample_app/model/album_model.dart';
import 'package:firebase_intern_sample_app/ui/user/second_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class UserListPage extends StatefulWidget {
  const UserListPage({Key? key}) : super(key: key);

  @override
  State<UserListPage> createState() => _UserListPageState();
}

class _UserListPageState extends State<UserListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      appBar: AppBar(
        backgroundColor: Colors.black12,
        centerTitle: true,
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
        title: Text('Welcome back...'),
      ),
      body: GridView.custom(
        gridDelegate: SliverWovenGridDelegate.count(
          crossAxisCount: 2,
          mainAxisSpacing: 0,
          crossAxisSpacing: 0,
          pattern: [
            WovenGridTile(1),
            WovenGridTile(
              0.9,
              crossAxisRatio: 0.9,
              alignment: AlignmentDirectional.centerEnd,
            ),
          ],
        ),
        childrenDelegate: SliverChildBuilderDelegate(
          childCount: 16,
          (context, index) => _Tile(index),
        ),
      ),
    );
  }
}

class _Tile extends StatelessWidget {
  _Tile(this.index);

  final int index;

  @override
  Widget build(BuildContext context) {
    List<Album> albums = [
      Albums().album1,
      Albums().album2,
      Albums().album3,
      Albums().album4,
      Albums().album5,
      Albums().album6,
      Albums().album7,
      Albums().album8,
      Albums().album9,
      Albums().album10,
      Albums().album11,
      Albums().album12,
      Albums().album13,
      Albums().album14,
      Albums().album15,
      Albums().album16
    ];
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => SecondPage(
              myAlbum: albums[index],
            ),
          ),
        );
      },
      child: Container(
        margin: EdgeInsets.all(15),
        child: Image.asset('lib/assets/${1 + index}.jpg'),
      ),
    );
  }
}
