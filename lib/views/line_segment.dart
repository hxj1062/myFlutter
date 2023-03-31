import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

enum LineSegmentStyle {
  top,
  bottom,
}

///线条指示器分段组件
class LineSegmentControl<T> extends StatefulWidget {
  final Map<T, Widget> children;
  T? groupValue;
  final EdgeInsetsGeometry padding;
  final EdgeInsetsGeometry margin;

  final LineSegmentStyle style;

  final Color? backgroundColor;
  final Color lineColor;
  final double? lineWidth;
  final double lineHeight;

  final double height;

  final Radius radius;

  void Function(T value) onValueChanged;

  LineSegmentControl({
    Key? key,
    required this.children,
    required this.groupValue,
    this.style = LineSegmentStyle.bottom,
    this.backgroundColor = CupertinoColors.tertiarySystemFill,
    this.lineColor = Colors.blue,
    this.lineWidth,
    this.lineHeight = 16,
    this.height = 80,
    this.padding = const EdgeInsets.symmetric(horizontal: 0),
    this.margin = const EdgeInsets.symmetric(horizontal: 0),
    this.radius = const Radius.circular(0),
    required this.onValueChanged,
  }) : super(key: key);

  @override
  _LineSegmentControlState createState() => _LineSegmentControlState();
}

class _LineSegmentControlState extends State<LineSegmentControl> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    double contentWidth =
        screenWidth - widget.margin.horizontal - widget.padding.horizontal;
    double itemWidth = contentWidth / widget.children.values.length;

    return Container(
      margin: widget.margin,
      padding: widget.padding,
      decoration: BoxDecoration(
        color: widget.backgroundColor,
        borderRadius: BorderRadius.all(widget.radius),
      ),
      child: Stack(
        children: [
          Row(
            children: widget.children.values
                .map(
                  (e) => Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Container(
                        height: widget.height,
                        width: itemWidth,
                        child: TextButton(
                          child: e,
                          onPressed: () {
                            // ddlog(e);
                            setState(() {
                              widget.groupValue =
                                  widget.children.values.toList().indexOf(e);
                            });
                            widget.onValueChanged(widget.groupValue);
                          },
                        ),
                      ),
                    ],
                  ),
                )
                .toList(),
          ),
          AnimatedPositioned(
            duration: Duration(milliseconds: 200),
            top: widget.style == LineSegmentStyle.top
                ? 0
                : widget.height - widget.lineHeight,
            left: widget.lineWidth != null
                ? widget.groupValue * itemWidth +
                    (itemWidth - widget.lineWidth!) * 0.5
                : widget.groupValue * itemWidth,
            child: Container(
               child:
              // Image.asset(
              //   "assets/images/title_triangle.png",
              //   height: 16.0,
              //   width: 16.0,
              // ),
              Container(
                width: 20,
                height: 10,
                decoration: BoxDecoration(
                  border: Border(
                    // 四个值 top right bottom left
                    bottom: BorderSide(
                        color: Colors.white, // 朝上; 其他的全部透明transparent或者不设置
                        width: 10,
                        style: BorderStyle.solid),
                    right: BorderSide(
                        color: Colors.transparent, // 朝左;  把颜色改为目标色就可以了；其他的透明
                        width: 10,
                        style: BorderStyle.solid),
                    left: BorderSide(
                        color: Colors.transparent, // 朝右；把颜色改为目标色就可以了；其他的透明
                        width: 10,
                        style: BorderStyle.solid),
                    top: BorderSide(
                        color: Colors.transparent, // 朝下;  把颜色改为目标色就可以了；其他的透明
                        width: 10,
                        style: BorderStyle.solid),
                  ),
                ),
              ),
              height: 20,
              width: widget.lineWidth ?? itemWidth,
              color: widget.lineColor,
              // decoration: BoxDecoration(
              //   borderRadius: BorderRadius.circular(4),
              //   color: widget.lineColor,
              // ),
            ),
          ),
        ],
      ),
    );
  }
}
