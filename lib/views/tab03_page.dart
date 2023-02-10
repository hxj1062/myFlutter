import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Tab03Page extends StatefulWidget {
  const Tab03Page({Key? key}) : super(key: key);

  @override
  State<Tab03Page> createState() => _Tab03PageState();
}

class _Tab03PageState extends State<Tab03Page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Text("测试三"),
      ),
      body: const Center(
        child: Text(
          "黄沙百战穿金甲",
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}
