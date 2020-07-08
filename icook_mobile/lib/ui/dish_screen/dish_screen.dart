import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:icook_mobile/models/response/Dish/dishitem.dart';
import 'package:icook_mobile/models/response/Dish/dishresponse.dart';
import 'package:icook_mobile/ui/shared/recipe_item.dart';
import 'package:icook_mobile/ui/shared/recipe_item_shim.dart';
import 'package:shimmer/shimmer.dart';
import 'dart:async';

import '../shared/recipe_item.dart';

class MyDishScreen extends StatefulWidget {
  MyDishScreen({Key key}) : super(key: key);
  @override
  _MyDishScreenState createState() => _MyDishScreenState();
}

class _MyDishScreenState extends State<MyDishScreen> {
  @override
  void initState() {
    super.initState();
  }

  Future<List<int>> _getResults() async {
    await Future.delayed(Duration(seconds: 3));
    return List<int>.generate(6, (index) => index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('My Dishes'),
            // centerTitle: true,

            actions: <Widget>[
              IconButton(
                icon: new Image.asset(
                  'assets/images/filter.png',
                  height: 24,
                  width: 24,
                ),
                onPressed: () {
                  // do something
                },
              ),
            ]),
        body: FutureBuilder<List<int>>(
          // perform the future delay to simulate request
          future: _getResults(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return ListView.builder(
                  shrinkWrap: true,
                  itemCount: 6,
                  itemBuilder: (context, index) => Shimmer.fromColors(
                        direction: ShimmerDirection.rtl,
                        period: Duration(seconds: 6),
                        baseColor: Colors.grey[400],
                        highlightColor: Colors.white,
                        child: RecipeItemShim(
                          chefImage: "assets/images/avatar.png",
                          chefName: "",
                          foodName: "",
                          foodDescription: "",
                          likes: 0,
                          foodImage: [
                            "assets/images/amala.jpeg",
                            "assets/images/recipes.png",
                            "assets/images/amala.jpeg"
                          ],
                        ),
                      ));
            }
            return ListView.builder(
              itemCount: 6,
              itemBuilder: (context, index) => RecipeItem(
                dish: Dish(
                    name: 'Garri',
                    likesCount: 76,
                    isLiked: false,
                    recipe: ['cook and boil', 'bless the meal'],
                    dishImages: ['assets/images/amala.jpeg'],
                    ingredients: ['1 spoon of garri', '2 basins of sugar'],
                    healthBenefits: ['Good for Athrirtis']),
              ),
            );
          },
        ));
  }
}
