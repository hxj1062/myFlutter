import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../style/color_style.dart';

class PrivacyMachinePageApp extends StatefulWidget {
  const PrivacyMachinePageApp({Key? key}) : super(key: key);

  @override
  State<PrivacyMachinePageApp> createState() => _PrivacyMachinePageAppState();
}

class _PrivacyMachinePageAppState extends State<PrivacyMachinePageApp> {
  TextEditingController _editController = TextEditingController();
  List<Product> productList = [
    Product("46456546", "湖南省人民武装学校食堂2"),
    Product("48594894", "华南物流园BPP汇泽充电站4号门口"),
    Product("79845549", "华南物流园BP汇泽充电电站4号门口"),
  ];
  List<Product> productList2 = [
    Product("46456546", "湖南省人民武装学校食堂2"),
    Product("48594894", "华南物流园BP汇泽充电站4号门口"),
    Product("79845549", "华南物流园BP汇泽充电站4号门口"),
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
                        productList = productList2;
                      } else {
                        var list = <Product>[];
                        for (var bean in productList2) {
                          if (bean.machineId!.contains(value) ||
                              value.contains(bean.machineId.toString())) {
                            list.add(bean);
                          }
                        }
                        productList = list;
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
          itemCount: productList.length,
          itemBuilder: (BuildContext context, int index) {
            return _listItem(productList[index]);
          },
        )),
      ],
    );
  }

  Widget _listItem(Product data) {
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
                    margin: EdgeInsets.only(
                        left: 10.0, bottom: 12.0, top: 10.0, right: 18.0),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "机器号:${data.machineId}",
                            style: TextStyle(
                                color: ColorsStyle.c_666666, fontSize: 16.0),
                          ),
                          Text("${data.machineAddress}",
                              style: TextStyle(
                                  color: ColorsStyle.c_FF4951, fontSize: 16.0))
                        ])),
                Container(
                  margin: EdgeInsets.only(
                    left: 10.0,
                    bottom: 10.0,
                    top: 2.0,
                  ),
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
        setState(() {});
      },
    );
  }
}

class Product {
  late String machineId;
  late String machineAddress;

  Product(this.machineId, this.machineAddress);
}
