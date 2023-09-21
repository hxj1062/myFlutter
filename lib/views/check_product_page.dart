import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../style/color_style.dart';

class CheckProductCountPageApp extends StatefulWidget {
  const CheckProductCountPageApp({Key? key}) : super(key: key);

  @override
  State<CheckProductCountPageApp> createState() =>
      _CheckProductCountPageAppState();
}

class _CheckProductCountPageAppState extends State<CheckProductCountPageApp> {
  TextEditingController _editController = TextEditingController();
  var _beCounted = 0;
  var _selectNum = 0;
  List<Product> productList = [
    Product("1.", "无糖可口可乐100ml", true),
    Product("2.", "百香果味芬达50ml", true),
    Product("3.", "美汁源橙汁80ml", true),
  ];
  List<Product> productList2 = [
    Product("1.", "无糖可口可乐100ml", true),
    Product("2.", "百香果味芬达50ml", true),
    Product("3.", "美汁源橙汁80ml", true),
  ];

  @override
  void initState() {
    super.initState();
    _beCounted = productList.length;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: Text("清点商品"),
        centerTitle: true,
      ),
      body: _body(),
    );
  }

  Widget _body() {
    return Column(
      children: [
        Container(
          margin:
              EdgeInsets.only(top: 10.0, left: 10.0, right: 10.0, bottom: 10.0),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(5))),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                  padding: const EdgeInsets.only(
                      left: 20.0, top: 20.0, bottom: 19.0),
                  child: Text(
                    "待清点商品：${_beCounted}",
                    style: const TextStyle(
                        fontSize: 20.0, color: Color(0xff333333)),
                  )),
              SizedBox(
                width: 1,
                height: 16,
                child: DecoratedBox(
                  decoration: BoxDecoration(color: Colors.grey),
                ),
              ),
              Container(
                  padding: const EdgeInsets.only(
                      right: 20.0, top: 20.0, bottom: 19.0),
                  child: Text(
                    "总商品：${productList2.length}",
                    style: const TextStyle(
                        fontSize: 20.0, color: Color(0xff333333)),
                  ))
            ],
          ),
        ),
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
                      border: InputBorder.none,
                      hintText: "请输入商品ID或商品名称",
                      prefixIcon: Icon(
                        Icons.search,
                        color: Colors.grey,
                      )),
                  onChanged: (value) {
                    setState(() {
                      if (value.isEmpty) {
                        productList = productList2;
                      } else {
                        var list = <Product>[];
                        for (var bean in productList2) {
                          if (bean.productName!.contains(value) ||
                              value.contains(bean.productName.toString())) {
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
        Expanded(
            child: ListView.builder(
          itemCount: productList.length,
          itemBuilder: (BuildContext context, int index) {
            return _listItem(productList[index]);
          },
        )),
        Container(
          height: 55.0,
          margin: EdgeInsets.only(left: 20.0, right: 20.0, bottom: 18.0),
          width: double.infinity,
          child: ElevatedButton(
            onPressed: () async {},
            child: Text(
              "清点完毕，返回",
              style: TextStyle(fontSize: 18.0),
            ),
            style: ButtonStyle(
                elevation: MaterialStateProperty.all(0),
                shape: MaterialStateProperty.all(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(26))),
                backgroundColor: MaterialStateProperty.all(Color(0xffff7500))),
          ),
        )
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
              children: [
                Expanded(
                  child: Text(''), // 中间用Expanded控件
                ),
                Offstage(
                  offstage: data.isSelect,
                  child: Image(
                    image: AssetImage("assets/images/vm_checked.png"),
                    width: 14,
                    height: 14,
                  ),
                )
              ],
            ),
            Row(
              children: [
                Container(
                  margin: EdgeInsets.only(
                    left: 10.0,
                    bottom: 10.0,
                    top: 2.0,
                  ),
                  child: Text("${data.productId}"),
                ),
                Expanded(
                  child: Container(
                    margin: EdgeInsets.only(
                        left: 10.0, bottom: 12.0, top: 2.0, right: 18.0),
                    child: Text(
                      "${data.productName}",
                      style: TextStyle(color: Colors.black, fontSize: 16.0),
                    ),
                  ),
                ),
                Container(
                    margin: EdgeInsets.only(
                        left: 10.0, bottom: 12.0, top: 2.0, right: 18.0),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "8个",
                            style: TextStyle(
                                color: ColorsStyle.c_666666,
                                fontSize: 16.0),
                          ),
                          Text("16瓶/箱",
                              style: TextStyle(
                                  color: ColorsStyle.c_FF4951,
                                  fontSize: 16.0))
                        ])),
              ],
            )
          ],
        ),
      ),
      onTap: () {
        setState(() {
          data.isSelect = !data.isSelect;
        });
        parseTotal();
      },
    );
  }

  void parseTotal() {
    _selectNum = 0;
    for (var bean in productList) {
      if (!(bean.isSelect == true)) {
        _selectNum += 1;
      }
    }
    _beCounted = (productList.length - _selectNum)!;
  }
}

class Product {
  late String productId;
  late String productName;
  late bool isSelect;

  Product(this.productId, this.productName, this.isSelect);
}
