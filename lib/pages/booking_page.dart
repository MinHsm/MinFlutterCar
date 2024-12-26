import 'package:flutter/material.dart';
import 'package:min_shop_app/module/data.dart';

class BookingPage extends StatefulWidget {
  final CarData car;

  const BookingPage({super.key, required this.car});

  @override
  State<BookingPage> createState() => _BookingPageState();
}

class _BookingPageState extends State<BookingPage> {
  bool _isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MinFlutterApp'),
        backgroundColor: Colors.blue,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: 70,
              decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border(
                      bottom: BorderSide(
                    color: Color(0xBBDADADA),
                    width: 2,
                  ))),
              child: Padding(
                padding: EdgeInsets.only(left: 10, right: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Booking',
                      style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                    Container(
                      width: 50,
                      height: 50,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                      ),
                      child: const CircleAvatar(
                        backgroundImage: AssetImage('assets/guidao10.jpeg'),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 10),
                  child: Card(
                    elevation: 3,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    color: Colors.white,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding:
                              EdgeInsets.only(top: 10, left: 10, right: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                widget.car.name,
                                style: TextStyle(
                                    fontSize: 22, fontWeight: FontWeight.bold),
                              ),
                              Container(
                                height: 40,
                                width: 70,
                                decoration: BoxDecoration(
                                    color: const Color(0xfff5eecf),
                                    borderRadius: BorderRadius.circular(10)),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Icon(Icons.star, color: Color(0xFFF6DA3C)),
                                    Text(
                                      widget.car.rating.toString(),
                                      style: TextStyle(
                                          fontSize: 22,
                                          fontWeight: FontWeight.bold,
                                          color: Color(0xFFF6DA3C)),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 10, right: 10),
                          child: Text(
                            widget.car.description,
                            style: TextStyle(fontSize: 20, color: Colors.grey),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 10, right: 10, top: 5),
                          child: Container(
                            height: 20,
                            width: 120,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Container(
                                  width: 20,
                                  height: 20,
                                  child: Image.asset('assets/seat_icon.png'),
                                ),
                                const Text(
                                  '5',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16),
                                ),
                                Container(
                                  width: 20,
                                  height: 20,
                                  child: Image.asset('assets/gate_icon.png'),
                                ),
                                const Text(
                                  '4',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16),
                                ),
                                Container(
                                  width: 20,
                                  height: 20,
                                  child: Image.asset('assets/bag_icon.png'),
                                ),
                                const Text(
                                  '3',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding:
                              EdgeInsets.only(left: 10, right: 10, top: 10),
                          child: Container(
                            height: 140,
                            width: 380,
                            child: Image.asset(widget.car.imagePath),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              left: 10, right: 10, top: 10, bottom: 15),
                          child: Row(
                            children: [
                              Container(
                                width: 130,
                                height: 40,
                                child: Row(
                                  children: [
                                    Text(
                                      "\$${widget.car.pricePerDay.toStringAsFixed(0)}",
                                      style: TextStyle(
                                          fontSize: 32,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.blue),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(left: 5),
                                      child: Text(
                                        'per day',
                                        style: TextStyle(
                                            fontSize: 12, color: Colors.blue),
                                      ),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 10),
                  child: Card(
                      elevation: 3,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      color: Colors.white,
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: 115,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(left: 20, right: 20),
                              child: Container(
                                child: Icon(
                                  Icons.location_on,
                                  size: 35,
                                  color: Colors.grey,
                                ),
                              ),
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(top: 10),
                                  child: Text(
                                    '1560 Broadway\n' +
                                        'Unit 1001\n' +
                                        'New York,NY 10036\n' +
                                        'United States\n',
                                    style: TextStyle(
                                        fontSize: 15, color: Colors.grey),
                                  ),
                                )
                              ],
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 80),
                              child: Container(
                                width: 100,
                                height: 80,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage('assets/ic_map.jpg'),
                                        fit: BoxFit.cover)),
                              ),
                            )
                          ],
                        ),
                      )),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 10),
                  child: Card(
                    elevation: 3,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    color: Colors.white,
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: 80,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: 20, right: 20),
                            child: Container(
                              child: Icon(
                                Icons.access_time,
                                size: 35,
                                color: Colors.grey,
                              ),
                            ),
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(top: 15),
                                child: Text(
                                  '11/12/2020\n' + '14/12/2020\n',
                                  style: TextStyle(
                                      fontSize: 15,
                                      color: Colors.blue,
                                      fontWeight: FontWeight.bold),
                                ),
                              )
                            ],
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 80),
                            child: Container(
                              height: 60,
                              width: 160,
                              child: Row(
                                children: [
                                  Container(
                                      width: 45,
                                      height: 45,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(10),
                                        boxShadow: [
                                          BoxShadow(
                                            color: Color(0xFFE8E8E8),
                                            offset: Offset(8, 8),
                                            blurRadius: 10,
                                            spreadRadius: 1,
                                          ),
                                        ],
                                      ),
                                      child: ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10)),
                                              backgroundColor: Colors.white,
                                              padding: EdgeInsets.only(
                                                  left: 0, bottom: 20)),
                                          onPressed: () {},
                                          child: Icon(
                                            Icons.minimize_outlined,
                                            size: 30,
                                            color: Colors.blue,
                                          ))),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Container(
                                    height: 60,
                                    width: 55,
                                    child: Column(
                                      children: [
                                        Text(
                                          '3',
                                          style: TextStyle(
                                              color: Colors.blue,
                                              fontSize: 22,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Text(
                                          'Days',
                                          style: TextStyle(
                                              fontSize: 18,
                                              color: Colors.grey,
                                              fontWeight: FontWeight.bold),
                                        )
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Container(
                                      width: 45,
                                      height: 45,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(10),
                                        boxShadow: [
                                          BoxShadow(
                                            color: Color(0xFFE8E8E8),
                                            offset: Offset(8, 8),
                                            blurRadius: 10,
                                            spreadRadius: 1,
                                          ),
                                        ],
                                      ),
                                      child: ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10)),
                                              backgroundColor: Colors.white,
                                              padding: EdgeInsets.zero),
                                          onPressed: () {},
                                          child: Icon(
                                            Icons.add,
                                            size: 35,
                                            color: Colors.blue,
                                          ))),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 5),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: 80,
                    child: Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 10, right: 10),
                          child: Text(
                            '\$630',
                            style: TextStyle(
                                color: Colors.blue,
                                fontSize: 30,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Expanded(
                          child: Row(
                            children: [
                              Checkbox(
                                activeColor: Colors.blue,
                                checkColor: Colors.white,
                                value: _isChecked,
                                onChanged: (bool? value) {
                                  setState(() {
                                    _isChecked = value!;
                                  });
                                },
                                visualDensity: VisualDensity.compact,
                                materialTapTargetSize:
                                    MaterialTapTargetSize.shrinkWrap,
                              ),
                              Text(
                                'Accepted ',
                                style:
                                    TextStyle(fontSize: 14, color: Colors.grey),
                              ),
                              Expanded(
                                  child: Text(
                                'User Agreement',
                                style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.blue,
                                    decoration: TextDecoration.underline,
                                    decorationStyle: TextDecorationStyle.wavy,
                                    decorationThickness: 1,
                                    decorationColor: Colors.blue),
                                overflow: TextOverflow.ellipsis,
                              ))
                            ],
                          ),
                        ),
                        Container(
                          width: 105,
                          height: 40,
                          margin: EdgeInsets.only(right: 5, left: 5),
                          decoration: BoxDecoration(
                              color: Colors.blue,
                              borderRadius: BorderRadius.circular(10)),
                          child: ElevatedButton(
                            style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all(Colors.blue),
                                shape: WidgetStateProperty.all(
                                    RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ))),
                            onPressed: () {},
                            child: const Text(
                              'Pay Now',
                              style: TextStyle(color: Colors.white),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 40,
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
