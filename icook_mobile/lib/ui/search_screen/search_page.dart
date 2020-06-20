import 'package:flutter/material.dart';

class SearchView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          'Search',
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
        child: ListView(
          children: <Widget>[_searchBar(), _recentSearch(), _relatedSerach()],
        ),
      ),
    );
  }
}

// Search bar
Widget _searchBar() {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 0.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Container(
          child: Expanded(
            child: TextField(
              textAlign: TextAlign.left,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.search),
                hintText: 'Search',
                hintStyle: TextStyle(fontSize: 16),
                disabledBorder: InputBorder.none,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide(
                    width: 1,
                    color: Colors.white30,
                    style: BorderStyle.none,
                  ),
                ),
                filled: true,
                contentPadding: EdgeInsets.all(7),
                fillColor: Colors.white,
              ),
            ),
          ),
        )
      ],
    ),
  );
}

// BottomNavigationBarItem builder
BottomNavigationBarItem _bottomNavigationBarItem(
        IconData icon, String label, Color color) =>
    BottomNavigationBarItem(
        icon: Icon(
          icon,
          color: color,
        ),
        title: Text(label));

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
                _recentdish('assets/images/amala.jpeg', 'Fried Rice'),
                _recentdish('assets/images/Efo riro.jpeg', 'Okro Soup'),
                _recentdish('assets/images/fried rice.jpeg', 'Peanut butter'),
                _recentdish('assets/images/fufu.jpeg', 'Fufu'),
                _recentdish('assets/images/amala.jpeg', 'Fried Rice'),
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
          ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: Image.asset(
              image,
              height: 88,
              width: 98,
              fit: BoxFit.fill,
            ),
          ),
          Container(
            width: 67,
            height: 17,
            margin: EdgeInsets.only(top: 4),
            child: Text(
              dish,
              overflow: TextOverflow.clip,
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 14,
                  letterSpacing: 0.01,
                  fontFamily: "Montserrat",
                  fontStyle: FontStyle.normal,
                  fontWeight: FontWeight.normal),
            ),
          )
        ],
      ),
    );

Container _relatedSerach() => Container(
      margin: EdgeInsets.only(top: 7),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            "Related Search Result",
            style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 18,
                fontWeight: FontWeight.w600),
          ),
          SearchResult(
            recipe: r,
          ),
          SearchResult(
            recipe: r2,
          ),
          SearchResult(
            recipe: r3,
          ),
          SearchResult(
            recipe: r2,
          ),
          SearchResult(
            recipe: r3,
          ),
        ],
      ),
    );

class SearchResult extends StatefulWidget {
  Recipe recipe;
  SearchResult({Key key, @required this.recipe}) : super(key: key);
  @override
  _SearchResultState createState() => _SearchResultState(recipe);
}

class _SearchResultState extends State<SearchResult> {
  Recipe recipe;
  _SearchResultState(this.recipe) {
    this.recipe = recipe;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10.0),
      child: Row(
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.circular(10.0),
            child: Image.asset(
              recipe.recipe_image,
              width: 117,
              height: 90,
              fit: BoxFit.fill,
            ),
          ),
          Expanded(
            child: Container(
              height: 118,
              margin: EdgeInsets.only(left: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Text(
                    recipe.recipe_name,
                    overflow: TextOverflow.clip,
                    style: TextStyle(
                        fontSize: 18,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w500,
                        fontStyle: FontStyle.normal),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 3.0),
                    child: Text(
                      recipe.description,
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
//                              TODO: Change like state true/false
                                    this.setState(() {});
                                  },
                                  child: recipe.likes
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
                                width: 3,
                              ),
                              Text(recipe.like_count.toString())
                            ],
                          ),
                        ),
                        Text("${recipe.days} days ago")
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
    "assets/images/amala.jpeg",
    "You may be a person who loves to cook efo riro, here is a video that will help you in accomplishing that",
    false,
    120,
    12);
Recipe r2 = new Recipe(
    "Efo riro delicacy",
    "assets/images/fufu.jpeg",
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
