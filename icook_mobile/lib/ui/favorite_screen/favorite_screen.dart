import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:icook_mobile/ui/favorite_screen/favorite_model.dart';

import 'package:icook_mobile/ui/shared/recipe_item.dart';
import 'package:icook_mobile/ui/shared/recipe_item_shim.dart';
import 'package:icook_mobile/ui/shared/state_responsive.dart';
import 'package:shimmer/shimmer.dart';
import 'package:stacked/stacked.dart';

class FavoriteScreen extends StatefulWidget {
  @override
  _FavoriteScreenState createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<FavoriteScreenModel>.reactive(
      viewModelBuilder: () => FavoriteScreenModel(),
      onModelReady: (model) => model.init(),
      builder: (context, model, child) => Scaffold(
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
          body: StateResponsive(
            state: model.state,
            noDataAvailableWidget: Center(
              child: Text('No Posts'),
            ),
            busyWidget: ListView.builder(
                shrinkWrap: true,
                itemCount: 6,
                itemBuilder: (context, index) => Shimmer.fromColors(
                      direction: ShimmerDirection.ltr,
                      period: Duration(seconds: 2),
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
                    )),
            idleWidget: Center(
              child: Text("No post"),
            ),
            dataFetchedWidget: ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: model.dishList.length,
              itemBuilder: (context, index) =>
                  RecipeItem(dish: model.dishList[index]),
            ),
          )),
    );
  }
}
