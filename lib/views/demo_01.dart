import 'package:flutter/material.dart';


class Demo222 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: PaymentInfoPage(),
    );
  }
}

class PaymentInfoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('付款日查询'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // 付款日信息
            PaymentInfoCard(
              date: '2024年7月1日',
              time: '14:39:21',
              amount: 53.92,
              itemCount: 12,
              historicalAmount: 2.00,
              historicalItemCount: 1,
            ),
          ],
        ),
      ),
    );
  }
}

class PaymentInfoCard extends StatelessWidget {
  final String date;
  final String time;
  final double amount;
  final int itemCount;
  final double historicalAmount;
  final int historicalItemCount;

  PaymentInfoCard({
    required this.date,
    required this.time,
    required this.amount,
    required this.itemCount,
    required this.historicalAmount,
    required this.historicalItemCount,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 8,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              '付款日',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text('日期: $date'),
            Text('时间: $time'),
            SizedBox(height: 8),
            Text('今日付款金额: ¥${amount.toStringAsFixed(2)}'),
            Text('今日付款品数: $itemCount'),
            SizedBox(height: 8),
            Text('历史订单今日付款: ¥${historicalAmount.toStringAsFixed(2)}，商品$historicalItemCount个'),
          ],
        ),
      ),
    );
  }
}