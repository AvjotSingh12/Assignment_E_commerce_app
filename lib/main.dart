import 'package:assignment_e_commerce_app/screens/product_detail.dart';
import 'package:assignment_e_commerce_app/screens/product_list.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const product_list(),
      routes: {
        '/1': (context) => const product_list(),
      },
    );
  }
}
