import 'package:flutter/material.dart';

Widget brandName() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: <Widget>[
      Text(
        'Walli',
        style: TextStyle(
          color: Colors.black87,
        ),
      ),
      Text(
        'Fy',
        style: TextStyle(
          color: Colors.blue,
        ),
      ),
    ],
  );
}
