import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Tab04Page extends StatefulWidget {
  const Tab04Page({Key? key}) : super(key: key);

  @override
  State<Tab04Page> createState() => _Tab04PageState();
}

class _Tab04PageState extends State<Tab04Page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Text("测试四"),
      ),
      body: const Center(
        child: Text(
          "示例四",
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}
