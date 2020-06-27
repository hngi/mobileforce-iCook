import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:icook_mobile/ui/edit_profile_screen/edit_profile.dart';
import 'package:icook_mobile/ui/profile_screen/constant.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:icook_mobile/ui/shared/recipe_item.dart';

class OtherUserInfoScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context,
        height: double.infinity, width: 375, allowFontScaling: true);

    return Scaffold(
      appBar: AppBar(
        title: Text("User Profile"),
      ),
      body: ListView(
        children: <Widget>[
          SizedBox(
            height: kSpacingUnit.w * 3,
          ),

          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Container(
              width: kSpacingUnit.w * 33.5,
              height: 99,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Container(
                    height: kSpacingUnit.w * 7.7,
                    width: kSpacingUnit.w * 7.7,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            image: AssetImage("assets/images/avatar.png"),
                            fit: BoxFit.cover)),
                  ),
                  SizedBox(
                    width: kSpacingUnit.w * 1.9,
                  ),
                  Flexible(
                    flex: 1,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          mainAxisSize: MainAxisSize.max,
                          children: <Widget>[
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                Text(
                                  "4.4k",
                                  style: GoogleFonts.poppins(
                                    fontStyle: FontStyle.normal,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14,
                                  ),
                                ),
                                Text(
                                  "Followers",
                                  style: GoogleFonts.poppins(
                                    fontStyle: FontStyle.normal,
                                    fontSize: 14,
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                Text(
                                  "13",
                                  style: GoogleFonts.poppins(
                                    fontStyle: FontStyle.normal,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14,
                                  ),
                                ),
                                Text(
                                  "Recipies",
                                  style: GoogleFonts.poppins(
                                    fontStyle: FontStyle.normal,
                                    fontSize: 14,
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                Text(
                                  "2.2k",
                                  style: GoogleFonts.poppins(
                                    fontStyle: FontStyle.normal,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14,
                                  ),
                                ),
                                Text(
                                  "Following",
                                  style: GoogleFonts.poppins(
                                    fontStyle: FontStyle.normal,
                                    fontSize: 14,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => EditProfile()));
                          },
                          child: Container(
                            width: kSpacingUnit.w * 19.1,
                            height: 37,
                            decoration: BoxDecoration(
                                color: Color(0xff578DDE),
                                borderRadius: BorderRadius.circular(7)),
                            child: Center(
                              child: Text(
                                "Follow",
                                style: GoogleFonts.poppins(
                                    fontSize: 16,
                                    fontStyle: FontStyle.normal,
                                    color: Color(0xffFFFFFF)),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),

          SizedBox(
            height: 26,
          ),

          //Chef name and bio

          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Text(
              "Chef Daisy",
              style: GoogleFonts.poppins(
                fontStyle: FontStyle.normal,
                fontWeight: FontWeight.w500,
                fontSize: 18,
              ),
            ),
          ),

          SizedBox(
            height: 8,
          ),

          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Text(
              "Bio:",
              style: GoogleFonts.poppins(
                fontStyle: FontStyle.normal,
                fontWeight: FontWeight.w500,
                fontSize: 18,
                color: Color(0xff578DDE),
              ),
            ),
          ),

          SizedBox(
            height: 5,
          ),

          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Text(
              "A good food is the language of kings.",
              style: GoogleFonts.poppins(
                fontStyle: FontStyle.normal,
                fontWeight: FontWeight.normal,
                fontSize: 16,
              ),
            ),
          ),

          SizedBox(
            height: 20,
          ),

          Center(
            child: Text(
              "My Dishes",
              style: GoogleFonts.poppins(
                fontStyle: FontStyle.normal,
                fontWeight: FontWeight.w600,
                fontSize: 18,
                color: Color(0xff578DDE),
              ),
            ),
          ),

          SizedBox(
            height: 12,
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

          SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }

  Widget _buildRecipeItems(
      {String image,
      String name,
      String description,
      int likes,
      bool liked,
      String daysAgo}) {
    return Padding(
      padding: EdgeInsets.fromLTRB(20, 0, 20, 20),
      child: InkWell(
        onTap: () {},
        child: Container(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                width: kSpacingUnit.w * 11.7,
                height: 115,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(7),
                    image: DecorationImage(
                      image: AssetImage(image),
                      fit: BoxFit.cover,
                    )),
              ),
              SizedBox(
                width: kSpacingUnit.w * 2,
              ),
              Flexible(
                flex: 1,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      name,
                      style: GoogleFonts.poppins(
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                          color: Color(0xff333333)),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      description,
                      style: GoogleFonts.poppins(
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.normal,
                          fontSize: 14,
                          color: Color(0xff333333)),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            liked
                                ? InkWell(
                                    onTap: () {},
                                    child: Image(
                                      image: AssetImage(
                                          "assets/images/like_icon.png"),
                                      width: 24,
                                      height: 24,
                                    ),
                                  )
                                : InkWell(
                                    onTap: () {},
                                    child: Icon(Icons.favorite_border,
                                        color: Color(0xff333333)),
                                  ),
                            SizedBox(
                              width: 9.77,
                            ),
                            Text(
                              "$likes",
                              style: GoogleFonts.poppins(
                                  fontStyle: FontStyle.normal,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 14,
                                  color: Color(0xff333333)),
                            ),
                          ],
                        ),
                        Text(
                          "$daysAgo days ago",
                          style: GoogleFonts.poppins(
                              fontStyle: FontStyle.normal,
                              fontWeight: FontWeight.w500,
                              fontSize: 12,
                              color: Color(0xff828282)),
                        ),
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
