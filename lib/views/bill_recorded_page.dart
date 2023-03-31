import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../utils/common_utils.dart';
import 'line_segment.dart';

class BillRecordedPage extends StatefulWidget {
  const BillRecordedPage({Key? key}) : super(key: key);

  @override
  State<BillRecordedPage> createState() => _BillRecordedPageState();
}

class _BillRecordedPageState extends State<BillRecordedPage> {
  int groupValue = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          // 去除阴影
          elevation: 0.0,
          centerTitle: true,
          title: const Text("收支账单"),
          backgroundColor: const Color(0xFF3090FF),
          actions: [
            IconButton(
                onPressed: () {
                  Fluttertoast.showToast(
                      msg: "月账单的数据，当前仅做展示使用，如有疑问请及时与工作人员联系。",
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.CENTER,
                      timeInSecForIosWeb: 2,
                      backgroundColor: const Color(0xFF333333),
                      textColor: const Color(0xFFFFFFFF),
                      fontSize: 14.0);
                },
                icon: Image.asset(
                  "assets/images/union_icon.png",
                  height: 16.0,
                  width: 16.0,
                ))
          ],
        ),
        body: _body());
  }

  Widget _body() {
    return Container(
      color: const Color(0xff3090FF),
      child: Column(
        children: [
          InkWell(
            onTap: () {
              showDate();
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "2023-03",
                  style: TextStyle(color: Colors.white),
                ),
                Image.asset("assets/images/arrow_expand.png",
                    height: 10.0, width: 10.0)
              ],
            ),
          ),
          SizedBox(height: 24.0),
          Text("账单金额(元)",
              style: TextStyle(color: Colors.white, fontSize: 14.0)),
          SizedBox(height: 4.0),
          Text("8888.8", style: TextStyle(color: Colors.white, fontSize: 24.0)),
          _buildLineSegmentControl(Color(0xFF3090FF),
              lineColor: Color(0xFF3090FF)),
          Container(
              color: Colors.white,
              padding: EdgeInsets.all(12.0),
              child: Row(
                children: [
                  Text("日期"),
                  Spacer(flex: 1),
                  Text("费用名称"),
                  Spacer(flex: 1),
                  Text("金额(元)"),
                ],
              )),
          Expanded(
            child: Container(
              color: Colors.white,
              child: ListView.builder(
                  itemCount: 10,
                  itemExtent: 65.0,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      child: _itemView(),
                    );
                  }),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildLineSegmentControl(Color? backgroundColor,
      {required Color lineColor}) {
    Map<int, Widget> children = <int, Widget>{
      0: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Text("收入合计(元)", style: TextStyle(color: Colors.white, fontSize: 14.0)),
        SizedBox(height: 4.0),
        Text("+666.00", style: TextStyle(color: Colors.white, fontSize: 14.0))
      ]),
      1: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Text("支出合计(元)", style: TextStyle(color: Colors.white, fontSize: 14.0)),
        SizedBox(height: 4.0),
        Text("-888.00", style: TextStyle(color: Colors.white, fontSize: 14.0))
      ])
    };
    if (backgroundColor != null) {
      return LineSegmentControl(
        groupValue: groupValue,
        children: children,
        backgroundColor: backgroundColor,
        lineColor: lineColor,
        onValueChanged: (i) {
          setState(() {
            groupValue = int.parse("$i");
          });
        },
      );
    }
    return LineSegmentControl(
      groupValue: groupValue,
      children: children,
      backgroundColor: backgroundColor,
      lineColor: lineColor,
      onValueChanged: (i) {
        setState(() {
          groupValue = int.parse("$i");
        });
      },
    );
  }

  showDate() {
    DatePicker.showDatePicker(context,
        showTitleActions: true,
        minTime: DateTime(2018, 3),
        maxTime: DateTime(2019, 6),
        theme: DatePickerTheme(
            headerColor: Colors.grey,
            backgroundColor: Colors.green,
            itemStyle: TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18),
            doneStyle: TextStyle(color: Colors.white, fontSize: 16)),
        onChanged: (date) {
      print('change $date in time zone ' +
          date.timeZoneOffset.inHours.toString());
    }, onConfirm: (date) {
      print('confirm $date');
    }, currentTime: DateTime.now(), locale: LocaleType.zh);
  }

  Widget _itemView() {
    return Container(
        padding: EdgeInsets.all(12.0),
        child: Row(
          children: [
            Text("2023-02"),
            Spacer(flex: 1),
            Text("费jhjdjkshnfk哈哈哈"),
            Spacer(flex: 1),
            Text("-866556"),
          ],
        ));
  }
}
