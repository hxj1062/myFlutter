import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../style/color_style.dart';

class SwitchEg extends StatefulWidget {
  const SwitchEg({Key? key}) : super(key: key);

  @override
  State<SwitchEg> createState() => _SwitchEgState();
}

class _SwitchEgState extends State<SwitchEg> {
  bool isSwitched = true; // 单选开关状态,
  bool _switchValue = true; // 单选开关状态,
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          centerTitle: true,
          title: const Text("单选开关"),
          backgroundColor: const Color(0xff3090FF),
        ),
        body: Column(
          children: [
            Offstage(
              offstage: false,
              child: Switch(
                value: isSwitched,
                onChanged: (bool value) {
                  setState(() {
                    isSwitched = value;
                  });
                },
                activeTrackColor: ColorsStyle.c_FF6600,
                inactiveTrackColor: ColorsStyle.c_E4E5E6,
                trackOutlineColor: MaterialStateProperty.all(Colors.white),
                activeThumbImage: AssetImage("assets/images/btn_open.png"),
                inactiveThumbImage: AssetImage("assets/images/btn_close.png"),
              ),
            ),
            Offstage(
              offstage: false,
              child: CupertinoSwitch(
                value: _switchValue,
                onChanged: (value) {
                  setState(() {
                    _switchValue = value;
                  });
                },
                thumbColor: ColorsStyle.c_FFFFFF, // 设置开关的颜色
                trackColor: ColorsStyle.c_E4E5E6,
                activeColor: ColorsStyle.c_FF6600, // 设置开关激活时的颜色
              ),
            )
          ],
        ));
  }
}
