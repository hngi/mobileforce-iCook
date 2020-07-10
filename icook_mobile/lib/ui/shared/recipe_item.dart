import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:icook_mobile/models/response/Dish/dishitem.dart';
import 'package:icook_mobile/models/response/Dish/dishresponse.dart';
import 'package:icook_mobile/ui/comment_screen/comment_screen.dart';
import 'package:icook_mobile/ui/other_users/other_users.dart';
import 'package:icook_mobile/ui/shared/recipe_item_model.dart';
import 'package:stacked/stacked.dart';
import 'package:carousel_pro/carousel_pro.dart';

class RecipeItem extends StatelessWidget {
  final Dish dish;

  const RecipeItem({Key key, this.dish}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<RecipeItemModel>.reactive(
      viewModelBuilder: () => RecipeItemModel(),
      onModelReady: (model) => model.setData(dish),
      builder: (context, model, child) => Card(
        margin: EdgeInsets.zero,
        child: Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(height: 10),
              InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => OtherUserInfoScreen(
                                userId: dish.chefId[0].id,
                              )));
                },
                child: Padding(
                  padding: const EdgeInsets.only(
                      left: 20, right: 20, top: 5, bottom: 5),
                  child: Row(
                    children: <Widget>[
                      GestureDetector(
                        onTap: () {},
                        child: CircleAvatar(
                          backgroundImage: dish.chefId.isNotEmpty
                              ? CachedNetworkImage(
                                  imageUrl: dish.chefId[0].userImage,
                                )
                              : AssetImage('assets/images/chefavatar1.png'),
                          radius: 25,
                        ),
                      ),
                      SizedBox(
                        width: 12,
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            GestureDetector(
                              onTap: () {},
                              child: Text(dish.chefId[0].name,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: GoogleFonts.poppins(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500,
                                  )),
                            ),
                            Text(model.time),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 17,
              ),
              Container(
                height: 300,
                width: MediaQuery.of(context).size.width,
                child: Carousel(
                  images: dish.dishImages
                      .map((e) => CachedNetworkImage(
                            alignment: Alignment.center,
                            fit: BoxFit.cover,
                            imageUrl: e,
                            placeholder: (context, url) => Container(
                              color: Colors.blueGrey,
                            ),
                          ))
                      .toList(),
                  dotSize: 6.0,
                  dotIncreaseSize: 1.5,
                  dotSpacing: 20.0,
                  dotColor: Colors.white,
                  dotIncreasedColor: Colors.blue,
                  autoplay: false,
                  indicatorBgPadding: 5.0,
                  dotVerticalPadding: 20,
                  defaultImage: AssetImage('assets/images/icook_logo.png'),
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
                          child: GestureDetector(
                              onTap: () => model.like(),
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
                          child: GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        fullscreenDialog: true,
                                        builder: (context) => CommentScreen(
                                              dishId: dish.id,
                                            )));
                              },
                              child: ImageIcon(AssetImage(
                                  'assets/images/message-circle.png'))),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 11.5),
                      child: PopupMenuButton<PopUpType>(
                        onSelected: (PopUpType result) {
                          if (result == PopUpType.favourite) {
                            model.favourite();
                          }
                        },
                        itemBuilder: (BuildContext context) =>
                            <PopupMenuEntry<PopUpType>>[
                          PopupMenuItem<PopUpType>(
                            value: PopUpType.favourite,
                            child: dish.isFavourite
                                ? Text('Remove from Favourites')
                                : Text('Add to Favourites'),
                          ),
                          PopupMenuItem<PopUpType>(
                            value: PopUpType.share,
                            child: Text('Share'),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              InkWell(
                onTap: () => model.seeDetails(dish),
                child: Container(
                  width: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: Text(
                          "${model.likes} likes",
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
                        padding: const EdgeInsets.only(left: 20, right: 20),
                        child: GestureDetector(
                          onTap: () => model.seeDetails(dish),
                          child: Text(
                            dish.name,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: GoogleFonts.poppins(
                                fontSize: 20,
                                fontStyle: FontStyle.normal,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20, right: 20),
                        child: GestureDetector(
                          onTap: () => model.seeDetails(dish),
                          child: Text(
                            dish.healthBenefits[0],
                            maxLines: 2,
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// This is the type used by the popup menu below.
enum PopUpType { favourite, share }

// This menu button widget updates a _selection field (of type PopUpType,
// not shown here).
