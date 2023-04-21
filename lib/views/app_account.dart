import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppAccountPage extends StatefulWidget {
  const AppAccountPage({Key? key}) : super(key: key);

  @override
  State<AppAccountPage> createState() => _AppAccountPageState();
}

class _AppAccountPageState extends State<AppAccountPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Row(
        children: [
          Padding(
            padding: EdgeInsets.only(top: 2, bottom: 2),
            child: Container(
              height: 35,
              width: MediaQuery.of(context).size.width - 140,
              decoration: BoxDecoration(
                  color: Color.fromRGBO(255, 255, 255, 1.0),
                  borderRadius: BorderRadius.circular(20)),
              child: InkWell(
                borderRadius: BorderRadius.circular(20),
                child: Row(
                  children: <Widget>[
                    Padding(
                        padding: EdgeInsets.only(left: 10, right: 10),
                        child: Icon(Icons.search, color: Colors.grey)),
                    Text("账号搜索",
                        style: TextStyle(color: Colors.grey, fontSize: 15)),
                  ],
                ),
                onTap: () {
                  ///这里是跳转搜索界面的关键
                },
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 14),
            child: Text(
              "搜索",
              style: TextStyle(fontSize: 18),
            ),
          ),
        ],
      )),
      body: Container(color: Colors.white),
    );
  }
}
