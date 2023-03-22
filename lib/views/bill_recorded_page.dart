import 'package:flutter/material.dart';

class BillRecordedPage extends StatefulWidget {
  const BillRecordedPage({Key? key}) : super(key: key);

  @override
  State<BillRecordedPage> createState() => _BillRecordedPageState();
}

class _BillRecordedPageState extends State<BillRecordedPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          // 去除阴影
          elevation: 0.0,
          centerTitle: true,
          title: const Text("收支账单"),
          backgroundColor: const Color(0xFF3090FF),
          actions: [
            IconButton(
              git
                onPressed: () {},
                icon: Image.asset(
                  "assets/images/union_icon.png",
                  height: 16.0,
                  width: 16.0,
                ))
          ],
        ),
        body: _body());
  }

  Widget _body() {
    return Container(
      color: const Color(0xff3090FF),
      child: Column(
        children: [
          InkWell(
            onTap: () {},
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "2023-03",
                  style: TextStyle(color: Colors.white),
                ),
                Image.asset("assets/images/arrow_expand.png",
                    height: 10.0, width: 10.0)
              ],
            ),
          ),
          SizedBox(height: 26.0),
          Text("账单金额(元)", style: TextStyle(color: Colors.white)),
          Text("8888.8", style: TextStyle(color: Colors.white, fontSize: 24.0)),
          SizedBox(height: 20.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(mainAxisAlignment: MainAxisAlignment.center, children: [
                Text(
                  "收入合计(元)",
                  style: TextStyle(color: Colors.white),
                ),
                Text("+66666", style: TextStyle(color: Colors.white))
              ]),
              Column(mainAxisAlignment: MainAxisAlignment.center, children: [
                Text("支出合计(元)", style: TextStyle(color: Colors.white)),
                Text("-888888", style: TextStyle(color: Colors.white))
              ])
            ],
          ),
          SizedBox(height: 18.0),
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
            Text("2023-02"),
            Text("营业额"),
            Text("20666"),
          ],
        ));
  }
}
