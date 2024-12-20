import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:min_shop_app/pages/pages.dart';

void main() {
  // 应用程序入口
  runApp(const MyApp());
  // 设置系统 UI 模式为全屏
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge, overlays: []);
  // 设置系统状态栏的样式，这里状态栏背景颜色为蓝色
  SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(statusBarColor: Colors.blue[400]));
}

// 应用主组件，继承自 StatefulWidget，支持动态状态更新
class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

// 应用状态类
class _MyAppState extends State<MyApp> {
  // 定义路由表，用于页面导航
  final Map<String, Widget> routes = {
    "/": const LoginPage(), // 主页面映射到 LoginPage 组件
    "/tabs": const Tabs()
  };

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.blue),
      // 禁用右上角的调试标志
      debugShowCheckedModeBanner: false,
      // 自定义页面路由生成函数
      onGenerateRoute: (setting) {
        // 根据路由名称在路由表中查找对应页面
        final Widget? page = routes[setting.name];
        if (page != null) {
          // 如果找到页面，则返回一个带有淡入淡出动画的 PageRouteBuilder
          return PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) => page,
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              // 定义路由切换时的淡入淡出动画
              return FadeTransition(opacity: animation, child: child);
            },
          );
        }
        // 如果路由未定义，返回一个 404 页面
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  appBar: AppBar(title: const Text('page Not Found')), // 页面顶部标题
                  body: const Center(
                    child: Text('404: Page Not Found'), // 中间显示 404 提示
                  ),
                ));
      },
    );
  }
}
