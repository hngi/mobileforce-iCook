import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:icook_mobile/ui/shared/recipe_item.dart';
import 'package:stacked/stacked.dart';

class FavoriteScreen extends StatefulWidget {
  @override
  _FavoriteScreenState createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
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
          chefImage: "assets/images/avatar.png",
          chefName: "Rosa Nna",
          foodName: "Boiled Rice and Chicken",
          foodDescription:
              "This is just a very very dummy food description for texting",
          likes: 4,
          foodImage: [
            "assets/images/amala.jpeg",
            "assets/images/recipes.png",
            "assets/images/amala.jpeg"
          ],
        ),
      ),
    );
  }
}
