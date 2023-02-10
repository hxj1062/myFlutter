import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

/// 未入账记录
class NotRecordedPage extends StatefulWidget {
  const NotRecordedPage({Key? key}) : super(key: key);

  @override
  State<NotRecordedPage> createState() => _NotRecordedPageState();
}

class _NotRecordedPageState extends State<NotRecordedPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          centerTitle: true,
          title: const Text("未入账记录"),
          backgroundColor: const Color(0xff3090FF),
        ),
        body: _body());
  }

  Widget _body() {
    return Container(
      color: const Color(0xff3090FF),
      child: Column(
        children: [
          const SizedBox(
            height: 10.0,
          ),
          Row(
            children: const [
              SizedBox(
                width: 12.0,
              ),
              Text(
                "未入账金额",
                style: TextStyle(color: Colors.white, fontSize: 14.0),
              )
            ],
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              const SizedBox(width: 12.0, height: 4.0),
              RichText(
                  text: TextSpan(children: [
                TextSpan(
                    text: "¥",
                    style: TextStyle(color: Colors.white, fontSize: 16.0)),
                TextSpan(
                    text: "50000",
                    style: TextStyle(color: Colors.white, fontSize: 30.0))
              ]))
            ],
          ),
          const SizedBox(height: 6.0),
          Row(
            children: const [
              SizedBox(
                width: 12.0,
              ),
              Text("创建订单后,确认出货后才会计入账单\n本页面展示当前所有还未计入账单的待扣金额",
                  style: TextStyle(color: Color(0xffdcdcdc), fontSize: 12.0))
            ],
          ),
          const SizedBox(
            height: 14.0,
          ),
          Expanded(
            child: Container(
              color: Colors.white,
              child: ListView.builder(
                  itemCount: 10,
                  itemExtent: 65.0,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      child: _itemView(),
                    );
                  }),
            ),
          )
        ],
      ),
    );
  }

  Widget _itemView() {
    return Container(
        margin: EdgeInsets.all(12.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text("订货单：1234567890", style: TextStyle(color: Colors.black)),
                SizedBox(
                  height: 4.0,
                ),
                Text("2022-06-06 16:16:16",
                    style: TextStyle(color: Color(0xff999999)))
              ],
            ),
            Text("8888") //
          ],
        ));
  }
}
