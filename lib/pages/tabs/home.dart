import 'package:flutter/material.dart';
import 'package:min_shop_app/module/data.dart';
import 'package:min_shop_app/pages/booking_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _controller = TextEditingController();

  final List<Data> carItems = [
    Data(
        carName: 'BWM M5 G-Power',
        carImg: 'assets/bmw_m5_img.png',
        userImg: 'assets/bmw_user_img.png'),
    Data(
        carName: 'Ford Mustang GT',
        carImg: 'assets/ford_mustang.png',
        userImg: 'assets/guidao7.jpeg'),
    Data(
        carName: 'Audi A7 2018',
        carImg: 'assets/audi.png',
        userImg: 'assets/guidao8.jpeg'),
    Data(
        carName: 'Mercedes-Benz SLS',
        carImg: 'assets/mercedes.png',
        userImg: 'assets/guidao10.jpeg'),
  ];

  final List<CarData> carImages = [
    CarData(
        name: 'BMW X4 Sports',
        imagePath: 'assets/bmw_car_img.png',
        description: '2019 · Comfort Class',
        pricePerDay: 210,
        rating: 4.8),
    CarData(
        name: 'BMW X4 Sports',
        imagePath: 'assets/bmw_car_img_black.png',
        description: '2019 · Comfort Class',
        pricePerDay: 210,
        rating: 4.8),
    CarData(
        name: 'BMW X4 Sports',
        imagePath: 'assets/bmw_car_img_red.jpg',
        description: '2019 · Comfort Class',
        pricePerDay: 210,
        rating: 4.8),
    CarData(
        name: 'BMW X4 Sports',
        imagePath: 'assets/bmw_car_img_sliver.jpg',
        description: '2019 · Comfort Class',
        pricePerDay: 210,
        rating: 4.8),
  ];
  List titleList = ["EXPLORE", "CARS", "TRUCKS", "SCOOTERS"];
  int titleIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(color: Colors.white),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Explore',
                        style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                        ),
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
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    children: [
                      Container(
                        height: 55,
                        width: MediaQuery.of(context).size.width - 80,
                        decoration: BoxDecoration(
                            color: Color(0xFFEAEAEA),
                            borderRadius: BorderRadius.circular(15)),
                        child: Align(
                          alignment: Alignment.center,
                          child: TextField(
                            textAlignVertical: TextAlignVertical.center,
                            controller: _controller,
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: 'What transport do you want?',
                                prefixIcon: Icon(Icons.search),
                                suffixIcon: IconButton(
                                  icon: Icon(Icons.clear),
                                  onPressed: () {
                                    setState(() {
                                      _controller.clear();
                                    });
                                  },
                                ),
                                contentPadding: const EdgeInsets.symmetric(
                                    vertical: 0, horizontal: 10)),
                          ),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(left: 15),
                        child: Image.asset('assets/filter_icon.png'),
                      )
                    ],
                  ),
                ),
                Container(
                  height: 40,
                  width: MediaQuery.of(context).size.width,
                  child: Row(children: [
                    for (var i = 0; i < titleList.length; i++)
                      Expanded(
                        flex: 1,
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              titleIndex = i;
                            });
                          },
                          child: Container(
                            height: 40,
                            margin: EdgeInsets.only(left: i == 0 ? 0 : 15),
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                border: Border(
                                    bottom: BorderSide(
                                        color: titleIndex == i
                                            ? Colors.blue
                                            : Colors.white,
                                        width: 2))),
                            child: Text(
                              titleList[i],
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ),
                  ]),
                )
              ],
            ),
          ),
          Container(
              height: 340,
              child: Padding(
                  padding: EdgeInsets.all(10),
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: carImages.length,
                      itemBuilder: (context, index) {
                        final car = carImages[index];
                        return CarCard(car: car);
                      }))),
          Container(
              height: 300,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Text(
                      'Trending Categories',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.start,
                    ),
                  ),
                  Container(
                    height: 130,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(right: 15, left: 10),
                          child: Row(
                            children: [
                              Container(
                                height: 130,
                                width: 240,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    image: DecorationImage(
                                        image: AssetImage(
                                            'assets/show_bikes_img.png'))),
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(right: 10),
                          child: Row(
                            children: [
                              Container(
                                height: 130,
                                width: 240,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    image: DecorationImage(
                                        image:
                                            AssetImage('assets/car_img.png'))),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    height: 130,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(right: 15, left: 10),
                          child: Row(
                            children: [
                              Container(
                                height: 130,
                                width: 240,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    image: DecorationImage(
                                        image: AssetImage(
                                            'assets/wedding_car_img.png'))),
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(right: 10),
                          child: Row(
                            children: [
                              Container(
                                height: 130,
                                width: 240,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    image: DecorationImage(
                                        image: AssetImage(
                                            'assets/boats_img.png'))),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  )
                ],
              )),
          Container(
            height: 350,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                    padding: EdgeInsets.only(left: 10, right: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Recently viewed',
                          style: TextStyle(
                              fontSize: 22, fontWeight: FontWeight.bold),
                          textAlign: TextAlign.start,
                        ),
                        Text(
                          'See All',
                          style: TextStyle(color: Colors.blue, fontSize: 16),
                        )
                      ],
                    )),
                Padding(
                  padding: EdgeInsets.only(left: 10, right: 10),
                  child: Text(
                    'We show you latest search results',
                    style: TextStyle(color: Colors.grey, fontSize: 16),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 5, right: 5),
                  child: Container(
                    height: 280,
                    // decoration: BoxDecoration(color: Colors.blue),
                    child: GridView.builder(
                        shrinkWrap: true,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 5,
                            mainAxisSpacing: 5,
                            childAspectRatio: 0.73),
                        itemCount: carItems.length,
                        itemBuilder: (context, index) {
                          final car = carItems[index];
                          return CarItemCard(car: car);
                        }),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

class CarItemCard extends StatelessWidget {
  final Data car;

  const CarItemCard({super.key, required this.car});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      color: Colors.white,
      child: Column(
        children: [
          Container(
            width: 190,
            height: 260,
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 200,
                      height: 120,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10),
                            topRight: Radius.circular(10),
                          ),
                          image: DecorationImage(
                              image: AssetImage(car.carImg),
                              fit: BoxFit.cover)),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 30, left: 5),
                      child: Text(
                        car.carName,
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 5),
                      child: Text(
                        'Tel-Aviv, israel',
                        style: TextStyle(fontSize: 14, color: Colors.grey),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 5, right: 5, top: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                              height: 40,
                              width: 120,
                              child: Row(
                                children: [
                                  Container(
                                    width: 35,
                                    height: 35,
                                    child: Image.asset('assets/bookmark.png'),
                                  ),
                                  Container(
                                    width: 40,
                                    height: 40,
                                    child: Icon(Icons.timeline),
                                  ),
                                ],
                              )),
                          Container(
                            width: 40,
                            height: 40,
                            child: Icon(Icons.more_horiz),
                          )
                        ],
                      ),
                    )
                  ],
                ),
                Positioned(
                    top: 98,
                    child: Padding(
                      padding: EdgeInsets.only(left: 5, right: 5),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: 40,
                            height: 40,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                            ),
                            child: CircleAvatar(
                              backgroundImage: AssetImage(car.userImg),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 60),
                            child: Container(
                                width: 80,
                                height: 40,
                                decoration: BoxDecoration(
                                    color: Colors.blue,
                                    borderRadius: BorderRadius.circular(10)),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      '\$200/day',
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 16),
                                      textAlign: TextAlign.center,
                                    ),
                                  ],
                                )),
                          )
                        ],
                      ),
                    ))
              ],
            ),
          )
        ],
      ),
    );
  }
}

