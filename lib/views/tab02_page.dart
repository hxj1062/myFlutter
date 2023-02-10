import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Tab02Page extends StatefulWidget {
  const Tab02Page({Key? key}) : super(key: key);

  @override
  State<Tab02Page> createState() => _Tab02PageState();
}

class _Tab02PageState extends State<Tab02Page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Text("测试二"),
      ),
      body: Center(
        child: Text("孤城遥望玉门关", style: TextStyle(fontSize: 18)),
      ),
    );
  }
}
