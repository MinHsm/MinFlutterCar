import 'package:flutter/material.dart';

import '../module/data.dart';

class OrderPage extends StatefulWidget {
  final List<FoodItem> cartItems;
  final String seatType;
  final String timeSlot;
  final DateTime date;

  const OrderPage(
      {super.key,
      required this.cartItems,
      required this.timeSlot,
      required this.seatType,
      required this.date});

  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  double get totalAmount {
    return widget.cartItems
        .fold(0.0, (sum, item) => sum + item.price * item.quantity);
  }

  String _formattedDate(DateTime date) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    String year = date.year.toString();
    String month = twoDigits(date.month);
    String day = twoDigits(date.day);
    return '$year-$month-$day';
  }

  @override
  Widget build(BuildContext context) {
    final String formDate = _formattedDate(widget.date);

    return Scaffold(
      appBar: AppBar(
        title: Text('OrderPage'),
        backgroundColor: Colors.blue,
        leading: IconButton(
            onPressed: () {
              Navigator.popUntil(
                  context, (router) => router.settings.name == '/foodPage');
            },
            icon: Icon(Icons.arrow_back)),
      ),
      body: Column(
        children: [
          Center(
            child: Text(
              '预约成功',
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Center(
            child: Text(
              '日期: ' + formDate,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Center(
            child: Text('时间段: ' + widget.timeSlot,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          ),
          SizedBox(
            height: 15,
          ),
          Center(
            child: Text('餐桌类型: ' + widget.seatType,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          ),
          SizedBox(
            height: 30,
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: 300,
            child: ListView.builder(
              itemCount: widget.cartItems.length,
              itemBuilder: (context, index) {
                final item = widget.cartItems[index];
                return ListTile(
                  leading: Image.asset(
                    item.image,
                    width: 80,
                    height: 50,
                    fit: BoxFit.cover,
                  ),
                  title: Text(item.name),
                  subtitle: Text('¥${item.price} x ${item.quantity}'),
                );
              },
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                width: 120,
                height: 40,
                child: ElevatedButton(
                    onPressed: () {
                      Navigator.popUntil(context,
                          (router) => router.settings.name == '/foodPage');
                    },
                    child: Text('完成')),
              ),
              Text(
                '总计' + totalAmount.toStringAsFixed(2),
                style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
            ],
          )
        ],
      ),
    );
  }
}
