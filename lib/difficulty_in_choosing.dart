import 'package:flutter/material.dart';

class ChoiceResult extends StatefulWidget {
  const ChoiceResult({Key? key}) : super(key: key);

  @override
  State<ChoiceResult> createState() => _ChoiceResultState();
}

class _ChoiceResultState extends State<ChoiceResult> {
  int _groupValue = 1;
  List options = ["普通事项", "重要事项", "紧急事项", "紧急且重要", "庆祝事项", "未定义2"];
  List colors = [
    Colors.red,
    Colors.yellow,
    Colors.blue,
    Colors.green,
    Colors.black,
    Colors.blueGrey
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text("事项标签"),
        ),
        body: ListView.builder(
            itemCount: 6,
            itemExtent: 50.0, //强制高度为50.0
            itemBuilder: (BuildContext context, int index) {
              var str = options[index];
              return Container(
                child: getItem(str, index),
              );
            }));
  }

  Widget getItem(String str, int index) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Wrap(
          crossAxisAlignment: WrapCrossAlignment.center,
          children: [
            Container(
              margin: const EdgeInsets.only(left: 20.0, right: 6.0),
              width: 10.0,
              height: 10.0,
              color: colors[index],
            ),
            Text(
              str,
              style: const TextStyle(fontSize: 16.0, color: Colors.black),
            )
          ],
        ),
        Radio(
          materialTapTargetSize: MaterialTapTargetSize.padded,
          activeColor: colors[index],
          fillColor: MaterialStateProperty.all(colors[index]),
          value: index,
          groupValue: _groupValue,
          onChanged: (int? value) {
            setState(() {
              _groupValue = value!;
            });
          },
        ),
      ],
    );
  }
}