class CarCard extends StatelessWidget {
  final CarData car;

  const CarCard({super.key, required this.car});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(top: 10, left: 10, right: 10),
            child: Row(
              children: [
                Text(
                  car.name,
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
                Container(
                  margin: EdgeInsets.only(left: 80),
                  height: 40,
                  width: 70,
                  decoration: BoxDecoration(
                      color: const Color(0xfff5eecf),
                      borderRadius: BorderRadius.circular(10)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Icon(Icons.star, color: Color(0xFFF6DA3C)),
                      Text(
                        car.rating.toString(),
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
              car.description,
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 10, top: 5),
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
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  Container(
                    width: 20,
                    height: 20,
                    child: Image.asset('assets/gate_icon.png'),
                  ),
                  const Text(
                    '4',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  Container(
                    width: 20,
                    height: 20,
                    child: Image.asset('assets/bag_icon.png'),
                  ),
                  const Text(
                    '3',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 10, right: 10, top: 10),
            child: Container(
              height: 140,
              width: 300,
              child: Image.asset(car.imagePath),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 10, right: 10, top: 10),
            child: Row(
              children: [
                Container(
                  width: 130,
                  height: 40,
                  child: Row(
                    children: [
                      Text(
                        "\$${car.pricePerDay.toStringAsFixed(0)}",
                        style: TextStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                            color: Colors.blue),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 5),
                        child: Text(
                          'per day',
                          style: TextStyle(fontSize: 12, color: Colors.blue),
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 65),
                  child: Container(
                    width: 115,
                    height: 40,
                    decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(10)),
                    child: ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.blue),
                          shape: WidgetStateProperty.all(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ))),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => BookingPage(car: car)));
                      },
                      child: const Text(
                        'Book Now',
                        style: TextStyle(color: Colors.white),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
