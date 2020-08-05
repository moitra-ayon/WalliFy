import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:walify/models/wallpaper_model.dart';
import 'package:walify/views/wallpaper_view.dart';
import 'package:google_fonts/google_fonts.dart';

Widget brandName() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: <Widget>[
      Text(
        'Walli',
        style: GoogleFonts.chilanka(
          color: Color(0xffFF9933),
          fontWeight: FontWeight.w900,
          fontSize: 20.0,
        ),
      ),
      SizedBox(
        width: 1.5,
      ),
      Text(
        'Fy',
        style: GoogleFonts.indieFlower(
          color: Color(0xff138808),
          fontWeight: FontWeight.w900,
          fontSize: 24.0,
        ),
      ),
    ],
  );
}

Widget creatorName() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: <Widget>[
      Text(
        'Made',
        style: GoogleFonts.chilanka(
          color: Color(0xffFF9933),
          fontWeight: FontWeight.w900,
          fontSize: 16.0,
        ),
      ),
      SizedBox(
        width: 2.5,
      ),
      Text(
        'By',
        style: GoogleFonts.indieFlower(
          color: Color(0xff138808),
          fontWeight: FontWeight.w900,
          fontSize: 16.0,
        ),
      ),
      SizedBox(
        width: 6.5,
      ),
      Text(
        'Ayon',
        style: GoogleFonts.indieFlower(
          color: Color(0xff138808),
          fontWeight: FontWeight.w900,
          fontSize: 16.0,
        ),
      ),
    ],
  );
}

List<WallpaperModel> wallpapers = new List();

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
          child: GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => WallpaperView(
                    imageUrl: e.src.portrait,
                  ),
                ),
              );
            },
            child: Hero(
              tag: e.src.portrait,
              child: Container(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Image.network(
                    e.src.portrait,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),
        );
      }).toList(),
    ),
  );
}
