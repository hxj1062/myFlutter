import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myfluter/views/tetsufsd.dart';
import 'package:myfluter/views/upload_image_page.dart';

import '../style/color_style.dart';
import '../utils/common_utils.dart';

class UploadOrderApp extends StatefulWidget {
  const UploadOrderApp({Key? key}) : super(key: key);

  @override
  State<UploadOrderApp> createState() => _UploadOrderAppState();
}

class _UploadOrderAppState extends State<UploadOrderApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: Text("上传验收单"),
        centerTitle: true,
      ),
      body: Material(
        child: _body(),
      ),
    );
  }

  Widget _body() {
    return Column(
      children: [
        Container(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              const SizedBox(width: 12.0, height: 4.0),
              RichText(
                  text: TextSpan(children: [
                TextSpan(
                    text: "商品信息",
                    style: TextStyle(color: Colors.black, fontSize: 20.0)),
                TextSpan(
                    text: "   注:已确认收货部分商品不再支持退款",
                    style:
                        TextStyle(color: ColorsStyle.c_666666, fontSize: 14.0))
              ]))
            ],
          ),
        ),
        Expanded(
            flex: 1,
            child: ListView.builder(
                itemCount: 2,
                itemBuilder: (BuildContext context, int index) {
                  return _listItem();
                })),
        Expanded(
            flex: 1,
            child: Container(
              color: Colors.white,
              padding: EdgeInsets.only(left: 14, right: 10, top: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RichText(
                      text: TextSpan(children: [
                    TextSpan(
                        text: "上传验收单照片",
                        style: TextStyle(color: Colors.black, fontSize: 15.0)),
                    TextSpan(
                        text: "(必填)",
                        style: TextStyle(
                            color: ColorsStyle.c_666666, fontSize: 12.0))
                  ])),
                  ProductImg(),
                  SizedBox(
                    height: 8,
                  ),
                  Text(
                    "最多上传6张",
                    style: TextStyle(color: ColorsStyle.c_999999),
                  )
                ],
              ),
            )),
        Row(
          children: [
            Expanded(
                child: MaterialButton(
                    height: 50,
                    minWidth: 100,
                    color: Colors.white,
                    child: Text("返回", style: TextStyle(fontSize: 18)),
                    textColor: Colors.black,
                    onPressed: returnAction)),
            Expanded(
                child: MaterialButton(
                    height: 50,
                    minWidth: 100,
                    color: Colors.blue,
                    child: Text(
                      "提交",
                      style: TextStyle(fontSize: 18),
                    ),
                    textColor: Colors.white,
                    onPressed: submitAction))
          ],
        )
      ],
    );
  }

  void returnAction() {
    showToast("返回");
  }

  void submitAction() {
    showToast("提交");
  }

  Widget _listItem() {
    return Container(
        color: Color(0xffFFFFFF),
        margin: EdgeInsets.only(left: 10, right: 10, top: 10),
        padding: EdgeInsets.only(left: 10, right: 10, top: 10),
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(bottom: 10),
              child: Row(
                children: <Widget>[
                  Image(
                    image: AssetImage("assets/images/goods_eg.png"),
                    width: 60.0,
                    height: 60.0,
                  ),
                  Expanded(
                      child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "卫龙辣条卫龙辣条卫龙辣条",
                              style: TextStyle(fontSize: 15),
                            ),
                            Text(
                              "24个/箱 240g",
                              style: TextStyle(
                                  color: ColorsStyle.c_999999, fontSize: 13),
                            ),
                            Text("¥50.00",
                                style: TextStyle(
                                    color: ColorsStyle.c_999999, fontSize: 13))
                          ],
                        ),
                      ),
                      Container(
                        child: Text("x100"),
                      )
                    ],
                  ))
                ],
              ),
            ),
            Divider(
              height: 1.0,
              color: ColorsStyle.c_DEDEDE,
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text("实收数量",
                      style:
                          TextStyle(color: ColorsStyle.c_666666, fontSize: 13)),
                  NumChangeWidget(
                    onValueChanged: (int value) {},
                  )
                ],
              ),
            )
          ],
        ));
  }
}
