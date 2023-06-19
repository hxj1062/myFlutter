import 'package:flutter/material.dart';
import 'package:myfluter/utils/gradient_button.dart';

import '../style/colors_style.dart';

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
