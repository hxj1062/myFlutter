import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:myfluter/page_two.dart';

void main() {
  runApp(MyApp());

// 以下两行 设置android状态栏为透明的沉浸。写在组件渲染之后，是为了在渲染后进行set赋值，覆盖状态栏，写在渲染之前MaterialApp组件会覆盖掉这个值。
  SystemUiOverlayStyle systemUiOverlayStyle = const SystemUiOverlayStyle(
    statusBarColor: Color(0x00ffffff),
  );
  SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: "/",
        routes: {
          "/": (context) => const FirstPage(),
        });
  }
}

class FirstPage extends StatefulWidget {
  const FirstPage({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _FirstPageState createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
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
                padding: EdgeInsets.all(8),
                child: Text(
                  'Login',
                  style: TextStyle(fontSize: 42),
                )),
            Container(
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
                margin: const EdgeInsets.only(top: 40.0),
                width: 200.0,
                height: 40.0,
                child: (OutlinedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.blue),
                      foregroundColor: MaterialStateProperty.all(Colors.white),
                      overlayColor:
                          MaterialStateProperty.all(const Color(0xffADD8E6)),
                    ),
                    child: const Text(
                      "登录",
                      style: TextStyle(
                          fontSize: 16.0,
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.w100),
                    ),
                    onPressed: () {
                      validateInfo(
                          accountController.text, passwordController.text);
                    }))),
          ],
        ));
  }
}

void validateInfo(String account, String psw) {
  if (account.isEmpty) {
    showToast("用户名不能为空!");
    return;
  }
  if (account != "123456") {
    showToast("请输入正确的账号!");
    return;
  }
  if (psw.isEmpty) {
    showToast("密码不能为空!");
    return;
  }
  if (psw != "123456") {
    showToast("密码错误!");
    return;
  }
}

void showToast(String str) {
  Fluttertoast.showToast(
      msg: str,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.CENTER,
      timeInSecForIosWeb: 2,
      backgroundColor: const Color(0xFFF2F2F2),
      textColor: const Color(0xFFFF3030),
      fontSize: 14.0);
}

Widget _jumpPage(BuildContext context) {
  return Expanded(
      child: (Container(
    padding: const EdgeInsets.only(bottom: 40.0),
    alignment: Alignment.bottomCenter,
    child: (ElevatedButton(
      style:
          ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.red)),
      child: const Text(
        "跳转页面",
        style: TextStyle(
          fontSize: 16.0,
        ),
      ),
      onPressed: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => const PageTwo()));
      },
    )),
  )));
}
