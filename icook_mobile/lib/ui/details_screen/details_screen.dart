import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:icook_mobile/ui/profile_screen/constant.dart';

class DetailsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context,
        height: double.infinity, width: 414, allowFontScaling: true);

    return Scaffold(
      appBar: AppBar(title: Text('Recipe details')),
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
                      Container(
                        height: ScreenUtil().setSp(kSpacingUnit.w * 5),
                        width: ScreenUtil().setSp(kSpacingUnit.w * 5),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color(0xff578DDE),
                          image: DecorationImage(
                              image: AssetImage('assets/images/avatar.png'),
                              fit: BoxFit.contain),
                        ),
                      ),
                      SizedBox(width: kSpacingUnit.w * 1.5),
                      Text(
                        'Mary Stella',
                        style: GoogleFonts.poppins(
                            textStyle: TextStyle(
                                color: Color(0xff333333), fontSize: 19),
                            fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                  SizedBox(height: kSpacingUnit.w * 1),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(12, 5, 12, 5),
                    child: Container(
                      height: kSpacingUnit.w * 22,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage('assets/images/recipes.png'),
                              fit: BoxFit.cover),
                          borderRadius: BorderRadius.circular(10.0),
                          color: Colors.red),
                    ),
                  ),
                  SizedBox(height: kSpacingUnit.w * 1),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(width: kSpacingUnit.w * 1),
                      Icon(
                        Icons.favorite_border,
                        color: Color(0xff333333),
                        size: ScreenUtil().setSp(kSpacingUnit.w * 2.9),
                      ),
                      SizedBox(width: kSpacingUnit.w * 1.5),
                      Image.asset(
                        'assets/images/Shape.png',
                        color: Color(0xff333333),
                        height: ScreenUtil().setSp(kSpacingUnit.w * 2.9),
                        width: ScreenUtil().setSp(kSpacingUnit.w * 2.9),
                      ),
                    ],
                  ),
                  SizedBox(height: kSpacingUnit.w * 1),
                  Row(
                    children: [
                      SizedBox(width: kSpacingUnit.w * 1.5),
                      Text(
                        '4 likes',
                        style: GoogleFonts.poppins(
                            textStyle: TextStyle(
                                color: Color(0xff333333), fontSize: 21),
                            fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                  SizedBox(height: kSpacingUnit.w * 2),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'DOUGHNUTS',
                        style: GoogleFonts.poppins(
                            textStyle: TextStyle(
                                color: Color(0xff333333), fontSize: 21),
                            fontWeight: FontWeight.w600),
                      ),
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
                            textStyle: TextStyle(
                                color: Color(0xff333333), fontSize: 21),
                            fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      TextSpans(
                        text: '3 Cups',
                        spanText: ' of flour',
                      ),
                      TextSpans(
                        text: '1 teaspoon',
                        spanText: ' of salt',
                      ),
                      TextSpans(
                        text: '5 teaspoon',
                        spanText: ' of baking powder',
                      ),
                      TextSpans(
                        text: '1 teaspoon',
                        spanText: ' of cinnamon - powdered',
                      ),
                      TextSpans(
                        text: '1 teaspoon',
                        spanText: ' of nutmeg - powdered',
                      ),
                      TextSpans(
                        text: '2 Tablespoon',
                        spanText: ' of butter',
                      ),
                      TextSpans(
                        text: '3 Cups',
                        spanText: ' of sugar',
                      ),
                      TextSpans(
                        text: '2 eggs',
                        spanText: ' - beaten well',
                      ),
                      TextSpans(
                        text: '3 Cups',
                        spanText: ' of milk',
                      ),
                      TextSpans(
                        text: '',
                        spanText: 'Oil to deep fry',
                      ),
                    ],
                  ),
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
                            textStyle: TextStyle(
                                color: Color(0xff333333), fontSize: 21),
                            fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      PreparationSpan(
                        number: '1',
                        numberSpan:
                            'Sift flour with salt, baking powder, cinnamon and'
                            ' nutmeg and keep aside.',
                      ),
                      PreparationSpan(
                        number: '2',
                        numberSpan:
                            'Cream butter and sugar. Add eggs and beat well.',
                      ),
                      PreparationSpan(
                        number: '3',
                        numberSpan:
                            'Add milk and flour and mix into a dough like consistency.',
                      ),
                      PreparationSpan(
                        number: '4',
                        numberSpan: 'Roll the dough on a lightly floured '
                            'surface to 1 inch thickness.',
                      ),
                      PreparationSpan(
                        number: '5',
                        numberSpan:
                            'Cut with floured doughnut cutter and let stand for 15 minutes.',
                      ),
                      PreparationSpan(
                        number: '6',
                        numberSpan:
                            'Heat oil and add the doughnuts to it over high heat.',
                      ),
                      PreparationSpan(
                        number: '7',
                        numberSpan:
                            'Turn immediately and lower heat to medium and fry till brown.',
                      ),
                      PreparationSpan(
                        number: '8',
                        numberSpan: 'Drain on absorbent paper and serve.',
                      ),
                    ],
                  ),
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
                            textStyle: TextStyle(
                                color: Color(0xff333333), fontSize: 21),
                            fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      HealthBenefits(
                        healthText:
                            'They are highly beneficial for your mental well being.',
                      ),
                      HealthBenefits(
                        healthText: 'Some researchers say that the donut and '
                            'coffee combo could help enhance your memory',
                      ),
                      HealthBenefits(
                        healthText: 'Not only are they fried, but full of '
                            'sugar. Sugar gives you energy',
                      ),
                      HealthBenefits(
                        healthText: 'Source of Calcium.',
                      ),
                      HealthBenefits(
                        healthText: 'Source of Iron.',
                      ),
                    ],
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
