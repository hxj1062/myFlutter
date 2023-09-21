import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../style/color_style.dart';
import '../utils/common_utils.dart';

// 实名信息
class RealNameInfoPage extends StatefulWidget {
  const RealNameInfoPage({Key? key}) : super(key: key);

  @override
  State<RealNameInfoPage> createState() => _RealNameInfoPageState();
}

class _RealNameInfoPageState extends State<RealNameInfoPage> {
  bool isShow = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: Text("机器信息"),
        centerTitle: true,
      ),
      body: _body(),
    );
  }

  Widget _body() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: double.infinity,
          height: 60.0,
          color: ColorsStyle.c_F4F6F8,
          padding: EdgeInsets.only(left: 15.0, top: 20.0, bottom: 20.0),
          child: Text(
            "个人信息",
            style: TextStyle(color: Colors.black, fontSize: 18.0),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
                padding:
                    const EdgeInsets.only(left: 15.0, top: 20.0, bottom: 19.0),
                child: Text(
                  "姓名",
                  style:
                      const TextStyle(fontSize: 15.0, color: Color(0xff333333)),
                )),
            Container(
                padding:
                    const EdgeInsets.only(right: 15.0, top: 20.0, bottom: 19.0),
                child: Text(
                  "张无忌",
                  style:
                      const TextStyle(fontSize: 15.0, color: Color(0xff333333)),
                ))
          ],
        ),
        Divider(
          indent: 15.0,
          endIndent: 15.0,
          height: 1.0,
          color: ColorsStyle.c_F4F6F8,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
                padding:
                    const EdgeInsets.only(left: 15.0, top: 20.0, bottom: 19.0),
                child: Text(
                  "身份证",
                  style:
                      const TextStyle(fontSize: 15.0, color: Color(0xff333333)),
                )),
            Container(
                padding:
                    const EdgeInsets.only(right: 15.0, top: 20.0, bottom: 19.0),
                child: Text(
                  "265478794346",
                  style:
                      const TextStyle(fontSize: 15.0, color: Color(0xff333333)),
                ))
          ],
        ),
        Divider(
          indent: 15.0,
          endIndent: 15.0,
          height: 1.0,
          color: ColorsStyle.c_F4F6F8,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
                padding:
                    const EdgeInsets.only(left: 15.0, top: 20.0, bottom: 19.0),
                child: Text(
                  "手机号",
                  style:
                      const TextStyle(fontSize: 15.0, color: Color(0xff333333)),
                )),
            Container(
                padding:
                    const EdgeInsets.only(right: 15.0, top: 20.0, bottom: 19.0),
                child: Text(
                  "1234567890",
                  style:
                      const TextStyle(fontSize: 15.0, color: Color(0xff333333)),
                ))
          ],
        ),
        Container(
            child: Offstage(
                offstage: false,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: double.infinity,
                      height: 60.0,
                      color: ColorsStyle.c_F4F6F8,
                      padding:
                          EdgeInsets.only(left: 15.0, top: 20.0, bottom: 20.0),
                      child: Text(
                        "企业信息",
                        style: TextStyle(color: Colors.black, fontSize: 18.0),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                            padding: const EdgeInsets.only(
                                left: 15.0, top: 20.0, bottom: 19.0),
                            child: Text(
                              "企业类型",
                              style: const TextStyle(
                                  fontSize: 15.0, color: Color(0xff333333)),
                            )),
                        Container(
                            padding: const EdgeInsets.only(
                                right: 15.0, top: 20.0, bottom: 19.0),
                            child: Text(
                              "企业",
                              style: const TextStyle(
                                  fontSize: 15.0, color: Color(0xff333333)),
                            ))
                      ],
                    ),
                    Divider(
                      indent: 15.0,
                      endIndent: 15.0,
                      height: 1.0,
                      color: ColorsStyle.c_F4F6F8,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                            padding: const EdgeInsets.only(
                                left: 15.0, top: 20.0, bottom: 19.0),
                            child: Text(
                              "企业名称",
                              style: const TextStyle(
                                  fontSize: 15.0, color: Color(0xff333333)),
                            )),
                        Container(
                            padding: const EdgeInsets.only(
                                right: 15.0, top: 20.0, bottom: 19.0),
                            child: Text(
                              "东方西游",
                              style: const TextStyle(
                                  fontSize: 15.0, color: Color(0xff333333)),
                            ))
                      ],
                    )
                  ],
                ))),
      ],
    );
  }
}
