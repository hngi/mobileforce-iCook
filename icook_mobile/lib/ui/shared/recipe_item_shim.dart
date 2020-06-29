import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:icook_mobile/ui/shared/recipe_item_model.dart';
import 'package:stacked/stacked.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:shimmer/shimmer.dart';

class RecipeItemShim extends StatelessWidget {
  final String chefImage;
  final String chefName;
  final List<String> foodImage;
  final String foodName;
  final String foodDescription;
  final int likes;
  final int index;

  RecipeItemShim(
      {this.chefImage,
      this.chefName,
      this.foodImage,
      this.foodName,
      this.foodDescription,
      this.likes,
      Key key,
      this.index});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<RecipeItemModel>.reactive(
      viewModelBuilder: () => RecipeItemModel(),
      onModelReady: (model) => model.init(),
      builder: (context, model, child) => Padding(
        padding: const EdgeInsets.only(bottom: 10),
        child: index != -1
            ? Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Divider(),
                  SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        GestureDetector(
                          child: CircleAvatar(
                            backgroundImage: AssetImage(chefImage),
                            radius: 25,
                          ),
                        ),
                        SizedBox(
                          width: 12,
                        ),
                        GestureDetector(

                      child: Container(
                        height: 15, width: 150.0,
                        color: Colors.black,
                      )
                    
                  
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
                  
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Text(
                      "",
                      style: GoogleFonts.poppins(
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
                      
                      child: Container(
                        height: 8, width: 150.0,
                        color: Colors.black,
                      )
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: GestureDetector(
                      
                      child: Container(
                        height: 8, width: 300.0,
                        color: Colors.black,
                      )
                    ),
                  ),
                  SizedBox(height: 4,),
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: GestureDetector(
                      
                      child: Container(
                        height: 8, width: 300.0,
                        color: Colors.black,
                      )
                    ),
                  )
                ],
              )
            : Expanded(
                child: Container(
                color: Colors.grey,
              )),
      ),
    );
  }
}
