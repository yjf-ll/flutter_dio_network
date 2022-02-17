import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_network/network/end_point.dart';
import 'package:flutter_network/network/network.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //  引用网络单例类里面的dio
  final Dio dio = Network.instance;

  Response? res;

  Future<void> send() async {
    final query = {
      'id': 186016,
      'limit': 1,
    };
    try {
      final result = await dio.get(
        EndPoint.comment,
        queryParameters: query,
      );
      print(result);
      setState(() {
        res = result;
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Network'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 300,
              child: ListView(
                children: [
                  Text(res?.data.toString() ?? 'empty'),
                ],
              ),
            ),
            FloatingActionButton(
              onPressed: send,
              child: Text('请求'),
            ),
            FloatingActionButton(
              onPressed: () => this.setState(() {
                res = null;
              }),
              child: Text('清除'),
            )
          ],
        ),
      ),
    );
  }
}
