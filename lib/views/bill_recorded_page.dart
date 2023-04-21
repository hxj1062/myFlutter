import 'dart:core';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'line_segment.dart';
import 'package:flutter/services.dart';

class BillRecordedPage extends StatefulWidget {
  const BillRecordedPage({Key? key}) : super(key: key);

  @override
  State<BillRecordedPage> createState() => _BillRecordedPageState();
}

class _BillRecordedPageState extends State<BillRecordedPage> {
  List<BillRecord> datas = [];
  int groupValue = 0;

  @override
  void initState() {
    super.initState();
    initData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarBrightness: Brightness.light,
          ),
          // 去除阴影
          elevation: 0.0,
          centerTitle: true,
          title: const Text("收支账单"),
          backgroundColor: const Color(0xFF53B7FF),
          actions: [
            IconButton(
                onPressed: () {
                  Fluttertoast.showToast(
                      msg: "月账单的数据，当前仅做展示使用，如有疑问请及时与工作人员联系。",
                      toastLength: Toast.LENGTH_LONG,
                      gravity: ToastGravity.CENTER,
                      timeInSecForIosWeb: 2,
                      backgroundColor: Colors.black87,
                      textColor: const Color(0xFFFFFFFF),
                      fontSize: 14.0);
                },
                icon: Image.asset(
                  "assets/images/exclamatory_mark.png",
                  height: 16.0,
                  width: 16.0,
                ))
          ],
        ),
        body: _body());
  }

  Widget _body() {
    return Container(
      color: const Color(0xFF53B7FF),
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
                  style: TextStyle(color: Colors.white, fontSize: 15.0),
                ),
                Image.asset("assets/images/arrow_expand.png",
                    height: 10.0, width: 10.0)
              ],
            ),
          ),
          SizedBox(height: 24.0),
          Text("账单金额(元)",
              style: TextStyle(color: Colors.white, fontSize: 15.0)),
          SizedBox(height: 4.0),
          Text("8888.8", style: TextStyle(color: Colors.white, fontSize: 24.0)),
          _buildLineSegmentControl(Color(0xFF53B7FF),
              lineColor: Color(0xFF53B7FF)),
          Expanded(
            child: Container(
              color: const Color(0xFFf5f5f5),
              child: ListView.separated(
                itemBuilder: (BuildContext context, int index) {
                  var model = datas[index];
                  if (model.tag == 1) {
                    return Container(
                      color: Colors.white,
                      child: _itemHeader(model),
                    );
                  }
                  if (model.tag == 2) {
                    return Container(
                      color: Colors.white,
                      child: _itemContent(model),
                    );
                  }
                  return const SizedBox(
                    width: 1,
                    height: 1,
                  );
                },
                separatorBuilder: (BuildContext context, int index) {
                  var model = datas[index];
                  return index <= 4
                      ? Divider(
                          color: const Color(0xFFf5f5f5),
                          height: model.separator,
                          thickness: model.separator,
                        )
                      : Divider(
                          color: const Color(0xFFffffff),
                          height: 12.0,
                          thickness: model.separator,
                        );
                },
                itemCount: datas.length,
              ),
            ),
          ),
        ],
      ),
    );
  }

  initData() {
    var dataA = BillRecord();
    dataA.tag = 1;
    dataA.chargeDate = "日期";
    dataA.chargeName = "费用名称";
    dataA.chargeAmount = "金额(元)";
    datas.add(dataA);

    var dataB = BillRecord();
    dataB.tag = 2;
    dataB.chargeDate = "2023-03";
    dataB.chargeName = "营业额";
    dataB.chargeAmount = "88.88";
    datas.add(dataB);

    dataB = BillRecord();
    dataB.tag = 2;
    dataB.chargeDate = "2023-03";
    dataB.chargeName = "营业分成";
    dataB.chargeAmount = "66.66";
    datas.add(dataB);

    dataB = BillRecord();
    dataB.tag = 2;
    dataB.chargeDate = "2023-03";
    dataB.chargeName = "公司营销活动补偿";
    dataB.chargeAmount = "66.888";
    datas.add(dataB);

    dataB = BillRecord();
    dataB.tag = 2;
    dataB.chargeDate = "2023-03";
    dataB.chargeName = "友咖提成";
    dataB.chargeAmount = "88.6886";
    datas.add(dataB);
  }

  Widget _buildLineSegmentControl(Color? backgroundColor,
      {required Color lineColor}) {
    Map<int, Widget> children = <int, Widget>{
      0: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Text("收入合计(元)", style: TextStyle(color: Colors.white, fontSize: 15.0)),
        SizedBox(height: 4.0),
        Text("+666.00", style: TextStyle(color: Colors.white, fontSize: 15.0))
      ]),
      1: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Text("支出合计(元)", style: TextStyle(color: Colors.white, fontSize: 15.0)),
        SizedBox(height: 4.0),
        Text("-888.00", style: TextStyle(color: Colors.white, fontSize: 15.0))
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

  Widget _itemHeader(BillRecord header) {
    return Container(
        margin: EdgeInsets.fromLTRB(12.0, 18.0, 12.0, 18.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: 66,
              child: Text(header.chargeDate, style: TextStyle(fontSize: 14.0)),
            ),
            Container(
              width: 120,
              child: Text(
                header.chargeName,
                style: TextStyle(fontSize: 14.0),
              ),
            ),
            Container(
              alignment: Alignment.centerRight,
              width: 80,
              child: Text(
                header.chargeAmount,
                style: TextStyle(fontSize: 14.0),
              ),
            )
          ],
        ));
  }

  Widget _itemContent(BillRecord content) {
    return Container(
        margin: EdgeInsets.fromLTRB(12.0, 16.0, 12.0, 16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: 66,
              child: Text(
                content.chargeDate,
                style: TextStyle(fontSize: 14.0),
              ),
            ),
            Container(
              width: 120,
              child: Text(
                content.chargeName,
                style: TextStyle(fontSize: 14.0),
              ),
            ),
            Container(
              alignment: Alignment.centerRight,
              padding: EdgeInsets.only(left: 10),
              width: 80,
              child: Text(
                content.chargeAmount,
                style: TextStyle(fontSize: 14.0),
              ),
            )
          ],
        ));
  }

  showDate() {
    DatePicker.showDatePicker(context,
        showTitleActions: true,
        minTime: DateTime(1993, 6),
        maxTime: DateTime(2023, 6),
        theme: DatePickerTheme(
            headerColor: const Color(0xFFf5f5f5),
            backgroundColor: Colors.white,
            itemStyle: TextStyle(
                color: Colors.black, fontWeight: FontWeight.bold, fontSize: 18),
            cancelStyle: TextStyle(color: Color(0xFF53B7FF), fontSize: 16),
            doneStyle: TextStyle(color: Color(0xFF53B7FF), fontSize: 16)),
        onChanged: (date) {
      print('change $date in time zone ' +
          date.timeZoneOffset.inHours.toString());
    }, onConfirm: (date) {
      print('confirm $date');
    }, currentTime: DateTime.now(), locale: LocaleType.zh);
  }
}

class BillRecord {
  int tag = 0;
  double separator = 1.0;
  late String chargeDate;
  late String chargeName;
  late String chargeAmount;
}
