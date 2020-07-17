import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:icook_mobile/core/constants/view_routes.dart';
import 'package:icook_mobile/models/response/Dish/dishitem.dart';
import 'package:icook_mobile/models/response/Search/searchdish.dart';
import 'package:icook_mobile/models/response/Users/getauser.dart';
import 'package:icook_mobile/ui/home_page/home_page.dart';
import 'package:icook_mobile/ui/search_screen/searchmodel.dart';
import 'package:icook_mobile/ui/shared/state_responsive.dart';
import 'package:stacked/stacked.dart';
import 'package:timeago/timeago.dart' as timeago;

class SearchView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
 

    final _formKey = GlobalKey<FormState>();
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
              child: GestureDetector(
                onTap: () {
                  showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          content: Stack(
                            overflow: Overflow.visible,
                            children: <Widget>[
                              Positioned(
                                right: -40.0,
                                top: -40.0,
                                child: InkResponse(
                                  onTap: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: CircleAvatar(
                                    child: Icon(Icons.close),
                                    backgroundColor: Colors.red,
                                  ),
                                ),
                              ),
                              Form(
                                key: _formKey,
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: <Widget>[
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: RaisedButton(
                                        child: Text("Search By Users"),
                                        onPressed: () {
                                          Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SearchViewU()));
                                        },
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: RaisedButton(
                                        child: Text("Search By Dishes"),
                                        onPressed: () {
                                          Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SearchView()));
                                        },
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        );
                      });
                },
                child: Image.asset(
                  "assets/images/filter.png",
                  height: 18,
                  width: 20,
                ),
              ),
            )
          ],
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Container(
              constraints: BoxConstraints(maxWidth: 600),
              child: Column(
                children: <Widget>[
                 _searchBar(model),
                  SizedBox(
                    height: 20,
                  ),
                  StateResponsive(
                      state: model.state,
                      noDataAvailableWidget: Center(
                        child: Text('Enter to search'),
                      ),
                      busyWidget: Center(
                        child: CircularProgressIndicator(),
                      ),
                      idleWidget: ListView.builder(
                        itemCount: model.list.length,
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) =>
                            SearchResult(recipe: model.list[index]),
                      ))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void setState(bool Function() param0) {}
}

class SearchViewU extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
 

    final _formKey = GlobalKey<FormState>();
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
              child: GestureDetector(
                onTap: () {
                  showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          content: Stack(
                            overflow: Overflow.visible,
                            children: <Widget>[
                              Positioned(
                                right: -40.0,
                                top: -40.0,
                                child: InkResponse(
                                  onTap: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: CircleAvatar(
                                    child: Icon(Icons.close),
                                    backgroundColor: Colors.red,
                                  ),
                                ),
                              ),
                              Form(
                                key: _formKey,
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: <Widget>[
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: RaisedButton(
                                        child: Text("Search By Users"),
                                        onPressed: () {
                                          Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SearchViewU()));
                                        },
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: RaisedButton(
                                        child: Text("Search By Dishes"),
                                        onPressed: () {
                                          Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SearchView()));
                                        },
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        );
                      });
                },
                child: Image.asset(
                  "assets/images/filter.png",
                  height: 18,
                  width: 20,
                ),
              ),
            )
          ],
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Container(
              constraints: BoxConstraints(maxWidth: 600),
              child: Column(
                children: <Widget>[
                 _searchBarU(model),
                  SizedBox(
                    height: 20,
                  ),
                  StateResponsive(
                      state: model.state,
                      noDataAvailableWidget: Center(
                        child: Text('Enter to search'),
                      ),
                      busyWidget: Center(
                        child: CircularProgressIndicator(),
                      ),
                      idleWidget: ListView.builder(
                        itemCount: model.user.length,
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) =>
                            SearchResultUser(user: model.user[index]),
                      ))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void setState(bool Function() param0) {}
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
                prefixIcon: Icon(
                  Icons.search,
                  color: Colors.black,
                ),
                hintText: 'Search by Dishes',
              ),
            ),
          ),
        )
      ],
    ),
  );
}


Widget _searchBarU(SearchModel model) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 30),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Container(
          child: Expanded(
            child: TextField(
              onChanged: (v) => model.loadUserData(v),
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
                prefixIcon: Icon(
                  Icons.search,
                  color: Colors.black,
                ),
                hintText: 'Search by Users',
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

class SearchResultUser extends StatelessWidget {
  final User user;

  const SearchResultUser({Key key, this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    DateTime time = DateTime.parse(user.createdAt);
    var date = timeago.format(time);

    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, ViewRoutes.userprofile, arguments: user);
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 10, left: 20, right: 20),
        width: 335,
        height: 128,
//      margin: EdgeInsets.only(bottom: 10.0),
        child: Row(
          children: <Widget>[
            Container(
              width: 150,
              height: 100,
              margin: EdgeInsets.symmetric(vertical: 17),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10.0),
                child: user.userImage.isEmpty
                    ? AssetImage('assets/images/icook_logo.png')
                    : Image(
                        fit: BoxFit.cover,
                        image:
                            CachedNetworkImageProvider(user.userImage))
                    ,
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
                      user.name,
                      overflow: TextOverflow.clip,
                      style: TextStyle(
                          fontSize: 18,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w600,
                          fontStyle: FontStyle.normal),
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(0, 5, 0, 10),
                      child: Text(
                        user.gender[0],
                        maxLines: 4,
                        softWrap: true,
                        overflow: TextOverflow.clip,
                      ),
                    ),
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            date,
                            style: TextStyle(
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
      ),
    );
  }
}

class SearchResult extends StatelessWidget {
  final Dish recipe;

  const SearchResult({Key key, this.recipe}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    DateTime time = DateTime.parse(recipe.createdAt);
    var date = timeago.format(time);

    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, ViewRoutes.recipe_details,
            arguments: recipe);
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 10, left: 20, right: 20),
        width: 335,
        height: 128,
//      margin: EdgeInsets.only(bottom: 10.0),
        child: Row(
          children: <Widget>[
            Container(
              width: 150,
              height: 100,
              margin: EdgeInsets.symmetric(vertical: 17),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10.0),
                child: recipe.dishImages.isEmpty
                    ? AssetImage('assets/images/icook_logo.png')
                    : Image(
                        fit: BoxFit.cover,
                        image:
                            CachedNetworkImageProvider(recipe.dishImages[0])),
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
                          fontSize: 18,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w600,
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
                                    onTap: () {},
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
