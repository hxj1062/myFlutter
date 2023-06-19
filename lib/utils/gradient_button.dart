import 'package:flutter/material.dart';

import '../style/colors_style.dart';

// wl
// 渐变色按钮

class GradientButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final double? width;
  final double? height;
  final double? fontSize;

  GradientButton({
    required this.text,
    this.onPressed,
    this.width = 217.0,
    this.height = 50.0,
    this.fontSize = 18.0,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onPressed,
        splashColor: Colors.white.withOpacity(0.4),
        highlightColor: Colors.white.withOpacity(0.2),
        child: Ink(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                ColorsStyle.c_FFFF7500,
                ColorsStyle.c_FFFF7500,
                ColorsStyle.c_FFFF7500,
                ColorsStyle.c_FFFF5F27
              ],
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
            ),
            borderRadius: BorderRadius.circular(25.0),
          ),
          child: Container(
            width: width,
            height: height,
            constraints: BoxConstraints(minWidth: 120.0),
            alignment: Alignment.center,
            padding: EdgeInsets.symmetric(vertical: 12.0),
            child: Text(
              text,
              style: TextStyle(
                color: Colors.white,
                fontSize: fontSize,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
