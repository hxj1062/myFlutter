import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myfluter/views/account_info_page.dart';
import 'package:myfluter/views/real_name_info_page.dart';
import 'package:myfluter/views/space_fit_page.dart';
import 'package:myfluter/views/wholesale_quota_page.dart';
import '../model/function_bean.dart';
import 'app_account.dart';
import 'bill_recorded_page.dart';
import 'calculator_page.dart';
import 'camera_page.dart';
import 'change_machine_record_page.dart';
import 'change_machine_type_page.dart';
import 'check_product_page.dart';
import 'choice_page.dart';
import 'not_recorded_page.dart';

class Tab01Page extends StatefulWidget {
  const Tab01Page({Key? key}) : super(key: key);

  @override
  State<Tab01Page> createState() => _Tab01PageState();
}

class _Tab01PageState extends State<Tab01Page> {
  // 添加练习模块
  static List<Functions> chainList = [
    Functions("计算器", "简单布局练习", CalculatorPage()),
    Functions("未入账记录", "未入账记录", NotRecordedPage()),
    Functions("账户信息", "账户信息", AccountInfoPage()),
    Functions("练习", "单项选择", ChoicePage()),
    Functions("拍照", "相机应用", CameraPage()),
    Functions("收支账单", "合伙人账单", BillRecordedPage()),
    Functions("测试账号", "用以测试用", AppAccountPage()),
    Functions("机器信息", "更改机型", ChangeMachineTypePage()),
    Functions("变更记录", "变更记录", ChangeMachineRecordPage()),
    Functions("批发额度", "变更记录", WholesaleQuotaPage()),
    Functions("实名信息", "实名资料详情", RealNameInfoPage()),
    Functions("清点商品", "清点商品详情", CheckProductCountPageApp()),
    Functions("空间适配", "空间适配组件FittedBox练习", SpaceFitPage()),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          centerTitle: true,
          title: const Text("测试一"),
        ),
        body: GridView.count(
          //设置滚动方向
          scrollDirection: Axis.vertical,
          //设置列数
          crossAxisCount: 4,
          // 设置内边距
          padding: EdgeInsets.all(14),
          //设置横向间距
          crossAxisSpacing: 10,
          //设置主轴间距
          mainAxisSpacing: 10,
          // 设置宽高比
          childAspectRatio: 2 / 1,
          // 数据渲染
          children: getGridList(context),
        ));
  }

  static List<Widget> getGridList(BuildContext context) {
    return chainList.map((item) => getItemContainer(item, context)).toList();
  }

  static Widget getItemContainer(Functions item, BuildContext context) {
    return GestureDetector(
      // 点击事件  onTap轻按
      onTap: () {
        showDialog(
          context: context,
          barrierDismissible: false, // 点击弹窗外部是否消失
          builder: (context) {
            return getDialog(item, context);
          },
        );
      },
      child: Container(
        height: 60,
        alignment: Alignment.center,
        decoration: BoxDecoration(color: Color(0xff1E90FF)),
        child: Text(
          item.functionName,
          style: TextStyle(color: Colors.white, fontSize: 14.0),
        ),
      ),
    );
  }

  static Widget getDialog(Functions func, BuildContext context1) {
    return AlertDialog(
        title: const Text(
          "功能描述",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        content: Text(
          func.functionDesc,
          style: TextStyle(color: Colors.black),
        ),
        actions: [
          TextButton(
              style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all(const Color(0xff1E90FF))),
              onPressed: () {
                Navigator.of(context1).pop();
              },
              child: const Text(
                "取消",
                style: TextStyle(color: Colors.white, fontSize: 16.0),
              )),
          TextButton(
              style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all(const Color(0xff1E90FF))),
              onPressed: () {
                Navigator.of(context1).pop();
                Navigator.push(context1,
                    MaterialPageRoute(builder: (context) => func.widgetPage));
              },
              child: const Text(
                "查看",
                style: TextStyle(color: Colors.white, fontSize: 16.0),
              ))
        ]);
  }
}
