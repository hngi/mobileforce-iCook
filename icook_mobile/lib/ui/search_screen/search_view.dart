import 'package:flutter/material.dart';

class SearchView extends StatefulWidget {
  @override
  _SearchViewState createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    return Scaffold(
        backgroundColor: Colors.white,
//        bottomNavigationBar: BottomNavigationBar(items: [
//          BottomNavigationBarItem(icon: Icon(Icons.home),title: Text("Home")),
//          BottomNavigationBarItem(icon: Icon(Icons.home),title: Text("Home")),
//          BottomNavigationBarItem(icon: Icon(Icons.home),title: Text("Home")),
//        ]),
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(mediaQuery.size.height*0.07),
          child: AppBar(

            centerTitle: true,
            title: Text(
              "Search",
              style: TextStyle(
                fontSize: 24,
              ),
            ),
            actions: <Widget>[
              FlatButton.icon(onPressed: (){}, icon: Icon(Icons.more_horiz), label: Text(""),)
            ],
          ),
        ),

        body: SafeArea(
            child: Padding(

          padding: const EdgeInsets.fromLTRB(8, 8, 8, 8),
          child: Container(
            height: mediaQuery.size.height * 0.92,
            child: Column(
              children: <Widget>[
                ListView(
                  shrinkWrap: true,
                  children: <Widget>[
                    _searchBar(mediaQuery),
                    _recentSearch(),
                    _serachResult(mediaQuery)
                  ],
                ),
              ],
            ),
          ),
        )));
  }
}

Widget _searchBar(mediaQuery) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 0.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Container(
          width: (mediaQuery.size.width - 48),
          child: Center(
            child: TextField(
              textAlign: TextAlign.left,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.search),
                hintText: 'Search',
                hintStyle: TextStyle(fontSize: 16),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide(
                    width: 1,
                    color: Colors.grey[100],
                    style: BorderStyle.none,
                  ),
                ),
                filled: true,
                contentPadding: EdgeInsets.all(16),
                fillColor: Colors.white,
              ),
            ),
          ),
        )
      ],
    ),
  );
}

Widget _recentSearch() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      Text(
        "Recently searched dishes",
      ),
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 0),
        child: Container(
          height: 115.0,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: <Widget>[
              _recentContainer(),
              _recentContainer(),
              _recentContainer(),
              _recentContainer(),
              _recentContainer(),
              _recentContainer(),
              _recentContainer(),
            ],
          ),
        ),
      )
    ],
  );
}

Container _recentContainer() {
  return Container(
    margin: EdgeInsets.symmetric(vertical: 0, horizontal: 6.0),
    decoration: BoxDecoration(borderRadius: BorderRadius.circular(10.0)),
    width: 98,
    child: Column(
      children: <Widget>[
        Image.asset(
          'assets/images/amala.jpeg',
          fit: BoxFit.fill,
          width: 98,
          height: 88,
        ),
        Padding(
          padding: const EdgeInsets.all(4.0),
          child: Text(
            "Amala and X Soup",
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontSize: 14,
            ),
          ),
        )
      ],
    ),
  );
}

Container _serachResult(mediaQuery) {
  return Container(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 0.0),
          child: Text(
            "Related Search Result",
            style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 18,
                fontWeight: FontWeight.bold),
          ),
        ),
        Container(
          height: 320,
          child: ListView(
            children: <Widget>[
              ResultList(recipe: r),
              ResultList(recipe: r),
              ResultList(recipe: r),
              ResultList(recipe: r),
              ResultList(recipe: r)
            ],
          ),
        )
      ],
    ),
  );
}

class ResultList extends StatefulWidget {
  Recipe recipe;
//  ResultList({this.recipe});
  ResultList({Key key, @required this.recipe}) : super(key: key);
  @override
  _ResultListState createState() => _ResultListState(recipe);
}

class _ResultListState extends State<ResultList> {
  Recipe recipe;
  _ResultListState(this.recipe) {
    this.recipe = recipe;
  }

  static bool likes = true;

  @override
  Widget build(BuildContext context) {
    initState() {
      likes = recipe.likes;
    }

    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Row(
        children: <Widget>[
          Expanded(
            flex: 3,
            child: Container(
              width: 117,
              height: 115,
              child: Image.asset(recipe.recipe_image, fit: BoxFit.fill),
            ),
          ),
          Expanded(
            flex: 7,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Text(
                    recipe.recipe_name,
                    overflow: TextOverflow.clip,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                    textAlign: TextAlign.justify,
                  ),
                  SizedBox(
                    height: 7.0,
                  ),
                  Text(
                    recipe.description.toString(),
                    maxLines: 5,
                    softWrap: true,
                    overflow: TextOverflow.fade,
                    textAlign: TextAlign.left,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Container(
                        child: Row(
                          children: <Widget>[
                            InkWell(
                                onTap: () {
//                              TODO: Change like state true/false
                                  this.setState(() {
                                    likes = !likes;
                                  });
                                },
                                child: likes
                                    ? Icon(
                                        Icons.favorite,
                                        size: 18,
                                        color: Colors.red,
                                      )
                                    : Icon(
                                        Icons.favorite,
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

//
//Row _resultList(
//        recipe_name, recipe_image, description, likes, like_count, days) =>
//

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
    true,
    120,
    12);
