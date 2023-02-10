import 'package:flutter/material.dart';
import 'not_recorded_page.dart';

class FourthPage extends StatefulWidget {
  const FourthPage({Key? key, required this.txt}) : super(key: key);

  final String txt;

  @override
  State<FourthPage> createState() => _FourthPageState();
}

class _FourthPageState extends State<FourthPage> {
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
                              builder: (context) => const NotRecordedPage()));
                    },
                    child: const Text(
                      "页面跳转",
                      style: TextStyle(fontSize: 16.0),
                    ))
              ],
            )));
  }
}
