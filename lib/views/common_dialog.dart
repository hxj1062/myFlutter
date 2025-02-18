import 'package:flutter/material.dart';
import '../style/color_style.dart';

/// 两个按钮的弹窗
Future<bool?> showDefaultDialog(BuildContext context, String content, {String? cancel, confirm}) {
  return showDialog<bool>(
      context: context,
      builder: (context) {
        var child = Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            // Container(
            //   child: Text("提示", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: ColorsStyle.c_333333)),
            //   alignment: Alignment.center,
            //   height: 40,
            // ),
            SizedBox(
              height: 15,
            ),
            Container(
              padding: EdgeInsets.all(10),
              child: Text(
                "$content",
                style: TextStyle(
                  fontSize: 16,
                  color: ColorsStyle.c_3A3A3A,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Row(mainAxisSize: MainAxisSize.max, mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              Expanded(
                  child: Container(
                      margin: EdgeInsets.only(left: 30, right: 15),
                      height: 46,
                      child: TextButton(
                          style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(ColorsStyle.c_F4F6F8),
                              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(25.0),
                                ),
                              )),
                          child: Center(child: Text(cancel ?? "取消", style: TextStyle(color: ColorsStyle.c_3A3A3A, fontSize: 16, fontWeight: FontWeight.bold))),
                          onPressed: () {
                            Navigator.of(context).pop();
                          }))),
              Expanded(
                  child: Container(
                margin: EdgeInsets.only(left: 15, right: 30),
                height: 46,
                child: TextButton(
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(ColorsStyle.c_FF7500),
                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25.0),
                          ),
                        )),
                    child: Center(child: Text(confirm ?? "确定", style: TextStyle(color: ColorsStyle.c_FFFFFF, fontSize: 16, fontWeight: FontWeight.bold))),
                    onPressed: () {
                      Navigator.of(context).pop(true);
                    }),
              ))
            ]),
            SizedBox(
              height: 15,
            ),
          ],
        );
        return Dialog(
          child: child,
        );
      },
      barrierDismissible: false);
}
