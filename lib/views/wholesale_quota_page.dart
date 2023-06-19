import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../style/colors_style.dart';

class WholesaleQuotaPage extends StatefulWidget {
  const WholesaleQuotaPage({Key? key}) : super(key: key);

  @override
  State<WholesaleQuotaPage> createState() => _WholesaleQuotaPageState();
}

class _WholesaleQuotaPageState extends State<WholesaleQuotaPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: Text("批发额度"),
        centerTitle: true,
      ),
      body: Container(
        color: ColorsStyle.C_FFF5F5F5,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _showMoney(),
            Container(
                padding: EdgeInsets.only(left: 20.0, top: 12.0, bottom: 12.0),
                child: Text(
                  "待还账期",
                )),
            _ListDatas(),
            _bottomView()
          ],
        ),
      ),
    );
  }

  Widget _showMoney() {
    return Container(
        color: Colors.white,
        padding: EdgeInsets.only(top: 40.0, bottom: 40.0),
        alignment: Alignment.center,
        child: Column(children: [
          Text("累计应还"),
          SizedBox(height: 10.0),
          RichText(
              text: new TextSpan(text: "", children: [
            TextSpan(
                text: "¥", style: TextStyle(fontSize: 16, color: Colors.black)),
            TextSpan(
                text: "5986.47",
                style: TextStyle(fontSize: 28, color: Colors.black))
          ])),
        ]));
  }

  Widget _ListDatas() {
    return Expanded(
        child: ListView.builder(
      itemCount: 4,
      itemBuilder: (BuildContext context, int index) {
        return _item();
      },
    ));
  }

  Widget _item() {
    Set<int> selected = Set<int>();
    return Container(
      margin: EdgeInsets.only(left: 10.0, right: 10.0, bottom: 10.0),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(5))),
      child: Row(
        children: [
          Container(
              margin: EdgeInsets.only(left: 10.0),
              child: Image(
                image: AssetImage(selected.contains(0)
                    ? "assets/images/select_normal.png"
                    : "assets/images/select_high.png"),
                width: 16,
                height: 16,
              )),
          Expanded(
              child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(
                    left: 10.0, top: 14.0, right: 18.0, bottom: 2.0),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "账单",
                        style:
                            TextStyle(color: Color(0xff000000), fontSize: 16.0),
                      ),
                      Text("${"￥2025.99"}",
                          style: TextStyle(
                              color: Color(0xff000000), fontSize: 16.0))
                    ]),
              ),
              Container(
                  margin: EdgeInsets.only(
                      left: 10.0, bottom: 14.0, top: 2.0, right: 18.0),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "${"10月20日-11月25"}",
                          style: TextStyle(
                              color: Color(0xff666666), fontSize: 16.0),
                        ),
                        Text("${"已逾期"}",
                            style: TextStyle(
                                color: Color(0xffFF4951), fontSize: 16.0))
                      ]))
            ],
          )),
        ],
      ),
    );
  }

  Widget _bottomView() {
    return Container(
        padding:
            EdgeInsets.only(left: 12.0, top: 6.0, bottom: 6.0, right: 12.0),
        color: Colors.white,
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          RichText(
              text: new TextSpan(
                  text: "共",
                  style: TextStyle(fontSize: 14, color: ColorsStyle.C_FF999999),
                  children: [
                TextSpan(
                    text: "¥",
                    style: TextStyle(fontSize: 14, color: Colors.black)),
                TextSpan(
                    text: "5986.47",
                    style: TextStyle(fontSize: 26.0, color: Colors.black))
              ])),
          ElevatedButton(
            onPressed: () {},
            child: Text(
              "还款",
              style: TextStyle(fontSize: 18.0),
            ),
            style: ButtonStyle(
                elevation: MaterialStateProperty.all(0),
                shape: MaterialStateProperty.all(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4))),
                backgroundColor: MaterialStateProperty.all(Colors.blue)),
          )
        ]));
  }
}
