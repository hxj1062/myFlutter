import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:photo_view/photo_view.dart';

typedef CommonACallback = void Function(dynamic reslut);

class SnapProductImg extends StatefulWidget {
  @override
  _SnapProductImgState createState() => _SnapProductImgState();
}

class _SnapProductImgState extends State<SnapProductImg> {
  List<File> _imageFileList = []; // 存放图片的数组

  @override
  Widget build(BuildContext context) {
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
            children: buildItems(),
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
  List<Widget> buildItems() {
    print("11111==$_imageFileList");
    List<Widget> items = [];
    _imageFileList.forEach((value) {
      items.add(baseItem(value));
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

  Widget baseItem(value, [bgColor]) {
    print("22222==$value");
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
    showModalBottomSheet(
        context: context,
        backgroundColor: Colors.transparent,
        builder: (BuildContext context) {
          return Container(
            margin: EdgeInsets.only(left: 15, right: 15, bottom: 10), //控制底部的距离
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
  }
}
