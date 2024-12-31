import 'package:flutter/material.dart';
import 'package:min_shop_app/module/data.dart';
import 'package:min_shop_app/pages/payment_page.dart';

class FoodPage extends StatefulWidget {
  final String seatType;
  final String timeSlot;
  final DateTime date;

  const FoodPage(
      {super.key,
      required this.date,
      required this.seatType,
      required this.timeSlot});

  @override
  State<FoodPage> createState() => _FoodPageState();
}

class _FoodPageState extends State<FoodPage> {
  final List<String> images = [
    'assets/guidao6.jpeg',
    'assets/guidao7.jpeg',
    'assets/guidao8.jpeg'
  ];
  PageController _pageController = PageController();

  int footImgIndex = 0;

  final List<FoodItem> foodItems = [
    FoodItem(name: '鱼香茄子', price: 35, image: 'assets/guidao6.jpeg'),
    FoodItem(name: '客家豆腐煲', price: 45, image: 'assets/guidao7.jpeg'),
    FoodItem(name: '宫保鸡丁', price: 50, image: 'assets/guidao8.jpeg'),
  ];

  List<FoodItem> cartItems = [];

  double get totalAmount {
    return cartItems.fold(0, (sum, item) => sum + item.price * item.quantity);
  }

  void _goToNextPage() {
    if (footImgIndex < images.length - 1) {
      _pageController.nextPage(
          duration: Duration(milliseconds: 300), curve: Curves.easeInOut);
    }
  }

  void _goToPreviousPage() {
    if (footImgIndex > 0) {
      _pageController.previousPage(
          duration: Duration(milliseconds: 300), curve: Curves.easeInOut);
    }
  }

  void _showCart() {
    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
        builder: (BuildContext context) {
          return Container(
            padding: EdgeInsets.all(10),
            height: MediaQuery.of(context).size.height * 0.6,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '购物车',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(Icons.close, color: Colors.grey[700]),
                    ),
                  ],
                ),
                Divider(),
                Expanded(
                  child: cartItems.isEmpty
                      ? Center(
                          child: Text(
                            '购物车为空，请添加商品。',
                            style: TextStyle(color: Colors.grey, fontSize: 16),
                          ),
                        )
                      : ListView.builder(
                          itemCount: cartItems.length,
                          itemBuilder: (context, index) {
                            final item = cartItems[index];
                            return ListTile(
                              leading: Image.asset(
                                item.image,
                                width: 80,
                                height: 50,
                                fit: BoxFit.cover,
                              ),
                              title: Text(item.name),
                              subtitle: Text(
                                '¥${item.price} x ${item.quantity}',
                                style: TextStyle(color: Colors.grey),
                              ),
                              trailing: IconButton(
                                onPressed: () {
                                  setState(() {
                                    item.quantity--;
                                    if (item.quantity == 0) {
                                      cartItems.remove(item);
                                    }
                                  });
                                  Navigator.pop(context);
                                  _showCart();
                                },
                                icon: Icon(Icons.remove_circle_outline),
                              ),
                            );
                          },
                        ),
                ),
                Divider(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "总计: ￥${totalAmount.toStringAsFixed(2)}",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.blue),
                          shape: WidgetStateProperty.all(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ))),
                      onPressed: cartItems.isEmpty
                          ? null
                          : () {
                              // 处理支付逻辑
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => PaymentPage(
                                            cartItems: cartItems,
                                            date: widget.date,
                                            seatType: widget.seatType,
                                            timeSlot: widget.timeSlot,
                                          )));
                            },
                      child: Text(
                        "去支付",
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 40,
                )
              ],
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('FoodPage'),
        backgroundColor: Colors.blue,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 200,
                  child: PageView.builder(
                      controller: _pageController,
                      onPageChanged: (index) {
                        setState(() {
                          footImgIndex = index;
                        });
                      },
                      itemCount: images.length,
                      itemBuilder: (context, index) {
                        return Image.asset(
                          images[index],
                          fit: BoxFit.cover,
                        );
                      }),
                ),
                Positioned(
                    left: 10,
                    child: IconButton(
                        onPressed: _goToPreviousPage,
                        icon: Icon(
                          Icons.arrow_back_ios,
                          color: Colors.white,
                        ))),
                Positioned(
                    right: 10,
                    child: IconButton(
                        onPressed: _goToNextPage,
                        icon: Icon(
                          Icons.arrow_forward_ios,
                          color: Colors.white,
                        ))),
                Positioned(
                    bottom: 15,
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(images.length, (index) {
                          return Container(
                            width: 10,
                            height: 10,
                            margin: EdgeInsets.symmetric(
                                vertical: 10.0, horizontal: 2.0),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: footImgIndex == index
                                  ? Colors.blue
                                  : Colors.grey,
                            ),
                          );
                        })))
              ],
            ),
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: foodItems.length,
              itemBuilder: (context, index) {
                final item = foodItems[index];
                return Card(
                  margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                  child: Row(
                    children: [
                      Container(
                        margin: EdgeInsets.only(
                            left: 10, top: 5, bottom: 5, right: 10),
                        width: 100,
                        height: 80,
                        child: Image.asset(
                          item.image,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 10, right: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: 240,
                              height: 45,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    '${item.name}',
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black),
                                  ),
                                  Text(
                                    '¥${item.price}',
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black),
                                  )
                                ],
                              ),
                            ),
                            Container(
                              width: 110,
                              height: 25,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  IconButton(
                                      style: ButtonStyle(
                                          backgroundColor:
                                              MaterialStateProperty.all(
                                                  Colors.white),
                                          shape: WidgetStateProperty.all(
                                              RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          50)))),
                                      padding: EdgeInsets.zero,
                                      onPressed: () {
                                        setState(() {
                                          if (item.quantity > 0)
                                            item.quantity--;
                                          if (item.quantity == 0) {
                                            cartItems.remove(item);
                                          }
                                        });
                                      },
                                      icon: Icon(
                                        Icons.remove,
                                        size: 20,
                                      )),
                                  Text('${item.quantity}'),
                                  IconButton(
                                      style: ButtonStyle(
                                          backgroundColor:
                                              MaterialStateProperty.all(
                                                  Colors.white),
                                          shape: WidgetStateProperty.all(
                                              RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          50)))),
                                      padding: EdgeInsets.zero,
                                      onPressed: () {
                                        setState(() {
                                          item.quantity++;
                                          if (!cartItems.contains(item)) {
                                            cartItems.add(item);
                                          }
                                        });
                                      },
                                      icon: Icon(
                                        Icons.add,
                                        size: 20,
                                      ))
                                ],
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                );
              },
            ),
            Container(
              padding: EdgeInsets.only(left: 20, right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                      onPressed: cartItems.isEmpty ? null : _showCart,
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          Icon(
                            Icons.shopping_cart,
                            color: cartItems.isEmpty
                                ? Colors.grey[700]
                                : Colors.blue,
                          ),
                          if (cartItems.isNotEmpty)
                            Positioned(
                                right: 0,
                                top: 0,
                                child: Container(
                                  width: 15,
                                  height: 15,
                                  decoration: BoxDecoration(
                                      color: Colors.red,
                                      shape: BoxShape.circle),
                                  child: Center(
                                    child: Text(
                                      '${cartItems.length}',
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 10),
                                    ),
                                  ),
                                ))
                        ],
                      )),
                  Text(
                    '总计:¥${totalAmount.toStringAsFixed(2)}',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
