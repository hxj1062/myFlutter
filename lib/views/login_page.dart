import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../utils/common_utils.dart';
import 'main_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final accountController = TextEditingController();
  final passwordController = TextEditingController();
  bool _isObscure = true;
  Color _eyeColor = Colors.grey;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: const Color(0x00ffffff),
          systemOverlayStyle: SystemUiOverlayStyle.dark,
        ),
        body: ListView(
          children: [
            const Padding(
                padding: EdgeInsets.all(20.0),
                child: Text(
                  'Login',
                  style: TextStyle(fontSize: 42.0),
                )),
            Container(
              margin: const EdgeInsets.only(left: 20.0, top: 60.0, right: 20.0),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.blue, width: 1),
                borderRadius: const BorderRadius.all(Radius.circular(6.0)),
              ),
              child: TextField(
                controller: accountController,
                decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintText: "请输入用户名",
                    hintStyle:
                        TextStyle(fontSize: 14.0, fontStyle: FontStyle.normal),
                    prefixIcon: Icon(Icons.person)),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              margin: const EdgeInsets.only(left: 20.0, top: 24.0, right: 20.0),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.blue, width: 1),
                borderRadius: const BorderRadius.all(Radius.circular(6.0)),
              ),
              child: TextField(
                obscureText: _isObscure,
                controller: passwordController,
                decoration: InputDecoration(
                    suffixIcon: IconButton(
                        icon: Icon(Icons.remove_red_eye),
                        color: _eyeColor,
                        onPressed: () {
                          setState(() {
                            _isObscure = !_isObscure;
                            _eyeColor = (_isObscure
                                ? Colors.grey
                                : Theme.of(context).iconTheme.color)!;
                          });
                        }),
                    border: InputBorder.none,
                    hintText: "请输入密码",
                    hintStyle: const TextStyle(
                        fontSize: 14.0, fontStyle: FontStyle.normal),
                    prefixIcon: Icon(Icons.lock)),
              ),
            ),
            Container(
                margin:
                    const EdgeInsets.only(left: 40.0, top: 60.0, right: 40.0),
                height: 46.0,
                child: (OutlinedButton(
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(22))),
                      backgroundColor:
                          MaterialStateProperty.all(const Color(0xCC1E90FF)),
                      foregroundColor: MaterialStateProperty.all(Colors.white),
                      overlayColor:
                          MaterialStateProperty.all(const Color(0xD81E90FF)),
                    ),
                    child: const Text(
                      "登录",
                      style: TextStyle(
                          fontSize: 16.0,
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.w100),
                    ),
                    onPressed: () {
                      validateInfo(accountController.text,
                          passwordController.text, context);
                    }))),
          ],
        ));
  }
}

void validateInfo(String account, String psw, BuildContext context) {
  if (account.isEmpty) {
    showToast("用户名不能为空!");
    return;
  }
  if (account != "123") {
    showToast("请输入正确的账号!");
    return;
  }
  if (psw.isEmpty) {
    showToast("密码不能为空!");
    return;
  }
  if (psw != "123") {
    showToast("密码错误!");
    return;
  }
  // 禁止返回其实用到的地方也是比较多的，例如三秒广告,登录界面等等
  //在跳转的同时将上一个栈给删掉了或者说替换称为空的了
  Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(builder: (builder) {
    return MainPage();
  }), (route) => route == null);
}
