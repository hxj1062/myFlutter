import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SpaceFitPage extends StatefulWidget {
  const SpaceFitPage({Key? key}) : super(key: key);

  @override
  State<SpaceFitPage> createState() => _SpaceFitPageState();
}

class _SpaceFitPageState extends State<SpaceFitPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("FittedBox组件"),
      ),
      body: Center(
        child: Column(
          children: [
            wContainer(BoxFit.none),
            Text('Wendux'),
            wContainer(BoxFit.contain),
            Text('Flutter中国'),
          ],
        ),
      ),
    );
  }

  Widget wContainer(BoxFit boxFit) {
    return Container(
      width: 50,
      height: 50,
      color: Colors.red,
      child: FittedBox(
        fit: boxFit,
        // 子容器超过父容器大小
        child: Container(width: 60, height: 70, color: Colors.blue),
      ),
    );
  }
}
