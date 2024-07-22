import 'dart:core';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:myfluter/style/color_style.dart';
import 'line_segment.dart';
import 'package:flutter/services.dart';

class PaymentPage extends StatefulWidget {
  const PaymentPage({Key? key}) : super(key: key);

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
            automaticallyImplyLeading: false,
            title: Container(
              alignment: Alignment.center,
              width: double.infinity,
              child: TabBar(
                dividerColor: Colors.white,
                tabs: [
                  Tab(text: '付款日'),
                  Tab(text: '订单'),
                ],
                tabAlignment: TabAlignment.center,
              ),
            )),
        body: TabBarView(
          children: [
            _tabPayment(),
            _tabOrder(),
          ],
        ),
      ),
    );
  }

  Widget _tabPayment() {
    return Column(children: [
      Container(
        child: Row(
          children: [
            Image(
              image: AssetImage("assets/images/ic_inform.png"),
              width: 10,
              height: 10,
            ),
            Text(
              "2024年7月1日起，友客云提供消费者付款日的查询功能",
              style: TextStyle(color: ColorsStyle.c_FF6C00),
            )
          ],
        ),
      )
    ]);
  }

  Widget _tabOrder() {
    return Column(children: []);
  }
}
