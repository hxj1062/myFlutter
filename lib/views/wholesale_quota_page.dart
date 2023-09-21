import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myfluter/utils/common_utils.dart';
import 'package:myfluter/utils/my_dialog.dart';
import '../style/color_style.dart';

// 批发额度-还款
class WholesaleQuotaPage extends StatefulWidget {
  const WholesaleQuotaPage({Key? key}) : super(key: key);

  @override
  State<WholesaleQuotaPage> createState() => _WholesaleQuotaPageState();
}

class _WholesaleQuotaPageState extends State<WholesaleQuotaPage> {
  var selected = <int>[];
  var moneyData = <double>[];
  var moneyList = [10.00, 20.00, 30.00,40.00,50.00];
  var totalMoney = 0.00;

  @override
  void initState() {
    super.initState();
    selected.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: Text("批发额度"),
        centerTitle: true,
      ),
      body: Container(
        color: ColorsStyle.c_F5F5F5,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _headerView(),
            Container(
                padding: EdgeInsets.only(left: 20.0, top: 12.0, bottom: 12.0),
                child: Text(
                  "待还账期",
                )),
            Expanded(
                child: ListView.builder(
              itemCount: moneyList.length,
              itemBuilder: (BuildContext context, int index) {
                var num = moneyList[index];
                return _pendingItem(num, index);
              },
            )),
            _bottomView()
          ],
        ),
      ),
    );
  }

  Widget _headerView() {
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

  Widget _pendingItem(double moneyNum, int index) {
    return GestureDetector(
      child: Container(
        margin: EdgeInsets.only(left: 10.0, right: 10.0, bottom: 10.0),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(5))),
        child: Row(
          children: [
            Container(
              margin: EdgeInsets.only(left: 10.0),
              child: Image(
                image: AssetImage(selected.contains(index)
                    ? "assets/images/select_high.png"
                    : "assets/images/select_normal.png"),
                width: 16,
                height: 16,
              ),
            ),
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
                          style: TextStyle(color: Colors.black, fontSize: 16.0),
                        ),
                        Text("¥${moneyNum}",
                            style:
                                TextStyle(color: Colors.black, fontSize: 16.0))
                      ]),
                ),
                Container(
                    margin: EdgeInsets.only(
                        left: 10.0, bottom: 14.0, top: 2.0, right: 18.0),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "${"10月25日-11月26日"}",
                            style: TextStyle(
                                color: ColorsStyle.c_666666,
                                fontSize: 16.0),
                          ),
                          Text("${"已逾期"}",
                              style: TextStyle(
                                  color: ColorsStyle.c_FF4951,
                                  fontSize: 16.0))
                        ]))
              ],
            )),
          ],
        ),
      ),
      onTap: () {
        setState(() {
          if (selected.contains(index)) {
            selected.remove(index);
            moneyData.remove(moneyNum);
          } else {
            selected.add(index);
            moneyData.add(moneyNum);
          }
          totalMoney = 0;
          for (var value in moneyData) {
            totalMoney += value;
          }
        });
      },
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
                  style:
                      TextStyle(fontSize: 14, color: ColorsStyle.c_999999),
                  children: [
                TextSpan(
                    text: "¥",
                    style: TextStyle(fontSize: 14, color: Colors.black)),
                TextSpan(
                    text: "${totalMoney}",
                    style: TextStyle(fontSize: 26.0, color: Colors.black))
              ])),
          ElevatedButton(
            onPressed: () async {
              int? num = await showPayTypeDialog(context, "666.0");
              if (num == 1) {
                showToast("选择了支付宝");
              } else if (num == 2) {
                showToast("选择了友客云钱包");
              } else if (num == 3) {
                showToast("选择了点击充值");
              }
            },
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
