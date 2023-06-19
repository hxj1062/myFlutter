import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myfluter/utils/common_utils.dart';

class AppAccountPage extends StatefulWidget {
  const AppAccountPage({Key? key}) : super(key: key);

  @override
  State<AppAccountPage> createState() => _AppAccountPageState();
}

class _AppAccountPageState extends State<AppAccountPage> {
  TextEditingController _accountController = TextEditingController();
  var accountList = <String>[
    "000",
    "111",
    "222",
    "333",
    "444",
    "555",
    "666",
    "777",
    "888",
    "999"
  ];

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
                child: TextField(
                  controller: _accountController,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "输入账号",
                      prefixIcon: Icon(
                        Icons.search,
                        color: Colors.grey,
                      )),
                  onChanged: (value) {},
                )),
          ),
          Container(
              margin: EdgeInsets.only(left: 14),
              child: InkWell(
                child: Text(
                  "搜索",
                  style: TextStyle(fontSize: 18),
                ),
                onTap: () {
                  setState(() {
                    var anc = _accountController.text;
                    for (var element in accountList) {
                      if (element == anc) {
                        accountList.clear();
                        accountList.add(anc);
                      }
                    }
                  });
                },
              )),
        ],
      )),
      body: ListView.separated(
        itemBuilder: (context, index) {
          return _accountItem(accountList[index]);
        },
        separatorBuilder: (context, index) => Divider(
          color: const Color(0xFFE5E5E5),
          height: 1,
          thickness: 1,
        ),
        itemCount: accountList.length,
      ),
    );
  }

  void initData() {
    accountList = <String>[
      "000",
      "111",
      "222",
      "333",
      "444",
      "555",
      "666",
      "777",
      "888",
      "999"
    ];
  }

  Widget _accountItem(String account) {
    return InkWell(
      splashColor: Colors.orange,
      child: Container(
        height: 50,
        alignment: Alignment.center,
        child: Text(
          account,
          style: TextStyle(fontSize: 18, color: Colors.black),
        ),
      ),
      onTap: () {
        setState(() {
          showToast("选择帐号: " + account);
        });
      },
    );
  }
}
