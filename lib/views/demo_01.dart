import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Stack Example'),
        ),
        body: MyStack(),
      ),
    );
  }
}

class MyStack extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        alignment: Alignment.topCenter,
        children: <Widget>[
          Container(
            width: double.infinity,
            height: 200,
            color: Colors.blue,
            child: Center(
              child: Text(
                '',
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            ),
          ),
          ClipRect(
            child: Align(
              alignment: Alignment.topCenter,
              child: Container(
                margin: EdgeInsets.only(top: 80, left: 20, right: 20),
                width: double.infinity,
                height: 300,
                color: Colors.red,
                child: Center(
                  child: Text(
                    '',
                    style: TextStyle(color: Colors.black, fontSize: 20),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
