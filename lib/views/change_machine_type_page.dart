import 'package:flutter/material.dart';
import 'package:myfluter/utils/common_utils.dart';
import 'package:myfluter/utils/my_dialog.dart';

class ChangeMachineTypePage extends StatefulWidget {
  const ChangeMachineTypePage({Key? key}) : super(key: key);

  @override
  State<ChangeMachineTypePage> createState() => _ChangeMachineTypePageState();
}

class _ChangeMachineTypePageState extends State<ChangeMachineTypePage> {
  String btnTitle = "变更机型";
  bool isShow = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: Text("机器信息"),
        centerTitle: true,
      ),
      body: _body(),
    );
  }

  Widget _body() {
    return Container(
      color: Color(0xfff5f5f5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.only(left: 20.0),
            color: Color(0xFFFFFFFF),
            width: double.infinity,
            height: 60.0,
            alignment: Alignment.centerLeft,
            child: Text(
              "机器号:66668888",
              style: TextStyle(color: Colors.black, fontSize: 18.0),
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 18.0, top: 20.0, bottom: 20.0),
            child: Text(
              "当前信息",
              style: TextStyle(color: Colors.black, fontSize: 18.0),
            ),
          ),
          Container(
              color: Color(0xffffffff),
              padding: EdgeInsets.only(
                  left: 20.0, top: 20.0, bottom: 20.0, right: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "机型:冰箱机",
                          style: TextStyle(
                              color: Color(0xff868686), fontSize: 16.0),
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        Text("型号:测试机子666",
                            style: TextStyle(
                                color: Color(0xff868686), fontSize: 16.0))
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 80.0,
                    height: 30.0,
                    child: Offstage(
                      offstage: !isShow,
                      child: ElevatedButton(
                        onPressed: () async {
                          bool? abc = await showFailedDialog(
                              context,
                              "assets/images/bianggengshibai.png",
                              "h很抱歉,变更机型失败",
                              "重新提交");
                          if (abc ==true) {
                            print("失败了");
                          } else {}
                        },
                        child: Text(
                          "查看记录",
                          style: TextStyle(
                              color: Colors.deepOrange, fontSize: 12.0),
                        ),
                        style: ButtonStyle(
                            elevation: MaterialStateProperty.all(0),
                            //边框
                            side: MaterialStateProperty.all(
                              BorderSide(color: Colors.deepOrange, width: 1.0),
                            ),
                            backgroundColor:
                                MaterialStateProperty.all(Colors.white),
                            shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15)))),
                      ),
                    ),
                  )
                ],
              )),
          Offstage(
            offstage: isShow,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.only(left: 18.0, top: 20.0, bottom: 20.0),
                  child: Text(
                    "变更信息",
                    style: TextStyle(color: Colors.black, fontSize: 18.0),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(
                      left: 20.0, top: 20.0, bottom: 20.0, right: 20.0),
                  color: Color(0xffffffff),
                  child: Column(
                    children: [
                      InkWell(
                        child: Row(
                          children: [
                            Expanded(
                                child: Text(
                              "机型",
                              style: TextStyle(
                                  color: Color(0xff868686), fontSize: 16.0),
                            )),
                            Text(
                              "荷叶冰箱机",
                              style: TextStyle(
                                  color: Colors.black, fontSize: 16.0),
                            ),
                            Image(
                              image:
                                  AssetImage("assets/images/arrow_right.png"),
                              width: 16,
                              height: 16,
                            ),
                          ],
                        ),
                        onTap: () {
                          showToast("请选择机型");
                        },
                      ),
                      SizedBox(height: 30.0),
                      InkWell(
                        child: Row(
                          children: [
                            Expanded(
                                child: Text(
                              "型号",
                              style: TextStyle(
                                  color: Color(0xff868686), fontSize: 16.0),
                            )),
                            Text(
                              "测试商汤货柜",
                              style: TextStyle(
                                  color: Colors.black, fontSize: 16.0),
                            ),
                            Image(
                              image: AssetImage("assets/images/arrow_right.png"),
                              width: 16,
                              height: 16,
                            )
                          ],
                        ),
                        onTap: () {
                          showToast("请选择型号");
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 70.0, top: 70.0, right: 70.0),
            width: double.infinity,
            height: 50.0,
            child: ElevatedButton(
              onPressed: () {
                handelChangeVmType();
              },
              child: Text(
                "$btnTitle",
                style: TextStyle(fontSize: 18.0),
              ),
              style: ButtonStyle(
                  elevation: MaterialStateProperty.all(0),
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30))),
                  backgroundColor:
                      MaterialStateProperty.all(Colors.deepOrange)),
            ),
          )
        ],
      ),
    );
  }

  void handelChangeVmType() async {
    if (btnTitle == "确定") {}
    setState(() {
      btnTitle = "确定";
      isShow = false;
    });
  }
}
