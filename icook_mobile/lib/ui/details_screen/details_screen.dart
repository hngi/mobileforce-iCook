import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:icook_mobile/models/response/Dish/getmydishes.dart';
import 'package:icook_mobile/ui/profile_screen/constant.dart';

class DetailsScreen extends StatelessWidget {
  final Dishe dish;

  const DetailsScreen({Key key, this.dish}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context,
        height: double.infinity, width: 414, allowFontScaling: true);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          dish.name,
          style: GoogleFonts.poppins(
              textStyle: TextStyle(fontSize: 21), fontWeight: FontWeight.w600),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(top: 5.0, bottom: 12.0),
              child: ListView(
                children: [
                  Row(
                    children: [
                      SizedBox(width: kSpacingUnit.w * 1),
                      GestureDetector(
                        onTap: () {},
                        child: CircleAvatar(
                          backgroundImage:
                              AssetImage('assets/images/chefavatar1.png'),
                          radius: 25,
                        ),
                      ),
                      SizedBox(width: kSpacingUnit.w * 1.5),
                      Text(
                        dish.name,
                        style: GoogleFonts.poppins(
                            textStyle: TextStyle(fontSize: 19),
                            fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                  SizedBox(height: kSpacingUnit.w * 1),
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
                      dotBgColor: Colors.transparent,
                    ),
                  ),
                  SizedBox(height: kSpacingUnit.w * 1),
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
                                  onTap: () {},
                                  child: dish.isLiked
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
                  SizedBox(height: kSpacingUnit.w * 1),
                  Row(
                    children: [
                      SizedBox(width: kSpacingUnit.w * 1.5),
                      Text(
                        '${dish.likesCount} likes',
                        style: GoogleFonts.poppins(
                            textStyle: TextStyle(fontSize: 21),
                            fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                  SizedBox(height: kSpacingUnit.w * 2),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(height: kSpacingUnit.w * 0.5),
                      Padding(
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
                      SizedBox(height: kSpacingUnit.w * 2),
                      Container(
                        height: ScreenUtil().setSp(kSpacingUnit.w * 5),
                        width: ScreenUtil().setSp(kSpacingUnit.w * 5),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color(0xff578DDE),
                          image: DecorationImage(
                              image: AssetImage('assets/images/bag.png'),
                              fit: BoxFit.scaleDown),
                        ),
                      ),
                      SizedBox(height: kSpacingUnit.w * 0.9),
                      Text(
                        'SHOPPING LIST',
                        style: GoogleFonts.poppins(
                            textStyle: TextStyle(fontSize: 21),
                            fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                  ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: dish.ingredients.length,
                      itemBuilder: (context, index) =>
                          Text(dish.ingredients[index])),
                  SizedBox(height: kSpacingUnit.w * 2),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: ScreenUtil().setSp(kSpacingUnit.w * 5),
                        width: ScreenUtil().setSp(kSpacingUnit.w * 5),
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Color(0xff578DDE),
                            image: DecorationImage(
                                image: AssetImage('assets/images/chef.png'),
                                fit: BoxFit.scaleDown)),
                      ),
                      SizedBox(height: kSpacingUnit.w * 0.9),
                      Text(
                        'PREPARATION',
                        style: GoogleFonts.poppins(
                            textStyle: TextStyle(fontSize: 21),
                            fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                  ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: dish.recipe.length,
                      itemBuilder: (context, index) => PreparationSpan(
                            number: '${index + 1}',
                            numberSpan: dish.recipe[index],
                          )),
                  SizedBox(height: kSpacingUnit.w * 2),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: ScreenUtil().setSp(kSpacingUnit.w * 5),
                        width: ScreenUtil().setSp(kSpacingUnit.w * 5),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color(0xff578DDE),
                        ),
                        child: Icon(
                          Icons.add,
                          color: Color(0xffFFFFFF),
                          size: ScreenUtil().setSp(kSpacingUnit.w * 4.5),
                        ),
                      ),
                      SizedBox(height: kSpacingUnit.w * 0.9),
                      Text(
                        'HEALTH BENEFITS',
                        style: GoogleFonts.poppins(
                            textStyle: TextStyle(fontSize: 21),
                            fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                  HealthBenefits(
                    healthText: dish.healthBenefits[0],
                  ),
                  SizedBox(height: kSpacingUnit.w * 4),
                  Row(
                    children: [
                      SizedBox(width: kSpacingUnit.w * 1),
                      Text(
                        'COMMENTS',
                        style: GoogleFonts.poppins(
                            textStyle: TextStyle(
                                color: Color(0xff578DDE), fontSize: 21),
                            fontWeight: FontWeight.w600),
                      ),
                      SizedBox(width: kSpacingUnit.w * 1.5),
                      Image.asset(
                        'assets/images/Shape.png',
                        color: Color(0xff578DDE),
                        height: ScreenUtil().setSp(kSpacingUnit.w * 2.9),
                        width: ScreenUtil().setSp(kSpacingUnit.w * 2.9),
                      ),
                    ],
                  ),
                  SizedBox(height: kSpacingUnit.w * 2),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(8.0, 5.0, 8.0, 5.0),
                    child: Container(
                      padding: EdgeInsets.fromLTRB(15, 5, 0, 5),
                      height: kSpacingUnit.w * 5,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: Color(0xffF4F4F4),
                          width: 2,
                        ),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            'Leave a comment',
                            style: GoogleFonts.poppins(
                                textStyle: TextStyle(
                                    color: Color(0xffbdbdbd), fontSize: 18),
                                fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
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
            textStyle: TextStyle(color: Color(0xff797978), fontSize: 19),
            fontWeight: FontWeight.w400),
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
      padding: const EdgeInsets.fromLTRB(0, 8, 12, 0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(width: kSpacingUnit.w * 1),
          Container(
            height: ScreenUtil().setSp(kSpacingUnit.w * 2.7),
            width: ScreenUtil().setSp(kSpacingUnit.w * 2.7),
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
          SizedBox(width: kSpacingUnit.w * 1.5),
          Container(
            child: Flexible(
              child: Text(
                numberSpan,
                style: GoogleFonts.poppins(
                    textStyle:
                        TextStyle(color: Color(0xff797978), fontSize: 19),
                    fontWeight: FontWeight.w400),
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
              style: TextStyle(
                  color: Color(0xff797978),
                  fontSize: 19,
                  fontWeight: FontWeight.w400),
            ),
          ],
        ),
      ),
    );
  }
}
