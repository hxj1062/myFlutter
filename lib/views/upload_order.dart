import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:myfluter/views/num_change.dart';

import 'package:photo_view/photo_view.dart';

import '../style/color_style.dart';
import '../utils/common_utils.dart';

typedef CommonACallback = void Function(dynamic reslut);

class UploadOrderApp extends StatefulWidget {
  const UploadOrderApp({Key? key}) : super(key: key);

  @override
  State<UploadOrderApp> createState() => _UploadOrderAppState();
}

class _UploadOrderAppState extends State<UploadOrderApp> {
  List<File> _imageFileList = []; // 存放图片的数组

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff5f5f5),
      appBar: AppBar(
        elevation: 0.0,
        title: Text("上传验收单"),
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
            SizedBox(
              height: 12,
              width: double.infinity,
            ),
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

  void returnAction() {
    showToast("返回");
  }

  void submitAction() {
    showToast("提交");
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
                style: TextStyle(color: Colors.black, fontSize: 18.0)),
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
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text("实收数量",
                      style:
                          TextStyle(color: ColorsStyle.c_666666, fontSize: 13)),
                  NumChangeWidget(
                    onValueChanged: (int value) {
                      print("加减号==${value}");
                    },
                  )
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
          RichText(
              text: TextSpan(children: [
            TextSpan(
                text: "上传验收单照片",
                style: TextStyle(color: Colors.black, fontSize: 15.0)),
            TextSpan(
                text: "(必填)",
                style: TextStyle(color: ColorsStyle.c_666666, fontSize: 12.0))
          ])),
          item05(),
          SizedBox(
            height: 8,
          ),
          Text(
            "最多上传6张",
            style: TextStyle(color: ColorsStyle.c_999999),
          )
        ],
      ),
    );
  }

  Widget item04() {
    return Row(
      children: [
        Expanded(
            child: MaterialButton(
                height: 50,
                minWidth: 100,
                color: Colors.white,
                child: Text("返回", style: TextStyle(fontSize: 18)),
                textColor: Colors.black,
                onPressed: returnAction)),
        Expanded(
            child: MaterialButton(
                height: 50,
                minWidth: 100,
                color: Colors.blue,
                child: Text(
                  "提交",
                  style: TextStyle(fontSize: 18),
                ),
                textColor: Colors.white,
                onPressed: submitAction))
      ],
    );
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

  /// desc: 删除图片
  void _delImg(File value) {
    setState(() {
      this._imageFileList.remove(value);
    });
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
    print("11111==${_imageFileList}");
    List<Widget> items = [];
    _imageFileList.forEach((value) {
      items.add(imgItem(value));
    });

    items.add(UpImgBtn(
      imgList: _imageFileList,
      callback: (reslut) {
        setState(() {
          _imageFileList.add(reslut);
        });
      },
    ));
    return items;
  }

  Widget imgItem(value, [bgColor]) {
    return Stack(
      children: [
        Container(
            width: double.infinity,
            height: double.infinity,
            color: bgColor,
            child: GestureDetector(
              onTap: () => _showBigImage(value),
              child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                  child: Image.file(
                    value,
                    fit: BoxFit.cover,
                  )),
            )),
        Positioned(
          child: GestureDetector(
            onTap: () => _delImg(value),
            behavior: HitTestBehavior.translucent,
            child: Image(
              image: AssetImage("assets/images/huise.png"),
              width: 20,
              height: 20,
            ),
          ),
          top: 0,
          right: 0,
        )
      ],
    );
  }
}

//添加图片
class UpImgBtn extends StatefulWidget {
  List<File>? imgList;
  CommonACallback callback;

  UpImgBtn({
    Key? key,
    this.imgList,
    required this.callback,
  }) : super(key: key);

  @override
  _UpImgBtnState createState() => _UpImgBtnState();
}

class _UpImgBtnState extends State<UpImgBtn> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: showSelectPhotoDialog,
      child: Container(
        decoration: BoxDecoration(
          color: Color(0xfff7f7f7),
          borderRadius: BorderRadius.all(Radius.circular(5)),
        ),
        child: FittedBox(
          fit: BoxFit.cover,
          child: Container(
            margin: EdgeInsets.only(bottom: 5),
            child: Image(
              image: AssetImage("assets/images/upload_image.png"),
            ),
          ),
        ),
      ),
    );
  }

  Future getImage(bool isTakePhoto) async {
    try {
      var pickedFile = await ImagePicker().getImage(
          source: isTakePhoto ? ImageSource.camera : ImageSource.gallery);
      if (pickedFile != null) {
        widget.callback(File(pickedFile!.path));
      } else {
        if (kDebugMode) {
          print('没有选择任何图片');
        }
      }
    } catch (e) {
      print("该手机不支持相机");
    }
  }

  // 选择拍照或相册
  void showSelectPhotoDialog() {
    if (widget.imgList!.length < 6) {
      showModalBottomSheet(
          context: context,
          isDismissible: true,
          backgroundColor: Colors.transparent,
          builder: (BuildContext context) {
            return Container(
              margin: EdgeInsets.only(left: 15, right: 15, bottom: 10),
              //控制底部的距离
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    child: Column(
                      children: <Widget>[
                        InkWell(
                          onTap: () async {
                            Navigator.pop(context);
                            var xFile = await getImage(true);
                          },
                          child: Container(
                            height: 50,
                            child: Center(
                              child: Text(
                                '拍照',
                                style: TextStyle(
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Divider(
                          height: 1,
                          color: Colors.grey,
                        ),
                        InkWell(
                          onTap: () async {
                            Navigator.pop(context);
                            var xFile = await getImage(false);
                          },
                          child: Container(
                            height: 50,
                            child: Center(
                              child: Text(
                                '相册',
                                style: TextStyle(
                                  fontSize: 16,
                                  letterSpacing: 2.0,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          });
    } else {
      showToast("最多上传6张");
    }
  }
}
