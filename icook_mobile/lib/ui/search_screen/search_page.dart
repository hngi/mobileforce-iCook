import 'package:flutter/material.dart';
import 'package:icook_mobile/models/response/Dish/dishitem.dart';
import 'package:icook_mobile/models/response/Search/searchdish.dart';
import 'package:icook_mobile/ui/search_screen/searchmodel.dart';
import 'package:icook_mobile/ui/shared/state_responsive.dart';
import 'package:stacked/stacked.dart';
import 'package:timeago/timeago.dart' as timeago;

class SearchView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SearchModel>.reactive(
      viewModelBuilder: () => SearchModel(),
      builder: (context, model, child) => Scaffold(
        appBar: AppBar(
          title: Text(
            'Search',
            style: TextStyle(
                fontFamily: "Poppins",
                fontWeight: FontWeight.w500,
                fontSize: 24),
          ),
          actions: <Widget>[
            Padding(
              padding: const EdgeInsets.only(right: 12),
              child: Image.asset(
                "assets/images/filter.png",
                height: 18,
                width: 20,
              ),
            )
          ],
        ),
        body: Container(
          margin: EdgeInsets.symmetric(horizontal: 20),
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                _searchBar(model),
                _recentSearch(),
                StateResponsive(
                    state: model.state,
                    noDataAvailableWidget: Center(
                      child: Text('No Posts'),
                    ),
                    busyWidget: Center(
                      child: CircularProgressIndicator(),
                    ),
                    idleWidget: ListView.builder(
                      itemCount: model.list.length,
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) =>
                          SearchResult(recipe: model.list[0]),
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget _searchBar(SearchModel model) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 30),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Container(
          child: Expanded(
            child: TextField(
              onChanged: (v) => model.loadData(v),
              textAlign: TextAlign.left,
              style: TextStyle(
                  color: Color(0xFF333333),
                  fontSize: 16,
                  fontFamily: "Poppins",
                  fontWeight: FontWeight.normal,
                  fontStyle: FontStyle.normal),
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 0),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(30)),
                  borderSide: BorderSide(color: Color(0xFF578DDE)),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(30)),
                  borderSide: BorderSide(color: Color(0xFFF4F4F4)),
                ),
                prefixIcon: Icon(Icons.search),
                hintText: 'Search',
              ),
            ),
          ),
        )
      ],
    ),
  );
}

Widget _recentSearch() => Container(
      margin: EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(bottom: 10),
            child: Text(
              "Recently searched dishes",
              style: TextStyle(
                  fontStyle: FontStyle.normal,
                  fontFamily: 'Poppins',
                  fontSize: 16),
            ),
          ),
          Container(
            height: 113.0,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: <Widget>[
                _recentdish('assets/images/1.png', 'Fried Rice'),
                _recentdish('assets/images/2.png', 'Okro Soup'),
                _recentdish('assets/images/4.png', 'Peanut butter'),
                _recentdish('assets/images/3.png', 'Fufu'),
                _recentdish('assets/images/1.png', 'Fried Rice'),
              ],
            ),
          )
        ],
      ),
    );

Container _recentdish(String image, String dish) => Container(
      margin: EdgeInsets.only(right: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Container(
            height: 88,
            width: 98,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Image.asset(
                image,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 8),
            child: Text(
              dish,
              overflow: TextOverflow.clip,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color(0xFF333333),
                fontSize: 14,
                fontFamily: "Montserrat",
                fontStyle: FontStyle.normal,
                fontWeight: FontWeight.normal,
              ),
            ),
          )
        ],
      ),
    );

class SearchResult extends StatelessWidget {
  final Dish recipe;

  const SearchResult({Key key, this.recipe}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    DateTime time = DateTime.parse(recipe.createdAt);
    var date = timeago.format(time);

    return Container(
      margin: EdgeInsets.only(bottom: 10),
      width: 335,
      height: 128,
//      margin: EdgeInsets.only(bottom: 10.0),
      child: Row(
        children: <Widget>[
          Container(
            margin: EdgeInsets.symmetric(vertical: 17),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10.0),
              child: Image.asset(
                recipe.dishImages[0] ?? 'assets/images/icook_logo.png',
                width: 117,
                height: 115,
                fit: BoxFit.fill,
              ),
            ),
          ),
          Expanded(
            child: Container(
              margin: EdgeInsets.only(left: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Text(
                    recipe.name,
                    overflow: TextOverflow.clip,
                    style: TextStyle(
                        color: Color(0xFF333333),
                        fontSize: 18,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w400,
                        fontStyle: FontStyle.normal),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(0, 5, 0, 10),
                    child: Text(
                      recipe.healthBenefits[0],
                      maxLines: 4,
                      softWrap: true,
                      overflow: TextOverflow.clip,
                    ),
                  ),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Container(
                          child: Row(
                            children: <Widget>[
                              InkWell(
                                  onTap: () {
//
                                  },
                                  child: recipe.likesCount > 0
                                      ? Icon(
                                          Icons.favorite,
                                          size: 18,
                                          color: Colors.red,
                                        )
                                      : Icon(
                                          Icons.favorite_border,
                                          size: 18,
                                        )),
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                recipe.likesCount.toString(),
                                style: TextStyle(
                                    color: Color(0xFF333333),
                                    fontSize: 12,
                                    fontFamily: "Poppings",
                                    fontStyle: FontStyle.normal,
                                    fontWeight: FontWeight.w500),
                              )
                            ],
                          ),
                        ),
                        Text(
                          date,
                          style: TextStyle(
                              color: Color(0xFF828282),
                              fontSize: 12,
                              fontFamily: "Poppings",
                              fontStyle: FontStyle.normal,
                              fontWeight: FontWeight.w500),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class Recipe {
  String recipe_name;
  String recipe_image;
  String description;
  bool likes;
  int like_count;
  int days;

  Recipe(String recipe_name, String recipe_image, String description,
      bool likes, int like_count, int days) {
    this.recipe_name = recipe_name;
    this.recipe_image = recipe_image;
    this.likes = likes;
    this.description = description;
    this.like_count = like_count;
    this.days = days;
  }
}

Recipe r = new Recipe(
    "Efo riro delicacy",
    "assets/images/3.png",
    "You may be a person who loves to cook efo riro, here is a video that will help you in accomplishing that",
    false,
    120,
    12);
Recipe r2 = new Recipe(
    "Efo riro delicacy",
    "assets/images/recipes.png",
    "You may be a person who loves to cook efo riro, here is a video that will help you in accomplishing that",
    false,
    120,
    12);
Recipe r3 = new Recipe(
    "Efo riro delicacy",
    "assets/images/fried rice.jpeg",
    "You may be a person who loves to cook efo riro, here is a video that will help you in accomplishing that",
    false,
    120,
    12);
