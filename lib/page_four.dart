import 'package:flutter/material.dart';
import 'package:myfluter/page_five.dart';

import 'difficulty_in_choosing.dart';

class PageFour extends StatefulWidget {
  PageFour({Key? key, required this.txt}) : super(key: key);

  final String txt;

  @override
  State<PageFour> createState() => _PageFourState();
}

class _PageFourState extends State<PageFour> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text("第四页"),
        ),
        body: Container(
            alignment: Alignment.center,
            child: Column(
              children: <Widget>[
                const SizedBox(height: 40.0),
                Text(
                  widget.txt,
                  style: const TextStyle(
                      fontSize: 16.0, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 40.0),
                ElevatedButton(
                    onPressed: () => Navigator.pop(context, "第四页返回的888"),
                    child: const Text("返回")),
                ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(Colors.red)),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const PageFive()));
                    },
                    child: const Text(
                      "页面跳转",
                      style: TextStyle(fontSize: 16.0),
                    ))
              ],
            )));
  }
}
