import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../style/color_style.dart';
import '../utils/common_utils.dart';

class PrivacyMachinePageApp extends StatefulWidget {
  const PrivacyMachinePageApp({Key? key}) : super(key: key);

  @override
  State<PrivacyMachinePageApp> createState() => _PrivacyMachinePageAppState();
}

class _PrivacyMachinePageAppState extends State<PrivacyMachinePageApp> {
  TextEditingController _editController = TextEditingController();

  List<MachineBean> list01 = [
    MachineBean("011111", "湖南省人民武装学校食堂2"),
    MachineBean("533333", "中华人名共和国昆明市呈贡区呈祥街惠景园春都·惠景园-A区"),
    MachineBean("822222", "深圳南山深圳湾公园"),
  ];

  List<MachineBean> list02 = [
    MachineBean("011111", "湖南省人民武装学校食堂2"),
    MachineBean("533333", "中华人名共和国昆明市呈贡区呈祥街惠景园春都"),
    MachineBean("822222", "深圳南山深圳湾公园"),
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: Text("集器列表"),
        centerTitle: true,
      ),
      body: _body(),
    );
  }

  Widget _body() {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.only(left: 10.0, right: 10.0),
          decoration: BoxDecoration(
              color: Color(0xFFFFFFFF),
              borderRadius: BorderRadius.all(Radius.circular(5))),
          child: Padding(
            padding: EdgeInsets.only(left: 10, top: 10, bottom: 10, right: 10),
            child: Container(
                height: 35,
                width: MediaQuery.of(context).size.width - 30,
                decoration: BoxDecoration(
                    color: Color(0xFFF5F5F5),
                    borderRadius: BorderRadius.circular(20)),
                child: TextField(
                  controller: _editController,
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.only(),
                      border: InputBorder.none,
                      hintText: "请按机器号搜索",
                      prefixIcon: Icon(
                        Icons.search,
                        color: ColorsStyle.c_FFBFC2CB,
                      )),
                  onChanged: (value) {
                    setState(() {
                      if (value.isEmpty) {
                        list01 = list02;
                      } else {
                        var list = <MachineBean>[];
                        for (var bean in list02) {
                          if (bean.machineId!.contains(value) ||
                              value.contains(bean.machineId.toString())) {
                            list.add(bean);
                          }
                        }
                        list01 = list;
                      }
                    });
                  },
                )),
          ),
        ),
        SizedBox(
          height: 10.0,
          width: double.infinity,
        ),
        Expanded(
            child: ListView.builder(
          itemCount: list01.length,
          itemBuilder: (BuildContext context, int index) {
            return _listItem(list01[index]);
          },
        )),
      ],
    );
  }

  Widget _listItem(MachineBean data) {
    return GestureDetector(
      child: Container(
        margin: EdgeInsets.only(left: 10.0, right: 10.0, bottom: 2.0),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(5))),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                    width: 280,
                    margin: EdgeInsets.only(
                        left: 10.0, bottom: 12.0, top: 10.0, right: 18.0),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "机器号:${data.machineId}",
                            style: TextStyle(
                                color: ColorsStyle.c_3A3A3A, fontSize: 16.0),
                          ),
                          Text("${data.machineAddress}",
                              style: TextStyle(
                                  color: ColorsStyle.c_737373, fontSize: 14.0))
                        ])),
                Container(
                  margin: EdgeInsets.only(bottom: 10.0, top: 2.0, right: 4.0),
                  child: Image(
                    image: AssetImage("assets/images/arrow_right.png"),
                    width: 12,
                    height: 12,
                  ),
                )
              ],
            )
          ],
        ),
      ),
      onTap: () {
        setState(() {
          showToast("选中了${data.machineId}");
        });
      },
    );
  }
}

class MachineBean {
  late String machineId;
  late String machineAddress;

  MachineBean(this.machineId, this.machineAddress);
}
