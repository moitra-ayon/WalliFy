import 'package:flutter/material.dart';
import 'package:walify/views/home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Walify - Wallpapers Den',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Color(0xffFEFEFE),
      ),
      home: HomeScreen(),
    );
  }
}
