import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
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
          key: model.scaffoldKey,
          appBar: AppBar(
            title: Text("Favorites"),
          ),
          body: EasyRefresh(
            enableControlFinishRefresh: true,
            controller: model.easycontroller,
            onRefresh: () => model.loadData(),
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  StateResponsive(
                    state: model.state,
                    noDataAvailableWidget: Center(
                      child: Text('No Posts'),
                    ),
                    busyWidget: ListView.builder(
                        shrinkWrap: true,
                        itemCount: 6,
                        physics: NeverScrollableScrollPhysics(),
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
                  ),
                ],
              ),
            ),
          )),
    );
  }
}
