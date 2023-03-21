import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class CameraPage extends StatefulWidget {
  const CameraPage({Key? key}) : super(key: key);

  @override
  State<CameraPage> createState() => _CameraPageState();
}

class _CameraPageState extends State<CameraPage> {
  final picker = ImagePicker();
  File? _imgPath;

  Future getImage(bool isTakePhoto) async {
    try {
      var pickedFile = await picker.getImage(
          source: isTakePhoto ? ImageSource.camera : ImageSource.gallery);
      if (pickedFile != null) {
        setState(() {
          _imgPath = File(pickedFile.path);
        });
      } else {
        print('没有选择任何图片');
      }
    } catch (e) {
      print("该手机不支持相机");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("拍照"),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          children: [
            MaterialButton(
                textTheme: ButtonTextTheme.normal,
                minWidth: 80,
                height: 40,
                color: Colors.blue,
                onPressed: () {
                  getImage(true);
                },
                child: Text(
                  "拍照",
                  style: TextStyle(fontSize: 16, color: Colors.white),
                )),
            SizedBox(
              height: 18,
            ),
            MaterialButton(
                minWidth: 80,
                height: 40,
                color: Colors.blue,
                onPressed: () {
                  getImage(false);
                },
                child: Text("选择照片",
                    style: TextStyle(fontSize: 16, color: Colors.white))),
            SizedBox(height: 18),
            Container(
                width: 100,
                height: 100,
                child: _imgPath != null
                    ? Image.file(
                        _imgPath!,
                        fit: BoxFit.cover,
                      )
                    : Center(
                        child: Text(
                        "没有选择照片",
                        style: TextStyle(fontSize: 16, color: Colors.black),
                      )))
          ],
        ),
      ),
    );
  }
}
