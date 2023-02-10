import 'package:flutter/material.dart';
import 'package:myfluter/views/fourth_page.dart';

class AccountInfoPage extends StatefulWidget {
  const AccountInfoPage({Key? key}) : super(key: key);

  @override
  State<AccountInfoPage> createState() => _AccountInfoPageState();
}

class _AccountInfoPageState extends State<AccountInfoPage> {
  List<BankDetailItemModel> datas = [];
  String str = "";

  @override
  void initState() {
    super.initState();
    initData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff5f5f5),
      appBar: AppBar(
        centerTitle: true,
        title: const Text("账户信息"),
      ),
      body: ListView.separated(
        itemBuilder: (BuildContext context, int index) {
          var model = datas[index];
          if (model.tag == 1) {
            return Container(
              child: item1(model as BankDetailItemModelA),
            );
          }
          if (model.tag == 2) {
            return Container(
              color: Colors.white,
              child: item2(model as BankDetailItemModelB),
            );
          }
          if (model.tag == 3) {
            return Container(
              child: item3(model as BankDetailItemModelC),
            );
          }
          if (model.tag == 4) {
            return Container(
              width: 60.0,
              child: item4(model as BankDetailItemModelA),
            );
          }
          return const SizedBox(
            width: 1,
            height: 1,
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          var model = datas[index];
          return index <= 4
              ? Divider(
                  color: const Color(0xFFE5E5E5),
                  height: model.separator,
                  thickness: model.separator,
                )
              : Divider(
                  color: const Color(0xFFf5f5f5),
                  height: 12.0,
                  thickness: model.separator,
                );
        },
        itemCount: datas.length,
      ),
    );
  }

  initData() {
    datas.clear();

    var dataA = BankDetailItemModelA();
    dataA.tag = 1;
    dataA.contentA = "银行卡线下转账请确认后转入以下收款账户";
    datas.add(dataA);

    var dataB = BankDetailItemModelB();
    dataB.tag = 2;
    dataB.leftName = "账户名称";
    dataB.rightContent = "深圳有算科技股份有限公司";
    datas.add(dataB);

    dataB = BankDetailItemModelB();
    dataB.tag = 2;
    dataB.leftName = "收款账号";
    dataB.rightContent = "1234 5678 1234 6789";
    datas.add(dataB);

    dataB = BankDetailItemModelB();
    dataB.tag = 2;
    dataB.leftName = "所属银行";
    dataB.rightContent = "华夏银行";
    datas.add(dataB);

    dataB = BankDetailItemModelB();
    dataB.tag = 2;
    dataB.leftName = "联行号";
    dataB.rightContent = "123273";
    datas.add(dataB);

    dataA = BankDetailItemModelA();
    dataA.tag = 1;
    dataA.contentA = "建议使用以下账户转账至收款账户，其他账户可能出现不成功退款情况，敬请知悉";
    datas.add(dataA);

    var dataC = BankDetailItemModelC();
    dataC.tag = 3;
    dataC.accountName = "深圳有算科技股份有限公司";
    dataC.accountNo = "1234 5678 8286 2323";
    dataC.bankName = "建设银行";
    dataC.bankNum = " 12345";
    datas.add(dataC);

    dataA = BankDetailItemModelA();
    dataA.tag = 4;
    dataA.contentA = "跳转页面";
    datas.add(dataA);
  }

  Widget item1(BankDetailItemModelA modeA) {
    return Container(
        width: double.infinity,
        padding: const EdgeInsets.only(left: 15.0, top: 16.0, bottom: 10.0),
        child: Text(
          modeA.contentA,
          style: const TextStyle(
            fontSize: 14.0,
            color: Color(0xff666666),
          ),
        ));
  }

  Widget item2(BankDetailItemModelB modelB) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
            padding: const EdgeInsets.only(left: 15.0, top: 20.0, bottom: 19.0),
            child: Text(
              modelB.leftName,
              style: const TextStyle(fontSize: 15.0, color: Color(0xff333333)),
            )),
        Wrap(
          crossAxisAlignment: WrapCrossAlignment.center,
          children: [
            Text(
              modelB.rightContent,
              style: const TextStyle(
                  fontSize: 15.0,
                  color: Color(0xff333333),
                  fontWeight: FontWeight.w600),
            ),
            const SizedBox(
              width: 16.0,
            ),
            Offstage(
                offstage: modelB.leftName == "收款账号" ? false : true,
                child: Container(
                  margin: const EdgeInsets.only(right: 16.0),
                  child: TextButton(
                    onPressed: () {},
                    style: ButtonStyle(
                        visualDensity: VisualDensity.compact,
                        minimumSize:
                            MaterialStateProperty.all(const Size(20.0, 10.0)),
                        shape: MaterialStateProperty.all(
                          ContinuousRectangleBorder(
                              side: const BorderSide(color: Colors.blue),
                              borderRadius: BorderRadius.circular(10)),
                        )),
                    child: const Text(
                      "复制",
                      style:
                          TextStyle(fontSize: 15.0, color: Color(0xff3090ff)),
                    ),
                  ),
                ))
          ],
        )
      ],
    );
  }

  Widget item3(BankDetailItemModelC modelC) {
    return Container(
      margin: const EdgeInsets.only(left: 10.0, right: 10.0),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(6.0)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                padding:
                    const EdgeInsets.only(left: 12.0, top: 10.0, bottom: 4.0),
                child: const Text(
                  "账户名称：",
                  style: TextStyle(fontSize: 15.0, color: Color(0xff666666)),
                ),
              ),
              Container(
                  padding: const EdgeInsets.only(
                      top: 10.0, bottom: 4.0, right: 16.0),
                  child: Text(
                    modelC.accountName,
                    style: const TextStyle(
                        fontSize: 15.0, color: Color(0xff666666)),
                  ))
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                  padding:
                      const EdgeInsets.only(left: 12.0, top: 4.0, bottom: 4.0),
                  child: const Text(
                    "收款账号：",
                    style: TextStyle(fontSize: 15.0, color: Color(0xff666666)),
                  )),
              Wrap(
                crossAxisAlignment: WrapCrossAlignment.center,
                children: <Widget>[
                  Text(
                    modelC.accountNo,
                    style: const TextStyle(
                      fontSize: 15.0,
                      color: Color(0xff666666),
                    ),
                  ),
                  const SizedBox(
                    width: 8.0,
                  ),
                  Container(
                    margin: const EdgeInsets.only(right: 16.0),
                    child: TextButton(
                      onPressed: () {},
                      style: ButtonStyle(
                          visualDensity: VisualDensity.compact,
                          minimumSize:
                              MaterialStateProperty.all(const Size(16.0, 10.0)),
                          shape: MaterialStateProperty.all(
                            ContinuousRectangleBorder(
                                side: const BorderSide(color: Colors.blue),
                                borderRadius: BorderRadius.circular(10)),
                          )),
                      child: const Text(
                        "复制",
                        style:
                            TextStyle(fontSize: 15.0, color: Color(0xff3090ff)),
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Container(
                  padding:
                      const EdgeInsets.only(left: 12.0, top: 4.0, bottom: 6.0),
                  child: const Text(
                    "所属银行：",
                    style: TextStyle(fontSize: 15.0, color: Color(0xff666666)),
                  )),
              Container(
                padding:
                    const EdgeInsets.only(right: 16.0, top: 4.0, bottom: 6.0),
                child: Text(
                  modelC.bankName,
                  style: const TextStyle(
                    fontSize: 15.0,
                    color: Color(0xff666666),
                  ),
                ),
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Container(
                  padding:
                      const EdgeInsets.only(left: 12.0, top: 6.0, bottom: 10.0),
                  child: const Text(
                    "联行号：",
                    style: TextStyle(fontSize: 15.0, color: Color(0xff666666)),
                  )),
              Container(
                padding:
                    const EdgeInsets.only(right: 16.0, top: 6.0, bottom: 10.0),
                child: Text(
                  modelC.bankNum,
                  style: const TextStyle(
                    fontSize: 15.0,
                    color: Color(0xff666666),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget item4(BankDetailItemModelA modeA) {
    return Container(
      alignment: Alignment.center,
      child: Column(children: [
        ElevatedButton(
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.red)),
          child: Text(
            modeA.contentA,
            style: const TextStyle(fontSize: 16.0),
          ),
          onPressed: () async {
            var result = await Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => FourthPage(txt: "第三页传过来的666")));
            setState(() {
              str = result;
            });
          },
        ),
        Text(
          str,
          style: const TextStyle(
              fontSize: 16.0, color: Colors.black, fontWeight: FontWeight.bold),
        )
      ]),
    );
  }
}

class BankDetailItemModel {
  int tag = 0;
  double separator = 1;
}

class BankDetailItemModelA extends BankDetailItemModel {
  // 描述文字
  late String contentA;
}

class BankDetailItemModelB extends BankDetailItemModel {
  // 左侧名称
  late String leftName;

  // 右侧内容
  late String rightContent;
}

class BankDetailItemModelC extends BankDetailItemModel {
  // 账户名称
  late String accountName;

  // 收款账号
  late String accountNo;

  // 所属银行
  late String bankName;

  // 联行号
  late String bankNum;
}
