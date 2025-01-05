import 'dart:async';

import 'package:flutter/material.dart';
import 'package:min_shop_app/module/data.dart';
import 'package:min_shop_app/pages/order_page.dart';

class PaymentPage extends StatefulWidget {
  final List<FoodItem> cartItems;
  final String seatType;
  final String timeSlot;
  final DateTime date;

  const PaymentPage(
      {super.key,
      required this.date,
      required this.seatType,
      required this.timeSlot,
      required this.cartItems});

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  int _countDown = 60;
  late Timer _timer;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _startCountDown();
  }

  void _startCountDown() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (_countDown > 0) {
          _countDown--;
        } else {
          _timer.cancel();
          _showTimeoutDialog();
        }
      });
    });
  }

  void _showTimeoutDialog() {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: Text('支付超时'),
              content: Text('支付已超时，请重新提交订单'),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                    Navigator.of(context).pop();
                  },
                  child: Text('确认'),
                )
              ],
            ));
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _timer.cancel();
  }

  double get totalAmount {
    return widget.cartItems
        .fold(0.0, (sum, item) => sum + item.price * item.quantity);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('paymentPage'),
        backgroundColor: Colors.blue,
      ),
      body: Column(
        children: [
          Center(
            child: Text(
              '请在$_countDown秒内完成支付',
              style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
          ),
          SizedBox(
            height: 40,
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
          Text(
            '总计¥${totalAmount.toStringAsFixed(2)}',
            style: TextStyle(
                fontSize: 22, fontWeight: FontWeight.bold, color: Colors.black),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            width: 250,
            height: 45,
            child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => OrderPage(
                                cartItems: widget.cartItems,
                                date: widget.date,
                                seatType: widget.seatType,
                                timeSlot: widget.timeSlot,
                              )));
                },
                child: Text('支付')),
          )
        ],
      ),
    );
  }
}
