import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

// import 'package:n9a_crm/widgets/tip/tip.dart';
typedef CommonACallback = void Function(dynamic reslut);

class ProductImg extends StatefulWidget {
  @override
  _ProductImgState createState() => _ProductImgState();
}

class _ProductImgState extends State<ProductImg> {
  File? _imgPath;
  List<File> imgs22 = [];

  _deleImg(File value) {
    setState(() {
      this.imgs22.remove(value);
    });
  }

  // 生成GridView的items
  List<Widget> buildItems() {
    print("11111==$imgs22");
    List<Widget> items = [];
    imgs22.forEach((value) {
      items.add(baseItem(value));
    });
    items.add(UpBtn(
      imgList: imgs22,
      callback: (reslut) {
        setState(() {
          imgs22.add(reslut);
        });
      },
    ));
    return items;
  }

  // 基础展示的item 此处设置width,height对GridView 无效，主要是偷懒给feedback用
  Widget baseItem(value, [bgColor]) {
    print("22222==$value");
    return Stack(
      children: [
        Container(
            width: double.infinity,
            height: double.infinity,
            color: bgColor,
            child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(5)),
                child: Image.file(
                  value,
                  fit: BoxFit.cover,
                ))),
        Positioned(
          child: GestureDetector(
            onTap: () => _deleImg(value),
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

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Tip(text: '支持 jpg、png格式，拖动图片重新排序，默认第一张图片为主图，建议每张上传文件大小200K以内'),
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
}

//添加图片
class UpBtn extends StatefulWidget {
  List<File>? imgList;

  CommonACallback callback;

  UpBtn({
    Key? key,
    this.imgList,
    required this.callback,
  }) : super(key: key);

  @override
  _UpBtnState createState() => _UpBtnState();
}

class _UpBtnState extends State<UpBtn> {
  //选择相册照片
  Future getImage() async {
    var imageUrl = await ImagePicker().getImage(source: ImageSource.gallery);

    // setState(() {
    //   widget.imgList?.add(File(imageUrl!.path));
    // });
    widget.callback(File(imageUrl!.path));
    // setState(() {
    //   _ProductImgState().imgs22.add(File(imageUrl!.path));
    // });
    print("33333${widget.imgList}");
    print("44444${_ProductImgState().imgs22}");
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: getImage,
      child: Container(
        decoration: BoxDecoration(
          color: Color(0xfff7f7f7),
          borderRadius: BorderRadius.all(Radius.circular(5)),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.only(bottom: 5),
              child: Image(
                width: 20,
                height: 20,
                image: AssetImage("assets/images/upload_image.png"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
