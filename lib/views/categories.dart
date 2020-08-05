import 'dart:convert';
import 'package:walify/models/categories_model.dart';
import 'package:flutter/material.dart';
import 'package:walify/data/data.dart';
import 'package:walify/models/wallpaper_model.dart';
import 'package:walify/widgets/widget.dart';
import 'package:http/http.dart' as http;
import 'home.dart';

class CategorieScreen extends StatefulWidget {
  final String categorieText;

  CategorieScreen({this.categorieText});

  @override
  _CategorieScreenState createState() => _CategorieScreenState();
}

class _CategorieScreenState extends State<CategorieScreen> {
  List<CategoriesModel> categories = new List();
  TextEditingController searchText = new TextEditingController();
  List<WallpaperModel> wallpapers = new List();

  getWallpapersByGenre(String genreText) async {
    var response = await http.get(
      "https://api.pexels.com/v1/search?query=$genreText&per_page=10",
      headers: {"Authorization": apiKey},
    );
//    print(response.body.toString());
    Map<String, dynamic> jsonData = jsonDecode(response.body);
    wallpapers = new List(); // for every new search
    jsonData["photos"].forEach((result) {
      WallpaperModel wallpaperModel = WallpaperModel();
      wallpaperModel = WallpaperModel.fromMap(result);
      wallpapers.add(wallpaperModel);
    });

    setState(() {});
  }

  @override
  void initState() {
    getWallpapersByGenre(widget.categorieText);
    searchText.text = widget.categorieText;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: brandName(),
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                  color: Color(0xfff5f8fd),
                  borderRadius: BorderRadius.circular(30),
                ),
                margin: EdgeInsets.symmetric(horizontal: 24.0),
                padding: EdgeInsets.symmetric(horizontal: 24.0),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: TextField(
                        controller: searchText,
                        decoration: InputDecoration(
                          hintText: "Search",
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        getWallpapersByGenre(searchText.text);
                      },
                      child: Container(
                        child: Icon(Icons.search),
                      ),
                    ),
                  ],
                ),
              ),
//              SizedBox(
//                height: 16.0,
//              ),
//              Container(
//                height: 80,
//                child: ListView.builder(
//                  padding: EdgeInsets.symmetric(horizontal: 24),
//                  shrinkWrap: true,
//                  scrollDirection: Axis.horizontal,
//                  itemCount: categories.length,
//                  itemBuilder: (context, index) {
//                    return CategoriesTile(
//                      title: categories[index].categoryName,
//                      imgURL: categories[index].imgUrl,
//                    );
//                  },
//                ),
//              ),
              SizedBox(
                height: 16.0,
              ),
              wallpaperList(wallpapers: wallpapers, context: context),
            ],
          ),
        ),
      ),
    );
  }
}
