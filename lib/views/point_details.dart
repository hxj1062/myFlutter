import 'dart:core';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:myfluter/style/color_style.dart';
import 'line_segment.dart';
import 'package:flutter/services.dart';

class PointDetailsPage extends StatefulWidget {
  const PointDetailsPage({Key? key}) : super(key: key);

  @override
  State<PointDetailsPage> createState() => _PointDetailsPageState();
}

class _PointDetailsPageState extends State<PointDetailsPage> {
  List<TestModel> testList = [];

  @override
  void initState() {
    super.initState();
    _initData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(
            color: Colors.white, // 设置返回箭头颜色为白色
          ),
          elevation: 0.0,
          centerTitle: true,
          title: const Text("点位详情", style: TextStyle(color: Colors.white)),
          backgroundColor: const Color(0xFF53B7FF),
        ),
        body: _body());
  }

  Widget _body() {
    return Container(
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.only(top: 10, bottom: 10, left: 18),
            width: double.infinity,
            color: Colors.white,
            child: Text(
              "75512346(天健A塔4楼展厅)",
              style: TextStyle(color: Colors.black, fontSize: 15.0),
            ),
          ),
          Container(
            width: double.infinity,
            padding: EdgeInsets.only(top: 10, bottom: 10, left: 18),
            child: Text(
              "订单日期：2024.07.05 至 2024.07.10",
              style: TextStyle(color: ColorsStyle.c_979797, fontSize: 15.0),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                  child: Container(
                margin: EdgeInsets.fromLTRB(10, 0, 3, 10),
                padding: EdgeInsets.fromLTRB(40, 20, 40, 20),
                color: Colors.white,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("付款金额",
                          style: TextStyle(
                              color: ColorsStyle.c_999999, fontSize: 16.0)),
                      SizedBox(height: 6.0),
                      Text("50",
                          style: TextStyle(color: Colors.black, fontSize: 16.0))
                    ]),
              )),
              Expanded(
                  child: Container(
                margin: EdgeInsets.fromLTRB(3, 0, 10, 10),
                padding: EdgeInsets.fromLTRB(40, 20, 40, 20),
                color: Colors.white,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("付款商品数",
                          style: TextStyle(
                              color: ColorsStyle.c_999999, fontSize: 16.0)),
                      SizedBox(height: 6.0),
                      Text("11",
                          style: TextStyle(color: Colors.black, fontSize: 16.0))
                    ]),
              ))
            ],
          ),
          Expanded(
            child: Container(
              color: const Color(0xFFf5f5f5),
              child: ListView.separated(
                itemBuilder: (BuildContext context, int index) {
                  var model = testList[index];
                  return Container(
                    color: Colors.white,
                    child: _itemContent(model),
                  );
                },
                separatorBuilder: (BuildContext context, int index) {
                  var model = testList[index];
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
                itemCount: testList.length,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _itemContent(TestModel content) {
    return Container(
        margin: EdgeInsets.all(10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: 90,
              child: Text(
                textAlign: TextAlign.center,
                content.chargeDate,
                style: TextStyle(fontSize: 14.0),
              ),
            ),
            Container(
              width: 90,
              child: Text(
                textAlign: TextAlign.center,
                content.chargeName,
                style: TextStyle(fontSize: 14.0),
              ),
            ),
            Container(
              width: 90,
              child: Text(
                textAlign: TextAlign.center,
                content.orderTime,
                style: TextStyle(fontSize: 14.0),
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 10),
              width: 60,
              child: Text(
                textAlign: TextAlign.center,
                content.chargeAmount,
                style: TextStyle(fontSize: 14.0),
              ),
            )
          ],
        ));
  }

  _initData() {
    var data = TestModel();
    data.chargeDate = "商品名称";
    data.chargeName = "订单创建时间";
    data.orderTime = "付款时间";
    data.chargeAmount = "零售价";
    testList.add(data);

    data = TestModel();
    data.chargeDate = "可口可乐330ml";
    data.chargeName = "2024.07.05 17:59:41";
    data.orderTime = "2024.07.05 17:59:41";
    data.chargeAmount = "2.00";
    testList.add(data);

    data = TestModel();
    data.chargeDate = "华洋白桃樱花味果汁汽水330ml";
    data.chargeName = "2024.07.05 17:59:41";
    data.orderTime = "2024.07.05 17:59:41";
    data.chargeAmount = "6.66";
    testList.add(data);

    data = TestModel();
    data.chargeDate = "农夫山泉饮用天然水550ml";
    data.chargeName = "2024.07.05 17:59:41";
    data.orderTime = "2024.07.05 17:59:41";
    data.chargeAmount = "6.86";
    testList.add(data);
  }
}

class TestModel {
  double separator = 1.0;
  late String chargeDate;
  late String chargeName;
  late String orderTime;
  late String chargeAmount;
}
