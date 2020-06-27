import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:icook_mobile/ui/home_page/home_page_model.dart';
import 'package:icook_mobile/ui/shared/recipe_item.dart';
import 'package:icook_mobile/ui/ui_helper.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  ScrollController controller = ScrollController();

  Widget _searchBar() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Container(
            child: Expanded(
              child: TextField(
                enabled: false,
                textAlign: TextAlign.left,
                style: TextStyle(
                    color: Color(0xFF333333),
                    fontSize: 16,
                    fontFamily: "Poppins",
                    fontWeight: FontWeight.normal,
                    fontStyle: FontStyle.normal),
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.search),
                  hintText: 'Search',
                  hintStyle: TextStyle(fontSize: 16),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide(
                      width: 1,
                      color: Color(0xFFEFEFEF),
                      style: BorderStyle.solid,
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          controller: controller,
          child: Column(
            children: <Widget>[
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListTile(
                  leading: Container(
                      width: 60,
                      height: 90,
                      decoration: new BoxDecoration(
                          shape: BoxShape.circle,
                          image: new DecorationImage(
                              fit: BoxFit.cover,
                              image:
                                  new AssetImage('assets/images/avatar.png')))),
                  title: Text(
                    'Hi Chef Emmanuel',
                    style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                            color: Constants.kbuttonColor1, fontSize: 18),
                        fontWeight: FontWeight.w600),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Provider.of<HomePageModel>(context, listen: false)
                      .changeTab(1);
                  print('hiiff');
                },
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(24)),
                  child: Row(children: <Widget>[
                    Icon(Icons.search),
                    SizedBox(width: 10),
                    Text('Search', style: GoogleFonts.poppins())
                  ]),
                ),
              ),
              ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
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
            ],
          ),
        ),
      ),
    );
  }
}
