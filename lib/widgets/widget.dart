import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:walify/models/wallpaper_model.dart';

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

Widget wallpaperList({List<WallpaperModel> wallpapers, context}) {
  return Container(
    child: GridView.count(
      padding: EdgeInsets.symmetric(horizontal: 16.0),
      crossAxisCount: 2,
      shrinkWrap: true,
      physics: ClampingScrollPhysics(),
      childAspectRatio: 0.6,
      mainAxisSpacing: 6.0,
      crossAxisSpacing: 6.0,
      children: wallpapers.map((e) {
        return GridTile(
          child: Container(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.network(
                e.src.portrait,
                fit: BoxFit.cover,
              ),
            ),
          ),
        );
      }).toList(),
    ),
  );
}
