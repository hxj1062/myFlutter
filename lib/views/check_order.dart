import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:photo_view/photo_view.dart';

import '../style/color_style.dart';
import '../utils/common_utils.dart';

typedef CommonACallback = void Function(dynamic reslut);

class CheckOrderApp extends StatefulWidget {
  const CheckOrderApp({Key? key}) : super(key: key);

  @override
  State<CheckOrderApp> createState() => _CheckOrderAppState();
}

class _CheckOrderAppState extends State<CheckOrderApp> {
  List<File> _imageFileList = []; // 存放图片的数组

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff5f5f5),
      appBar: AppBar(
        elevation: 0.0,
        title: Text("查看验收单"),
        centerTitle: true,
      ),
      body: _body1(),
    );
  }

  Widget _body1() {
    return Column(
      children: [
        Expanded(
            child: SingleChildScrollView(
                child: Column(
          children: [
            item01(),
            _productList(),
            SizedBox(
              height: 10,
              width: double.infinity,
            ),
            item03(),
            item06()
          ],
        ))),
        item04()
      ],
    );
  }

  Widget _productList() {
    // for (var element in _datas) {
    //   list.add(item02());
    // }

    List<Widget> list = [];
    for (var i = 0; i < 3; i++) {
      list.add(item02());
    }

    return Container(
      child: Column(
        children: list,
      ),
    );
  }

  void btnAction() {
    showToast("重新上传");
  }

  Widget item01() {
    return Container(
      margin: EdgeInsets.only(top: 10, left: 14),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          RichText(
              text: TextSpan(children: [
            TextSpan(
                text: "商品信息",
                style: TextStyle(color: Colors.black, fontSize: 20.0)),
            TextSpan(
                text: "   注:已确认收货部分商品不再支持退款",
                style: TextStyle(color: ColorsStyle.c_666666, fontSize: 14.0))
          ]))
        ],
      ),
    );
  }

  Widget item02() {
    return Container(
        color: Color(0xFFFFFFFF),
        margin: EdgeInsets.only(left: 10, right: 10, top: 10),
        padding: EdgeInsets.only(left: 10, right: 10, top: 10),
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(bottom: 10),
              child: Row(
                children: <Widget>[
                  Image(
                    image: AssetImage("assets/images/goods_eg.png"),
                    width: 60.0,
                    height: 60.0,
                  ),
                  Expanded(
                      child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: 220,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              setEllipsis("卫龙辣条卫龙辣条卫哈哈哈呵呵呵龙辣条"),
                              softWrap: true,
                              style: TextStyle(fontSize: 15),
                            ),
                            Text(
                              "24个/箱 240g",
                              style: TextStyle(
                                  color: ColorsStyle.c_999999, fontSize: 13),
                            ),
                            Text("¥50.00",
                                style: TextStyle(
                                    color: ColorsStyle.c_999999, fontSize: 13))
                          ],
                        ),
                      ),
                      Container(
                        child: Text("x100"),
                      )
                    ],
                  ))
                ],
              ),
            ),
            Divider(
              height: 1.0,
              color: ColorsStyle.c_DEDEDE,
            ),
            Container(
              margin: EdgeInsets.only(top: 10, bottom: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text("实收数量：",
                      style:
                          TextStyle(color: ColorsStyle.c_666666, fontSize: 13)),
                  Text("8",
                      style:
                          TextStyle(color: ColorsStyle.c_333333, fontSize: 16))
                ],
              ),
            )
          ],
        ));
  }

  // 超出字符显示省略号
  String setEllipsis(String str) {
    int maxLength = 11; // 你希望显示的最大字符数
    String cutText =
        (str.length > maxLength) ? '${str.substring(0, maxLength)}...' : str;
    return cutText;
  }

  Widget item03() {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.only(left: 14, right: 10, top: 20, bottom: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("验收单",
                  style:
                      TextStyle(color: ColorsStyle.c_333333, fontSize: 16.0)),
              Text("2023-03-09 13:00:00上传",
                  style: TextStyle(color: ColorsStyle.c_666666, fontSize: 14.0))
            ],
          ),
          item05(),
        ],
      ),
    );
  }

  Widget item06() {
    return Container(
      color: Colors.white,
      width: double.infinity,
      margin: EdgeInsets.only(top: 10, bottom: 10),
      padding: EdgeInsets.only(left: 14, top: 8, bottom: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "处理意见",
            style: TextStyle(color: ColorsStyle.c_333333, fontSize: 16),
          ),
          SizedBox(
            height: 6,
          ),
          Text(
            "图片与确认收货数量不符",
            style: TextStyle(color: ColorsStyle.c_FF4951),
          )
        ],
      ),
    );
  }

  Widget item04() {
    return Container(
        margin: EdgeInsets.only(top: 10, left: 16, right: 16, bottom: 15),
        width: double.infinity,
        child: MaterialButton(
            height: 50,
            minWidth: 100,
            color: ColorsStyle.c_3090FF,
            child: Text("重新上传", style: TextStyle(fontSize: 18)),
            textColor: Colors.white,
            onPressed: btnAction));
  }

  Widget item05() {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.only(
            top: 15,
            left: 15,
            right: 15,
          ),
          child: GridView(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                mainAxisSpacing: 15,
                crossAxisSpacing: 15,
                childAspectRatio: 1),
            children: makeImgItem(),
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(), //禁止滚动
          ),
        ),
      ],
    );
  }

  /// desc: 放大图片
  void _showBigImage(File value) {
    showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          insetPadding: const EdgeInsets.only(left: 0.0),
          child: PhotoView(
            tightMode: true,
            imageProvider: FileImage(
              File(value.path),
            ),
          ),
        );
      },
    );
  }

  /// desc: 生成GridView的items
  List<Widget> makeImgItem() {
    print("11111==${_imageFileList.length}");
    List<Widget> items = [];
    // _imageFileList.forEach((value) {
    //   items.add(imgItem(value));
    // });
    for (var i = 0; i < 4; i++) {
      items.add(imgItem());
    }

    // items.add(UpImgBtn(
    //   imgList: _imageFileList,
    //   callback: (reslut) {
    //     setState(() {
    //       _imageFileList.add(reslut);
    //     });
    //   },
    // ));
    return items;
  }

  Widget imgItem([bgColor]) {
    return Stack(
      children: [
        Container(
            width: double.infinity,
            height: double.infinity,
            color: bgColor,
            child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(5)),
                child: Image(
                  image: AssetImage("assets/images/coffee.png"),
                  width: 68.0,
                  height: 68.0,
                ))),
      ],
    );
  }
}
