import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ChangeMachineRecordPage extends StatefulWidget {
  const ChangeMachineRecordPage({Key? key}) : super(key: key);

  @override
  State<ChangeMachineRecordPage> createState() =>
      _ChangeMachineRecordPageState();
}

class _ChangeMachineRecordPageState extends State<ChangeMachineRecordPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("变更记录"),
      ),
      body: Column(
        children: [
          _item1(),
          Expanded(
              child: ListView.builder(
                  itemCount: 6,
                  itemBuilder: (BuildContext context, int index) {
                    return _item2();
                  }))
        ],
      ),
    );
  }

  Widget _emptyItem() {
    return Container(
      width: double.infinity,
      height: double.infinity,
      alignment: Alignment(0, 0),
      child: Column(
        children: [
          Icon(
            Icons.hourglass_empty,
            size: 80,
          ),
          Text(
            "暂无数据",
            style: TextStyle(color: Colors.black),
          )
        ],
      ),
    );
  }

  Widget _item1() {
    return Container(
      padding: EdgeInsets.only(left: 20.0),
      width: double.infinity,
      height: 56.0,
      alignment: Alignment(-1, 0),
      child: Text(
        "机器号:66668888",
        style: TextStyle(color: Colors.black, fontSize: 18.0),
      ),
    );
  }

  Widget _item2() {
    return Container(
      margin: EdgeInsets.only(left: 10.0, right: 10.0, bottom: 12.0),
      padding:
          EdgeInsets.only(left: 14.0, top: 20.0, bottom: 16.0, right: 13.0),
      color: Color(0xffFFFFFF),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                margin: EdgeInsets.only(left: 20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "机型:冰箱机",
                      style:
                          TextStyle(color: Color(0xff868686), fontSize: 16.0),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Text("型号:测试机子666",
                        style:
                            TextStyle(color: Color(0xff868686), fontSize: 16.0))
                  ],
                ),
              ),
              Offstage(
                offstage: false,
                child: SizedBox(
                  height: 30.0,
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Text(
                      "修改",
                      style:
                          TextStyle(color: Colors.deepOrange, fontSize: 16.0),
                    ),
                    style: ButtonStyle(
                        elevation: MaterialStateProperty.all(0),
                        side: MaterialStateProperty.all(
                          BorderSide(color: Colors.deepOrange, width: 1.0),
                        ),
                        backgroundColor:
                            MaterialStateProperty.all(Colors.white),
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)))),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 24.0,
          ),
          Row(
            children: [
              Container(
                height: 10,
                width: 10,
                decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.all(Radius.circular(5))),
              ),
              Container(
                margin: EdgeInsets.only(left: 10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "变更机型:荷叶冰箱机",
                      style: TextStyle(color: Colors.black, fontSize: 16.0),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Text("变更型号:测试机子666",
                        style: TextStyle(color: Colors.black, fontSize: 16.0))
                  ],
                ),
              ),
            ],
          ),
          SizedBox(
            height: 16.0,
          ),
          Divider(
            height: 1.0,
            color: Colors.red,
          ),
          SizedBox(
            height: 16.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "修改人:测试人",
                style: TextStyle(color: Color(0xff737373), fontSize: 14.0),
              ),
              Text("2023.01.24 13.56.22",
                  style: TextStyle(color: Color(0xff737373), fontSize: 14.0))
            ],
          )
        ],
      ),
    );
  }
}
