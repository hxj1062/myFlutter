import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'account_info_page.dart';

class CalculatorPage extends StatefulWidget {
  const CalculatorPage({Key? key}) : super(key: key);

  @override
  State<CalculatorPage> createState() => _CalculatorPageState();
}

class _CalculatorPageState extends State<CalculatorPage> {
  dynamic plusResult; // 加
  dynamic minusResult; // 减
  dynamic timesResult; // 乘
  dynamic dividedResult; // 除

  final plusController1 = TextEditingController();
  final plusController2 = TextEditingController();

  final minusController1 = TextEditingController();
  final minusController2 = TextEditingController();

  final timesController1 = TextEditingController();
  final timesController2 = TextEditingController();

  final dividedController1 = TextEditingController();
  final dividedController2 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("计算"),
      ),
      body: _calculator(),
    );
  }

  Widget _calculator() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        const SizedBox(
          height: 10.0,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(
                height: 40.0,
                width: 80.0,
                child: TextField(
                    cursorColor: Colors.black54,
                    controller: plusController1,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      hintText: "数值",
                      hintStyle: TextStyle(fontSize: 12.0),
                      border: InputBorder.none,
                      fillColor: Color(0xffD3D3D3),
                      filled: true,
                    ))),
            const Text(
              "+",
              style: TextStyle(
                fontSize: 14.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 40.0,
              width: 80.0,
              child: TextField(
                cursorColor: Colors.black54,
                controller: plusController2,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                    hintText: "数值",
                    hintStyle: TextStyle(fontSize: 12.0),
                    border: InputBorder.none,
                    fillColor: Color(0xffD3D3D3),
                    filled: true),
              ),
            ),
            SizedBox(
              height: 32.0,
              child: TextButton(
                  onPressed: () {
                    setState(() {
                      plusResult = plusNum();
                    });
                  },
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(Colors.deepOrangeAccent)),
                  child: Text(
                    "$plusResult",
                    style: const TextStyle(
                        color: Colors.black,
                        fontSize: 14.0,
                        fontWeight: FontWeight.bold),
                  )),
            )
          ],
        ),
        const SizedBox(
          height: 10.0,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(
                height: 40.0,
                width: 80.0,
                child: TextField(
                    cursorColor: Colors.black54,
                    controller: minusController1,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      hintText: "数值",
                      hintStyle: TextStyle(fontSize: 12.0),
                      border: InputBorder.none,
                      fillColor: Color(0xffD3D3D3),
                      filled: true,
                    ))),
            const Text(
              "-",
              style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 40.0,
              width: 80.0,
              child: TextField(
                cursorColor: Colors.black54,
                controller: minusController2,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                    hintText: "数值",
                    hintStyle: TextStyle(fontSize: 12.0),
                    filled: true,
                    border: InputBorder.none,
                    fillColor: Color(0xffD3D3D3)),
              ),
            ),
            SizedBox(
              height: 32.0,
              child: TextButton(
                  onPressed: () {
                    setState(() {
                      minusResult = minusNum();
                    });
                  },
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(Colors.lightBlueAccent)),
                  child: Text(
                    "$minusResult",
                    style: const TextStyle(
                        color: Colors.black,
                        fontSize: 14.0,
                        fontWeight: FontWeight.bold),
                  )),
            )
          ],
        ),
        const SizedBox(
          height: 10.0,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(
                height: 40.0,
                width: 80.0,
                child: TextField(
                    cursorColor: Colors.black54,
                    controller: timesController1,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      hintText: "数值",
                      hintStyle: TextStyle(fontSize: 12.0),
                      border: InputBorder.none,
                      fillColor: Color(0xffD3D3D3),
                      filled: true,
                    ))),
            const Text(
              "*",
              style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 40.0,
              width: 80.0,
              child: TextField(
                cursorColor: Colors.black54,
                controller: timesController2,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                    hintText: "数值",
                    hintStyle: TextStyle(fontSize: 12.0),
                    filled: true,
                    border: InputBorder.none,
                    fillColor: Color(0xffD3D3D3)),
              ),
            ),
            SizedBox(
              height: 32.0,
              child: TextButton(
                  onPressed: () {
                    setState(() {
                      timesResult = timesNum();
                    });
                  },
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(Colors.amberAccent)),
                  child: Text(
                    "$timesResult",
                    style: const TextStyle(
                        color: Colors.black,
                        fontSize: 14.0,
                        fontWeight: FontWeight.bold),
                  )),
            )
          ],
        ),
        const SizedBox(
          height: 10.0,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(
                height: 40.0,
                width: 80.0,
                child: TextField(
                    cursorColor: Colors.black54,
                    controller: dividedController1,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      hintText: "数值",
                      hintStyle: TextStyle(fontSize: 12.0),
                      border: InputBorder.none,
                      fillColor: Color(0xffD3D3D3),
                      filled: true,
                    ))),
            const Text(
              "/",
              style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 40.0,
              width: 80.0,
              child: TextField(
                cursorColor: Colors.black54,
                controller: dividedController2,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                    hintText: "数值",
                    hintStyle: TextStyle(fontSize: 12.0),
                    filled: true,
                    border: InputBorder.none,
                    fillColor: Color(0xffD3D3D3)),
                textAlignVertical: TextAlignVertical.center,
              ),
            ),
            SizedBox(
              height: 32.0,
              child: TextButton(
                  onPressed: () {
                    setState(() {
                      dividedResult = dividedNum();
                    });
                  },
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.pink)),
                  child: Text(
                    "$dividedResult",
                    style: const TextStyle(
                        color: Colors.black,
                        fontSize: 14.0,
                        fontWeight: FontWeight.bold),
                  )),
            ),
          ],
        ),
        const SizedBox(height: 20.0),
        SizedBox(
          width: 160.0,
          height: 42.0,
          child: TextButton(
              style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all(Colors.blueAccent)),
              onPressed: () {
                setState(() {
                  clearData();
                });
              },
              child: const Text(
                "清除",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 14.0,
                    fontWeight: FontWeight.bold),
              )),
        ),
        Expanded(
          child: Container(
            padding: const EdgeInsets.only(bottom: 40.0),
            alignment: Alignment.bottomCenter,
            child: (ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.red),
              ),
              child: const Text(
                "跳转页面",
                style: TextStyle(fontSize: 16.0),
              ),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const AccountInfoPage()));
              },
            )),
          ),
        )
      ],
    );
  }

  String plusNum() {
    if (plusController1.text.isNotEmpty && plusController2.text.isNotEmpty) {
      return (int.parse(plusController1.text) + int.parse(plusController2.text))
          .toString();
    } else {
      return "请输入数值";
    }
  }

  String minusNum() {
    if (minusController1.text.isNotEmpty && minusController2.text.isNotEmpty) {
      return (int.parse(minusController1.text) -
              int.parse(minusController2.text))
          .toString();
    } else {
      return "请输入数值";
    }
  }

  String timesNum() {
    if (timesController1.text.isNotEmpty && timesController2.text.isNotEmpty) {
      return (int.parse(timesController1.text) *
              int.parse(timesController2.text))
          .toString();
    } else {
      return "请输入数值";
    }
  }

  String dividedNum() {
    if (dividedController1.text.isNotEmpty &&
        dividedController2.text.isNotEmpty) {
      return (int.parse(dividedController1.text) /
              int.parse(dividedController2.text))
          .toString();
    } else {
      return "请输入数值";
    }
  }

  void clearData() {
    plusController1.text = "";
    plusController2.text = "";
    minusController1.text = "";
    minusController2.text = "";
    timesController1.text = "";
    timesController2.text = "";
    dividedController1.text = "";
    dividedController2.text = "";
    plusResult = "结果";
    minusResult = "结果";
    timesResult = "结果";
    dividedResult = "结果";
  }
}
