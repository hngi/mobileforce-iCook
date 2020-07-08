import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:icook_mobile/models/response/Dish/dishitem.dart';
import 'package:icook_mobile/ui/details_screen/detailsmodel.dart';
import 'package:icook_mobile/ui/profile_screen/constant.dart';
import 'package:icook_mobile/ui/ui_helper.dart';
import 'package:stacked/stacked.dart';

// This is the type used by the popup menu below.
enum PopUpType { favourite, share }

class DetailsScreen extends StatelessWidget {
  final Dish dish;

  const DetailsScreen({Key key, this.dish}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<DetailsModel>.reactive(
      viewModelBuilder: () => DetailsModel(),
      onModelReady: (model) => model.setData(dish),
      builder: (context, model, child) => Scaffold(
        appBar: AppBar(
          title: Text(
            dish.name,
            style: GoogleFonts.poppins(
                textStyle: TextStyle(fontSize: 21),
                fontWeight: FontWeight.w600),
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(top: 5.0, bottom: 12.0),
            child: Center(
              child: Container(
                constraints: BoxConstraints(maxWidth: 600),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 10),
                      child: Row(
                        children: [
                          SizedBox(width: 10),
                          GestureDetector(
                            onTap: () {},
                            child: CircleAvatar(
                              backgroundImage: dish.chefId.isNotEmpty
                                  ? NetworkImage(dish.chefId[0].userImage)
                                  : AssetImage('assets/images/chefavatar1.png'),
                              radius: 25,
                            ),
                          ),
                          SizedBox(width: 10),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                GestureDetector(
                                  onTap: () => model.seeUserInfo(),
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
                    SizedBox(height: 10),
                    Container(
                      height: 248,
                      width: MediaQuery.of(context).size.width,
                      child: Carousel(
                        images:
                            dish.dishImages.map((e) => AssetImage(e)).toList(),
                        dotSize: 6.0,
                        dotIncreaseSize: 1.5,
                        dotSpacing: 20.0,
                        dotColor: Colors.white,
                        dotIncreasedColor: Colors.blue,
                        autoplay: false,
                        indicatorBgPadding: 5.0,
                        dotVerticalPadding: 20,
                        defaultImage:
                            AssetImage('assets/images/icook_logo.png'),
                        dotBgColor: Colors.transparent,
                      ),
                    ),
                    SizedBox(height: 15),
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
                                padding:
                                    const EdgeInsets.only(left: 0, top: 11.5),
                                child: InkWell(
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
                                padding:
                                    const EdgeInsets.only(left: 19, top: 15),
                                child: InkWell(
                                  radius: 50,
                                  onTap: () {},
                                  child: Image(
                                    image: AssetImage(
                                        "assets/images/message-circle.png"),
                                    width: 24,
                                    height: 24,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.only(right: 20, top: 11.5),
                            child: PopupMenuButton<PopUpType>(
                              onSelected: (PopUpType result) {
                                if (result == PopUpType.favourite) {
                                  model.favourite();
                                }
                              },
                              itemBuilder: (BuildContext context) =>
                                  <PopupMenuEntry<PopUpType>>[
                                const PopupMenuItem<PopUpType>(
                                  value: PopUpType.favourite,
                                  child: Text('Add to Favourites'),
                                ),
                                const PopupMenuItem<PopUpType>(
                                  value: PopUpType.share,
                                  child: Text('Share'),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 10),
                    Row(
                      children: [
                        SizedBox(width: 20),
                        Text(
                          '${dish.likesCount} likes',
                          style: GoogleFonts.poppins(
                              textStyle: TextStyle(fontSize: 21),
                              fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Visibility(
                            visible: false,
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(12, 0, 12, 0),
                              child: Text(
                                'Doughnuts, the typical American snack. Flour kneaded '
                                'with milk, sugar with the flavor of cinnamon and '
                                'nutmeg. Shaped into rings and deep fried. Usually '
                                'served with sugar glaze or chocolate sauce.',
                                style: GoogleFonts.poppins(
                                    textStyle: TextStyle(
                                        color: Color(0xff797978), fontSize: 19),
                                    fontWeight: FontWeight.w400),
                              ),
                            ),
                          ),
                          Divider(),
                          SizedBox(height: 10),
                          Container(
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Color(0xff578DDE),
                              image: DecorationImage(
                                  image: AssetImage('assets/images/bag.png'),
                                  fit: BoxFit.scaleDown),
                            ),
                          ),
                          SizedBox(height: 10),
                          Text(
                            'SHOPPING LIST',
                            style: GoogleFonts.poppins(
                                textStyle: TextStyle(fontSize: 21),
                                fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                    ),
                    Wrap(
                      children: dish.ingredients
                          .map((e) => Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 8.0),
                                child: Chip(
                                  backgroundColor: Constants.kbuttonColor1,
                                  label: Text(e),
                                  labelStyle: GoogleFonts.poppins(fontSize: 16),
                                ),
                              ))
                          .toList(),
                    ),
                    // Padding(
                    //   padding: const EdgeInsets.all(8.0),
                    //   child: ListView.builder(
                    //       shrinkWrap: true,
                    //       physics: NeverScrollableScrollPhysics(),
                    //       itemCount: dish.ingredients.length,
                    //       itemBuilder: (context, index) =>
                    //           TextSpans(text: '${dish.ingredients[index]}')),
                    // ),
                    Divider(),
                    SizedBox(height: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Color(0xff578DDE),
                              image: DecorationImage(
                                  image: AssetImage('assets/images/chef.png'),
                                  fit: BoxFit.scaleDown)),
                        ),
                        SizedBox(height: 10),
                        Text(
                          'PREPARATION',
                          style: GoogleFonts.poppins(
                              textStyle: TextStyle(fontSize: 21),
                              fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ListView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: dish.recipe.length,
                          itemBuilder: (context, index) => PreparationSpan(
                                number: '${index + 1}',
                                numberSpan: dish.recipe[index],
                              )),
                    ),
                    Divider(),
                    SizedBox(height: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Color(0xff578DDE),
                          ),
                          child: Icon(
                            Icons.add,
                            color: Color(0xffFFFFFF),
                            size: 24,
                          ),
                        ),
                        SizedBox(height: 10),
                        Text(
                          'HEALTH BENEFITS',
                          style: GoogleFonts.poppins(
                              textStyle: TextStyle(fontSize: 21),
                              fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: HealthBenefits(
                        healthText: dish.healthBenefits[0],
                      ),
                    ),
                    SizedBox(height: 10),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class HealthBenefits extends StatelessWidget {
  final String healthText;

  const HealthBenefits({
    Key key,
    this.healthText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(12, 8, 12, 8),
      child: Text(
        healthText,
        style: GoogleFonts.poppins(
            textStyle: TextStyle(fontSize: 19), fontWeight: FontWeight.w400),
      ),
    );
  }
}

class PreparationSpan extends StatelessWidget {
  final String number;
  final String numberSpan;

  const PreparationSpan({
    Key key,
    this.number,
    this.numberSpan,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(12, 8, 12, 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            height: 30,
            width: 30,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Color(0xff578DDE),
            ),
            child: Center(
              child: Text(
                number,
                style: GoogleFonts.poppins(
                    textStyle:
                        TextStyle(color: Color(0xffffffff), fontSize: 18),
                    fontWeight: FontWeight.w600),
              ),
            ),
          ),
          SizedBox(width: 10),
          Container(
            child: Flexible(
              child: Text(
                numberSpan,
                style: GoogleFonts.poppins(
                    textStyle: TextStyle(fontSize: 18),
                    fontWeight: FontWeight.w500),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class TextSpans extends StatelessWidget {
  final String text;
  final String spanText;

  const TextSpans({
    Key key,
    this.text,
    this.spanText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(12, 8, 12, 8),
      child: RichText(
        text: TextSpan(
          text: text,
          style: TextStyle(
              color: Color(0xff333333),
              fontSize: 19,
              fontWeight: FontWeight.w500),
          children: <TextSpan>[
            TextSpan(
              text: spanText,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
            ),
          ],
        ),
      ),
    );
  }
}
