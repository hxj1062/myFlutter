import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myfluter/views/login_page.dart';
import 'package:myfluter/views/main_page.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 1), () {
      // 1秒后跳转到登录页
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => const MainPage()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xff17afe1),
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Image.asset("assets/images/welcome_img.jpg"),
    );
  }
}
