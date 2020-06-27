import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:icook_mobile/ui/shared/recipe_item_model.dart';
import 'package:stacked/stacked.dart';
import 'package:carousel_pro/carousel_pro.dart';

class RecipeItem extends StatelessWidget {
  final String chefImage;
  final String chefName;
  final List<String> foodImage;
  final String foodName;
  final String foodDescription;
  final int likes;

  RecipeItem(
      {this.chefImage,
      this.chefName,
      this.foodImage,
      this.foodName,
      this.foodDescription,
      this.likes});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<RecipeItemModel>.reactive(
      viewModelBuilder: () => RecipeItemModel(),
      onModelReady: (model) => model.init(),
      builder: (context, model, child) => Padding(
        padding: const EdgeInsets.only(top: 20, bottom: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  GestureDetector(
                    onTap: () => model.seeUserInfo(),
                    child: CircleAvatar(
                      backgroundImage: AssetImage(chefImage),
                      radius: 25,
                    ),
                  ),
                  SizedBox(
                    width: 12,
                  ),
                  GestureDetector(
                    onTap: () => model.seeUserInfo(),
                    child: Text(chefName,
                        style: GoogleFonts.poppins(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        )),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 17,
            ),
            Container(
              height: 248,
              width: MediaQuery.of(context).size.width,
              child: Carousel(
                images: foodImage.map((e) => AssetImage(e)).toList(),
                dotSize: 6.0,
                dotIncreaseSize: 1.5,
                dotSpacing: 20.0,
                dotColor: Colors.white,
                dotIncreasedColor: Colors.blue,
                autoplay: false,
                indicatorBgPadding: 5.0,
                dotVerticalPadding: 20,
                dotBgColor: Colors.transparent,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(left: 0, top: 11.5),
                        child: InkWell(
                            onTap: () => model.click(),
                            child: model.isLiked
                                ? Icon(
                                    Icons.favorite,
                                    color: Colors.red,
                                    size: 32,
                                  )
                                : Icon(
                                    Icons.favorite_border,
                                    size: 32,
                                  )),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 19, top: 15),
                        child: InkWell(
                          radius: 50,
                          onTap: () {},
                          child: Image(
                            image:
                                AssetImage("assets/images/message-circle.png"),
                            width: 24,
                            height: 24,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 20, top: 11.5),
                    child: InkWell(
                      radius: 30,
                      onTap: () {},
                      child: Image(
                        image: AssetImage("assets/images/share.png"),
                        width: 24,
                        height: 24,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Text(
                "$likes likes",
                style: GoogleFonts.poppins(
                    color: Color(0xFF333333),
                    fontSize: 20,
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.w600),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: GestureDetector(
                onTap: () => model.seeDetails(),
                child: Text(
                  foodName,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: GoogleFonts.poppins(
                      color: Color(0xFF333333),
                      fontSize: 20,
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.w500),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: GestureDetector(
                onTap: () => model.seeDetails(),
                child: Text(
                  foodDescription,
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  style: GoogleFonts.poppins(
                      color: Color(0xFF828282),
                      fontSize: 16,
                      fontWeight: FontWeight.w500),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
