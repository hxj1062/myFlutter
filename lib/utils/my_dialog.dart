import 'package:flutter/material.dart';
import 'package:myfluter/utils/gradient_button.dart';

import '../style/color_style.dart';

Future<bool?> showFailedDialog(
    BuildContext context, String imgUrl, String content, String btnName) {
  return showDialog<bool>(
      context: context,
      builder: (context) {
        return Dialog(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(15))),
          child: Container(
            width: 280.0,
            height: 300.0,
            child: Column(
              children: [
                SizedBox(
                  height: 10.0,
                ),
                Image.asset(width: 120, height: 120, "${imgUrl}"),
                Container(
                  height: 60.0,
                  alignment: Alignment.center,
                  child: Text(
                    "${content}",
                    style: TextStyle(color: Colors.black, fontSize: 16.0),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(bottom: 22.0),
                  height: 100.0,
                  alignment: Alignment.bottomCenter,
                  child: GradientButton(
                    height: 44.0,
                    text: "${btnName}",
                    onPressed: () {
                      Navigator.of(context).pop(true);
                    },
                  ),
                )
              ],
            ),
          ),
        );
      });
}

Future<int?> showPayTypeDialog(context, String num) {
  return showModalBottomSheet<int>(
    backgroundColor: Colors.transparent,
    isScrollControlled: true,
    context: context,
    builder: (BuildContext context) {
      return Container(
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: const Radius.circular(20.0),
            topRight: const Radius.circular(20.0),
          ),
        ),
        height: MediaQuery.of(context).size.height / 3.0,
        child: Column(children: [
          SizedBox(
            height: 50,
            child: Stack(
              textDirection: TextDirection.rtl,
              children: [
                Center(
                  child: Text(
                    '请选择支付方式',
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),
                  ),
                ),
                IconButton(
                    icon: Icon(Icons.close),
                    onPressed: () {
                      Navigator.of(context).pop();
                    }),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.only(
                left: 14.0, top: 18.0, right: 14.0, bottom: 18.0),
            margin: EdgeInsets.only(
                left: 10.0, right: 10.0, top: 12.0, bottom: 4.0),
            decoration: BoxDecoration(
                border: Border.all(width: 1.0, color: ColorsStyle.c_F5F5F5),
                borderRadius: BorderRadius.all(Radius.circular(5))),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  child: Row(
                    children: [
                      Image(
                        image: AssetImage("assets/images/alipay_type.png"),
                        width: 34.0,
                        height: 34.0,
                      ),
                      SizedBox(
                        width: 8.0,
                      ),
                      Text(
                        "支付宝",
                        style: TextStyle(fontSize: 20),
                      )
                    ],
                  ),
                ),
                InkWell(
                  child: Image(
                    image: AssetImage("assets/images/arrow_right.png"),
                    width: 16.0,
                    height: 16.0,
                  ),
                  onTap: () {
                    Navigator.of(context).pop(2);
                  },
                )
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.only(
                left: 14.0, top: 16.0, right: 14.0, bottom: 16.0),
            margin: EdgeInsets.only(
                left: 10.0, right: 10.0, top: 4.0, bottom: 10.0),
            decoration: BoxDecoration(
                border: Border.all(width: 1.0, color: ColorsStyle.c_F5F5F5),
                borderRadius: BorderRadius.all(Radius.circular(5))),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  child: Row(
                    children: [
                      Row(
                        children: [
                          Image(
                            image: AssetImage("assets/images/wallet_type.png"),
                            width: 34.0,
                            height: 34.0,
                          ),
                          SizedBox(
                            width: 8.0,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.baseline,
                                textBaseline: TextBaseline.alphabetic,
                                children: [
                                  Text(
                                    "友客云钱包",
                                    style: TextStyle(fontSize: 20),
                                  ),
                                  SizedBox(
                                    width: 8.0,
                                  ),
                                  InkWell(
                                    child: Text(
                                      "点击充值",
                                      style: TextStyle(color: Colors.blue),
                                    ),
                                    onTap: () {
                                      Navigator.of(context).pop(3);
                                    },
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 6.0,
                              ),
                              Text(
                                "可用¥${num}",
                                style: TextStyle(color: ColorsStyle.c_666666),
                              )
                            ],
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                InkWell(
                  child: Image(
                    image: AssetImage("assets/images/arrow_right.png"),
                    width: 16.0,
                    height: 16.0,
                  ),
                  onTap: () {
                    Navigator.of(context).pop(2);
                  },
                )
              ],
            ),
          )
        ]),
      );
    },
  );
}
