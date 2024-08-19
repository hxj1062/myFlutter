import 'dart:core';

import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:marquee/marquee.dart';
import 'package:myfluter/style/color_style.dart';
import 'package:myfluter/utils/common_utils.dart';
import 'package:myfluter/views/point_details.dart';
import 'package:myfluter/views/privacy_machine_page.dart';
import 'line_segment.dart';
import 'package:flutter/services.dart';

class PaymentPage extends StatefulWidget {
  const PaymentPage({Key? key}) : super(key: key);

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage>
    with TickerProviderStateMixin {
  late TabController _tabHeadController;
  late TabController _tabBodyController;
  List headTabs = ["已付款", "订单"];
  List bodyTabs = ["客户", "点位"];

  List<TestBean> list01 = [
    TestBean("NZB125816", "JM互联网与产品研发中心2.0"),
    TestBean("NZB126666", "深圳南山深圳湾公园"),
  ];
  List<TestBean> list02 = [
    TestBean("NZB666888", "田间创制"),
    TestBean("NZB100861", "测试仪二"),
  ];

  @override
  void initState() {
    super.initState();
    _tabHeadController = TabController(length: 2, vsync: this);
    _tabBodyController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
            automaticallyImplyLeading: false,
            title: Container(
              color: Colors.blue,
              alignment: Alignment.center,
              width: double.infinity,
              child: TabBar(
                controller: _tabHeadController,
                isScrollable: false,
                labelStyle: TextStyle(fontSize: 18),
                dividerColor: Colors.blue,
                indicatorColor: Colors.white,
                labelColor: Colors.white,
                unselectedLabelColor: ColorsStyle.c_E5E5E5,
                tabs: headTabs.map((e) => Tab(text: e)).toList(),
                tabAlignment: TabAlignment.center,
              ),
            )),
        body: TabBarView(
          controller: _tabHeadController,
          children: [
            _tabPaymentView(),
            _tabOrderView(),
          ],
        ),
      ),
    );
  }

  /// desc: 已付款
  Widget _tabPaymentView() {
    return Column(children: [
      Container(
        margin: EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 12),
        padding: EdgeInsets.only(left: 10, top: 10, bottom: 10),
        decoration: BoxDecoration(
            color: ColorsStyle.c_FFF7EE,
            borderRadius: BorderRadius.circular(8.0)),
        child: Row(
          children: [
            Image(
              image: AssetImage("assets/images/ic_inform.png"),
              width: 14,
              height: 14,
            ),
            Text(
              "2024年7月1日起，友客云提供消费者付款日的查询功能",
              style: TextStyle(color: ColorsStyle.c_FF6C00, fontSize: 12),
            )
          ],
        ),
      ),
      Text("NZB125816(JM互联网与产品研发中心2.0)"),
      Container(
        margin: EdgeInsets.only(left: 10, right: 10, top: 12, bottom: 10),
        padding: EdgeInsets.only(top: 14, bottom: 14),
        color: Colors.white,
        child: Column(
          children: [
            Text("今日付款概况：2024.07.10 14:39:21", style: TextStyle(fontSize: 12)),
            SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                    child: Container(
                  margin: EdgeInsets.fromLTRB(10, 0, 0, 10),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("今日付款金额(元)",
                            style: TextStyle(
                                color: ColorsStyle.c_999999, fontSize: 16.0)),
                        SizedBox(height: 6.0),
                        Text("50.85",
                            style:
                                TextStyle(color: Colors.black, fontSize: 16.0))
                      ]),
                )),
                Expanded(
                    child: Container(
                  margin: EdgeInsets.fromLTRB(0, 0, 10, 10),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("今日付款商品数(个)",
                            style: TextStyle(
                                color: ColorsStyle.c_999999, fontSize: 16.0)),
                        SizedBox(height: 6.0),
                        Text("11",
                            style:
                                TextStyle(color: Colors.black, fontSize: 16.0))
                      ]),
                ))
              ],
            ),
            SizedBox(height: 15),
            Text("其中，包含历史订单在今日付款：金额2.00，商品1个", style: TextStyle(fontSize: 12)),
          ],
        ),
      ),
      RichText(
          text: new TextSpan(
              text: "付款日期：",
              style: TextStyle(color: ColorsStyle.c_999999),
              children: [
            TextSpan(
                recognizer: TapGestureRecognizer()
                  ..onTap = () {
                    showToast("选择日期");
                  },
                text: "2024.07.05",
                style: TextStyle(color: ColorsStyle.c_3090FF)),
            TextSpan(
                text: " 至 ", style: TextStyle(color: ColorsStyle.c_999999)),
            TextSpan(
                recognizer: TapGestureRecognizer()
                  ..onTap = () {
                    showToast("选择日期");
                  },
                text: "2024.07.05",
                style: TextStyle(color: ColorsStyle.c_3090FF)),
          ])),
      Expanded(
          child: Column(
        children: [
          Container(
              width: double.infinity,
              height: 48, // 可以根据需要调整高度
              child: TabBar(
                isScrollable: false,
                tabAlignment: TabAlignment.fill,
                dividerColor: Colors.white,
                labelStyle: TextStyle(fontSize: 16),
                indicatorColor: Colors.blue,
                labelColor: Colors.blue,
                unselectedLabelColor: ColorsStyle.c_666666,
                controller: _tabBodyController,
                tabs: bodyTabs.map((e) => Tab(text: e)).toList(),
              )),
          Expanded(
            // 使TabBarView占据剩余空间
            child: TabBarView(
              controller: _tabBodyController,
              children: [_tabCustomView(), _tabPointView()],
            ),
          )
        ],
      ))
    ]);
  }

  /// desc: 订单
  Widget _tabOrderView() {
    return Column(children: [
      Text("NZB125816(JM互联网与产品研发中心2.0)"),
      Container(
        margin: EdgeInsets.only(left: 10, right: 10, top: 12, bottom: 10),
        padding: EdgeInsets.only(top: 14, bottom: 14),
        color: Colors.white,
        child: Column(
          children: [
            Text("今日订单概况：2024.07.10 14:39:21", style: TextStyle(fontSize: 12)),
            SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                    child: Container(
                  margin: EdgeInsets.fromLTRB(10, 0, 0, 10),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("今日订单金额(元)",
                            style: TextStyle(
                                color: ColorsStyle.c_999999, fontSize: 16.0)),
                        SizedBox(height: 6.0),
                        Text("50.85",
                            style:
                                TextStyle(color: Colors.black, fontSize: 16.0))
                      ]),
                )),
                Expanded(
                    child: Container(
                  margin: EdgeInsets.fromLTRB(0, 0, 10, 10),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("今日订单商品数(个)",
                            style: TextStyle(
                                color: ColorsStyle.c_999999, fontSize: 16.0)),
                        SizedBox(height: 6.0),
                        Text("11",
                            style:
                                TextStyle(color: Colors.black, fontSize: 16.0))
                      ]),
                ))
              ],
            ),
            SizedBox(height: 15),
            Text("其中，已付款：金额2.00，商品1个", style: TextStyle(fontSize: 12)),
          ],
        ),
      ),
      RichText(
          text: new TextSpan(
              text: "订单日期：",
              style: TextStyle(color: ColorsStyle.c_999999),
              children: [
            TextSpan(
                recognizer: TapGestureRecognizer()
                  ..onTap = () {
                    showToast("选择日期");
                  },
                text: "2024.07.05",
                style: TextStyle(color: ColorsStyle.c_3090FF)),
            TextSpan(
                text: " 至 ", style: TextStyle(color: ColorsStyle.c_999999)),
            TextSpan(
                recognizer: TapGestureRecognizer()
                  ..onTap = () {
                    showToast("选择日期");
                  },
                text: "2024.07.05",
                style: TextStyle(color: ColorsStyle.c_3090FF)),
          ])),
      Expanded(
          child: Column(
        children: [
          Container(
              width: double.infinity,
              height: 48, // 可以根据需要调整高度
              child: TabBar(
                isScrollable: false,
                tabAlignment: TabAlignment.fill,
                dividerColor: Colors.white,
                labelStyle: TextStyle(fontSize: 16),
                indicatorColor: Colors.blue,
                labelColor: Colors.blue,
                unselectedLabelColor: ColorsStyle.c_666666,
                controller: _tabBodyController,
                tabs: bodyTabs.map((e) => Tab(text: e)).toList(),
              )),
          Expanded(
            // 使TabBarView占据剩余空间
            child: TabBarView(
              controller: _tabBodyController,
              children: [_tabCustomView(), _tabPointView()],
            ),
          )
        ],
      ))
    ]);
  }

  /// desc: 客户
  Widget _tabCustomView() {
    return ListView.builder(
      itemCount: list01.length,
      itemBuilder: (BuildContext context, int index) {
        return _customListItem(list01[index]);
      },
    );
  }

  /// desc: 客户item
  Widget _customListItem(TestBean data) {
    return GestureDetector(
      child: Container(
        margin: EdgeInsets.only(left: 10.0, right: 10.0, bottom: 2.0),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(5))),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                    margin: EdgeInsets.only(
                        left: 10.0, bottom: 12.0, top: 10.0, right: 18.0),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "客户编号:${data.nameStr}",
                            style: TextStyle(
                                color: ColorsStyle.c_3A3A3A, fontSize: 13.0),
                          ),
                          Text("客户名称:${data.addressStr}",
                              style: TextStyle(
                                  color: ColorsStyle.c_3A3A3A, fontSize: 13.0))
                        ])),
                Container(
                  margin: EdgeInsets.only(bottom: 10.0, top: 2.0, right: 4.0),
                  child: Text(
                    "￥53.92",
                    style: TextStyle(fontSize: 16),
                  ),
                )
              ],
            )
          ],
        ),
      ),
      onTap: () {},
    );
  }

  /// desc: 点位
  Widget _tabPointView() {
    return ListView.builder(
      itemCount: list02.length,
      itemBuilder: (BuildContext context, int index) {
        return _pointListItem(list02[index]);
      },
    );
  }

  /// desc: 点位item
  Widget _pointListItem(TestBean data) {
    return GestureDetector(
      child: Container(
        margin: EdgeInsets.only(left: 10.0, right: 10.0, bottom: 2.0),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(5))),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                    margin: EdgeInsets.only(
                        left: 10.0, bottom: 12.0, top: 10.0, right: 18.0),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "机器编号:${data.nameStr}",
                            style: TextStyle(
                                color: ColorsStyle.c_3A3A3A, fontSize: 13.0),
                          ),
                          Text("点位名称:${data.addressStr}",
                              style: TextStyle(
                                  color: ColorsStyle.c_3A3A3A, fontSize: 13.0))
                        ])),
                Container(
                  child: Row(
                    children: [
                      Text(
                        "￥53.92",
                        style: TextStyle(
                            color: ColorsStyle.c_3A3A3A, fontSize: 16),
                      ),
                      Image(
                        image: AssetImage("assets/images/arrow_right.png"),
                        width: 14,
                        height: 14,
                      )
                    ],
                  ),
                )
              ],
            )
          ],
        ),
      ),
      onTap: () {
        setState(() {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => PointDetailsPage()));
        });
      },
    );
  }

  @override
  void dispose() {
    _tabHeadController.dispose();
    _tabBodyController.dispose();
    super.dispose();
  }
}

class TestBean {
  late String nameStr;
  late String addressStr;

  TestBean(this.nameStr, this.addressStr);
}
