import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:icook_mobile/models/response/Dish/getmydishes.dart';
import 'package:icook_mobile/ui/favorite_screen/favorite_model.dart';

import 'package:icook_mobile/ui/shared/recipe_item.dart';
import 'package:icook_mobile/ui/shared/state_responsive.dart';
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
            dataFetchedWidget: ListView.builder(
              itemCount: model.dishList.length,
              itemBuilder: (context, index) => RecipeItem(
                dish: model.dishList[index]
              ),
            ),
          )),
    );
  }
}
