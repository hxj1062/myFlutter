import 'package:flutter/material.dart';

/// desc: 颜色样式
/// <p>
class ColorsStyle {
  //页面背景色
  static const Color color_F3F6FB = Color(0xFFF3F6FB);

  //背景色
  static const Color c_F5F5F5 = Color(0xFFF5F5F5);
  static const Color c_FF7500 = Color(0xFFFF7500);
  static const Color c_FF5F27 = Color(0xFFFF5F27);
  static const Color c_999999 = Color(0xFF999999);
  static const Color c_F4F6F8 = Color(0xFFF4F6F8);
  static const Color c_FFFFFF = Color(0xFFFFFFFF);
  static const Color c_E5E5E5 = Color(0xFFE5E5E5);
  static const Color c_FFBFC2CB = Color(0xFFBFC2CB);
  static const Color c_3090FF = Color(0XFF3090FF);
  static const Color c_666666 = Color(0XFF666666);
  static const Color c_3A3A3A = Color(0XFF3A3A3A);
  static const Color c_FF4951 = Color(0XFFFF4951);
  static const Color c_737373 = Color(0XFF737373);

  static MaterialColor materialColor(Color color) {
    List strengths = <double>[.05];
    Map<int, Color> swatch = {};
    final int r = color.red, g = color.green, b = color.blue;
    for (int i = 1; i < 10; i++) {
      strengths.add(0.1 * i);
    }
    strengths.forEach((strength) {
      final double ds = 0.5 - strength;
      swatch[(strength * 1000).round()] = Color.fromRGBO(
        r + ((ds < 0 ? r : (255 - r)) * ds).round(),
        g + ((ds < 0 ? g : (255 - g)) * ds).round(),
        b + ((ds < 0 ? b : (255 - b)) * ds).round(),
        1,
      );
    });
    return MaterialColor(color.value, swatch);
  }
}
