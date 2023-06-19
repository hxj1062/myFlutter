import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myfluter/views/tab01_page.dart';
import 'package:myfluter/views/tab02_page.dart';
import 'package:myfluter/views/tab03_page.dart';
import 'package:myfluter/views/tab04_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int selectPage = 0;

  final _pageNo = const [Tab01Page(), Tab02Page(), Tab03Page(), Tab04Page()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pageNo[selectPage],
      bottomNavigationBar: ConvexAppBar(
        items: const [
          TabItem(icon: Icons.person, title: "Tab1"),
          TabItem(icon: Icons.favorite, title: "Tab2"),
          TabItem(icon: Icons.phone_android, title: "Tab3"),
          TabItem(icon: Icons.photo_camera, title: "Tab4")
        ],
        color: Colors.grey,
        backgroundColor: Colors.white,
        activeColor: Colors.blue,
        top: 0,
        initialActiveIndex: selectPage,
        onTap: (int index) {
          setState(() {
            selectPage = index;
          });
        },
      ),
    );
  }
}
