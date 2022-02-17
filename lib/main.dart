import 'package:flutter/material.dart';
import 'package:flutter_network/cache/cache.dart';
import 'package:flutter_network/network/network.dart';
import 'package:flutter_network/view/home_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //  初始化缓存单例类
  await AppCache.init();
  //  初始化网络单例类
  Network.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}