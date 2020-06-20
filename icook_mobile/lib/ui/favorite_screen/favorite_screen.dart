import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
              onTap: (){},
              child: Image(image:

              AssetImage( "assets/images/search.png"),

                width: 24,
                height: 24,
              ),
            ),
          ),
        ],
      ),
      body: ListView(
        children: <Widget>[
          _buildCardItem(
              foodImage: [
                "assets/images/amala.jpeg",
                "assets/images/recipes.png",
                "assets/images/amala.jpeg"
              ],
              chefImage: "assets/images/avatar.png",
              chefName: "Rosa Nna",
              foodName: "Boiled Rice and Chicken",
              foodDescription: "This is just a very very dummy"
                  " food description for texting",
              likes: 4),
          _buildCardItem(
              chefImage: "assets/images/avatar.png",
              foodImage: [
                "assets/images/amala.jpeg",
                "assets/images/recipes.png",
                "assets/images/amala.jpeg"
              ],
              chefName: "Rosa Nna",
              foodName: "Boiled Rice and Chicken",
              foodDescription: "This is just a very very dummy"
                  " food description for texting",
              likes: 4),
        ],
      ),
    );
  }

  Widget _buildCardItem(
      {String chefImage,
      String chefName,
       List<String> foodImage,
      foodName,
      String foodDescription,
      int likes}) {

    print("FoodImage Size ${foodImage.length}");
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              CircleAvatar(
                backgroundImage: AssetImage(chefImage),
                radius: 25,
              ),
              SizedBox(
                width: 15,
              ),
              Text(
                chefName,
                style: GoogleFonts.poppins(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF333333)),
              )
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.3,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(15)),
            child: Carousel(
              images: foodImage.map((e) => AssetImage(e)).toList(),
              dotSize: 6.0,
              dotIncreaseSize: 1.5,
              dotSpacing: 20.0,
              dotColor: Colors.white,
              dotIncreasedColor: Colors.blue,
              autoplay: false,
              indicatorBgPadding: 5.0,
              radius: Radius.circular(10),
              dotVerticalPadding: 20,

              dotBgColor: Colors.transparent,
              borderRadius: true,
            ),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[



                  Padding(
                    padding: const EdgeInsets.only(
                        left: 0,
                        top: 11.5
                    ),
                    child: InkWell(
                      onTap: (){},
                      child: Image(image:

                      AssetImage( "assets/images/like_icon.png"),

                        width: 24,
                        height: 24,
                      ),
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.only(
                        left: 19,
                      top: 11.5
                    ),
                    child: InkWell(
                      onTap: (){},
                      child: Image(image:

                      AssetImage( "assets/images/message-circle.png"),

                        width: 24,
                        height: 24,
                      ),
                    ),
                  ),


                ],
              ),

              Padding(
                padding: const EdgeInsets.only(
                    left: 19,
                    top: 11.5
                ),
                child: InkWell(
                  onTap: (){},
                  child: Image(image:

                  AssetImage( "assets/images/share.png"),

                    width: 24,
                    height: 24,
                  ),
                ),
              ),

            ],
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            "$likes likes",
            style: GoogleFonts.poppins(
                color: Color(0xFF333333),
                fontSize: 20,
                fontStyle: FontStyle.normal,
                fontWeight: FontWeight.w600),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            foodName,
            style: GoogleFonts.poppins(
                color: Color(0xFF333333),
                fontSize: 20,
                fontStyle: FontStyle.normal,
                fontWeight: FontWeight.w500),
          ),
          Text(
            foodDescription,
            style: GoogleFonts.poppins(
                color: Color(0xFF828282),
                fontSize: 16,
                fontWeight: FontWeight.w500),
          )
        ],
      ),
    );
  }
}
