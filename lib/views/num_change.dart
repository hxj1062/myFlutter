import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:myfluter/style/color_style.dart';

class NumChangeWidget extends StatefulWidget {
  final double height;
  int num;
  final ValueChanged<int> onValueChanged;

  final bool disabled;

  NumChangeWidget(
      {Key? key,
      this.height = 36.0,
      this.num = 0,
      this.disabled = false,
      required this.onValueChanged})
      : super(key: key);

  @override
  _NumChangeWidgetState createState() {
    return _NumChangeWidgetState();
  }
}

class _NumChangeWidgetState extends State<NumChangeWidget> {
  TextEditingController _numcontroller = TextEditingController();

  @override
  void initState() {
    super.initState();
    _numcontroller.addListener(_onNumChange);
  }

  void _onNumChange() {
    String text = _numcontroller.text;
    if (text.isNotEmpty) {
      String result = text.replaceAll(RegExp(r'^[0]+'), ''); // 去掉首位0的正则替换
      if (result != '') {
        widget.num = int.parse(result);
        widget.onValueChanged(widget.num);
      }
      if (result != text) {
        _numcontroller.selection =
            TextSelection.fromPosition(TextPosition(offset: result.length));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    _numcontroller.text = widget.num.toString();

    return Container(
      height: widget.height,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          GestureDetector(
            onTap: _minusNum,
            child: Container(
              width: 30.0,
              alignment: Alignment.center,
              child: Icon(Icons.horizontal_rule_outlined,
                  color: widget.num == 0 || widget.disabled
                      ? ColorsStyle.c_999999
                      : Colors.black),
            ),
          ),
          Container(
            width: 20.0,
            alignment: Alignment.center,
            child: TextField(
                controller: _numcontroller,
                //TextEditingController,用于获取文本值
                keyboardType: TextInputType.number,
                //设置键盘为数字
                textAlign: TextAlign.center,
                // 内容左右居中
                maxLines: 1,
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.only(bottom: 10),
                ),
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly, //设置只允许输入整数
                ],
                style: TextStyle(fontSize: 16, color: Colors.black),
                readOnly: widget.disabled),
          ),
          GestureDetector(
            onTap: _addNum,
            child: Container(
              width: 30.0,
              alignment: Alignment.center,
              child: Icon(
                Icons.add_outlined,
                color: widget.disabled ? ColorsStyle.c_999999 : Colors.black,
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _minusNum() {
    if (widget.num == 0 || widget.disabled) {
      return;
    }
    setState(() {
      widget.num -= 1;
      if (widget.onValueChanged != null) {
        widget.onValueChanged(widget.num);
      }
    });
  }

  void _addNum() {
    if (widget.disabled) {
      return;
    }
    setState(() {
      widget.num += 1;
      if (widget.onValueChanged != null) {
        widget.onValueChanged(widget.num);
      }
    });
  }
}
