import 'package:flutter/material.dart';
import 'package:myfluter/views/fourth_page.dart';

import '../style/color_style.dart';

class LogisDetailPage extends StatefulWidget {
  const LogisDetailPage({Key? key}) : super(key: key);

  @override
  State<LogisDetailPage> createState() => _LogisDetailPageState();
}

class _LogisDetailPageState extends State<LogisDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xfff5f5f5),
        appBar: AppBar(
          centerTitle: true,
          title: const Text("账户信息"),
        ),
        body: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(left: 13.0, right: 13.0, top: 14),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(6.0)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        padding: const EdgeInsets.only(
                            left: 12.0, top: 14.0, bottom: 6.0),
                        child: const Text(
                          "物流单号：",
                          style: TextStyle(
                            fontSize: 16.0,
                          ),
                        ),
                      ),
                      Container(
                          padding:
                              const EdgeInsets.only(top: 14.0, bottom: 6.0),
                          child: Text(
                            "6424051900001",
                            style: const TextStyle(
                                fontSize: 16.0, color: ColorsStyle.c_666666),
                          ))
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Container(
                          padding: const EdgeInsets.only(
                              left: 12.0, top: 6.0, bottom: 6.0),
                          child: const Text(
                            "物流状态：",
                            style: TextStyle(
                                fontSize: 16.0, color: ColorsStyle.c_333333),
                          )),
                      Container(
                        padding: const EdgeInsets.only(
                            right: 16.0, top: 6.0, bottom: 6.0),
                        child: Text(
                          "哈好idfjiojo",
                          style: const TextStyle(
                            fontSize: 16.0,
                            color: ColorsStyle.c_666666,
                          ),
                        ),
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Container(
                          padding: const EdgeInsets.only(
                              left: 12.0, top: 6.0, bottom: 6.0),
                          child: const Text(
                            "送货司机：",
                            style: TextStyle(
                                fontSize: 16.0, color: ColorsStyle.c_333333),
                          )),
                      Container(
                        padding: const EdgeInsets.only(
                            right: 16.0, top: 6.0, bottom: 6.0),
                        child: Text(
                          "哈好idfjiojo",
                          style: const TextStyle(
                            fontSize: 16.0,
                            color: ColorsStyle.c_666666,
                          ),
                        ),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Container(
                          padding: const EdgeInsets.only(
                              left: 12.0, top: 6.0, bottom: 4.0),
                          child: const Text(
                            "司机电话：",
                            style: TextStyle(
                                fontSize: 16.0, color: ColorsStyle.c_333333),
                          )),
                      Expanded(
                          child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "489646416",
                            style: TextStyle(
                                fontSize: 16.0, color: ColorsStyle.c_666666),
                          ),
                          Container(
                            margin: const EdgeInsets.only(right: 16.0),
                            child: IconButton(
                              onPressed: () {},
                              style: ButtonStyle(
                                iconColor: MaterialStateProperty.all(
                                    ColorsStyle.c_3090FF),
                                visualDensity: VisualDensity.compact,
                                minimumSize: MaterialStateProperty.all(
                                    const Size(16.0, 10.0)),
                              ),
                              icon: Icon(Icons.phone),
                            ),
                          ),
                        ],
                      ))
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Container(
                          padding: const EdgeInsets.only(
                              left: 12.0, top: 6.0, bottom: 10.0),
                          child: const Text(
                            "发货时间：",
                            style: TextStyle(
                                fontSize: 16.0, color: ColorsStyle.c_333333),
                          )),
                      Container(
                        padding: const EdgeInsets.only(
                            right: 16.0, top: 6.0, bottom: 10.0),
                        child: Text(
                          "5496849984984",
                          style: const TextStyle(
                            fontSize: 16.0,
                            color: ColorsStyle.c_666666,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ));
  }
}
