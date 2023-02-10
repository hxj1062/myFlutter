import 'dart:ui';

import 'package:fluttertoast/fluttertoast.dart';

/// desc: Toast提示
void showToast(String str) {
  Fluttertoast.showToast(
      msg: str,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 2,
      backgroundColor: const Color(0xFFF2F2F2),
      textColor: const Color(0xFFFF3030),
      fontSize: 14.0);
}
