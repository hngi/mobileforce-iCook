import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:icook_mobile/models/response/Dish/getmydishes.dart';

import 'package:icook_mobile/ui/shared/recipe_item.dart';

class FavoriteScreen extends StatefulWidget {
  @override
  _FavoriteScreenState createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Favorite"),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(
              left: 20,
              right: 20,
            ),
            child: InkWell(
              onTap: () {},
              child: Image(
                image: AssetImage("assets/images/search_fav.png"),
                width: 24,
                height: 24,
              ),
            ),
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: 6,
        itemBuilder: (context, index) => RecipeItem(
          dish: Dishe(
              name: 'Garri',
              likesCount: 76,
              isLiked: false,
              recipe: ['cook and boil', 'bless the meal'],
              dishImages: ['assets/images/amala.jpeg'],
              ingredients: ['1 spoon of garri', '2 basins of sugar'],
              healthBenefits: ['Good for Athrirtis']),
        ),
      ),
    );
  }
}
