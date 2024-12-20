import 'package:flutter/material.dart';
import 'package:min_shop_app/pages/tabs/home.dart';
import 'package:min_shop_app/pages/tabs/news.dart';
import 'package:min_shop_app/pages/tabs/user.dart';

class Tabs extends StatefulWidget {
  final int index;

  const Tabs({super.key, this.index = 0});

  @override
  State<Tabs> createState() => _TabsState();
}

class _TabsState extends State<Tabs> {
  late int _currentIndex = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _currentIndex = widget.index;
  }

  final List<Widget> _pages = const [
    HomePage(),
    NewsPage(),
    UserPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        title: const Text('MinFlutterApp'),
        backgroundColor: Colors.blue,
      ),
      body: _pages[_currentIndex],
      drawer: const Drawer(
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                    flex: 1,
                    child: UserAccountsDrawerHeader(
                      accountName: Text(
                        'Ming',
                        style: TextStyle(color: Colors.white),
                      ),
                      accountEmail: Text('Min@qq.com',
                          style: TextStyle(color: Colors.white)),
                      currentAccountPicture: CircleAvatar(
                        backgroundImage: AssetImage('assets/guidao7.jpeg'),
                      ),
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage('assets/guidao8.jpeg'))),
                    ))
              ],
            ),
            ListTile(
              title: Text('个人中心'),
              leading: CircleAvatar(
                child: Icon(Icons.people),
              ),
            ),
            Divider(),
            ListTile(
              title: Text("系统设置"),
              leading: CircleAvatar(
                child: Icon(Icons.settings),
              ),
            ),
            Divider()
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
          iconSize: 34,
          currentIndex: _currentIndex,
          type: BottomNavigationBarType.shifting,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          items: const [
            BottomNavigationBarItem(
              backgroundColor: Colors.blue,
              icon: Icon(Icons.home),
              label: "首页",
            ),
            BottomNavigationBarItem(
              backgroundColor: Colors.blue,
              icon: Icon(
                Icons.newspaper,
              ),
              label: "新闻",
            ),
            BottomNavigationBarItem(
              backgroundColor: Colors.blue,
              icon: Icon(Icons.shopping_cart),
              label: "购物车",
            )
          ]),
    );
  }
}
