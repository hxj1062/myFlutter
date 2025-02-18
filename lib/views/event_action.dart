import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../style/color_style.dart';

class EventAction extends StatefulWidget {
  const EventAction({Key? key}) : super(key: key);

  @override
  State<EventAction> createState() => _EventActionState();
}

class _EventActionState extends State<EventAction> {
  // 记录当前选中的按钮
  int selectedIndex = -1;

  // 按钮文案
  final List<String> buttonLabels = [
    '今日',
    '昨日',
    '近7日',
    '上月',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          centerTitle: true,
          title: const Text("多事件单选"),
          backgroundColor: const Color(0xff3090FF),
        ),
        body: dateAction());
  }

  Widget dateAction() {
    return Row(
      children: List.generate(buttonLabels.length, (index) {
        return Expanded(
          child: GestureDetector(
            onTap: () {
              setState(() {
                selectedIndex = index;
              });
            },
            child: Container(
              margin: const EdgeInsets.only(left: 8, top: 4, bottom: 4, right: 8),
              width: 40,
              height: 30,
              decoration: BoxDecoration(
                border: Border.all(
                  color: selectedIndex == index ? Colors.blue : Colors.grey,
                  width: 1,
                ),
                borderRadius: BorderRadius.circular(6),
                color: selectedIndex == index ? Colors.blue.withOpacity(0.1) : Colors.transparent,
              ),
              child: Center(
                child: Text(
                  buttonLabels[index],
                  style: TextStyle(
                    fontSize: 16,
                    color: selectedIndex == index ? Colors.blue : Colors.grey,
                  ),
                ),
              ),
            ),
          ),
        );
      }),
    );
  }


}
