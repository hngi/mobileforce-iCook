import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:icook_mobile/ui/edit_profile_screen/edit_profile.dart';
import 'package:image_picker/image_picker.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

import '../profile_screen/constant.dart';
import '../ui_helper.dart';

class CreateRecipeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add New Dish"),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 25),
            child: Image(
              height: 24,
              width: 24,
              image: new AssetImage(
                'assets/images/search_fav.png',
              ),
            ),
          ),
        ],
      ),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
          new TextEditingController().clear();
        },
        child: Padding(
          padding: const EdgeInsets.only(top: 5.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: kSpacingUnit.w * 2),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '      Title',
                      style: GoogleFonts.poppins(
                          textStyle:
                              TextStyle(color: Color(0xff578DDE), fontSize: 18),
                          fontWeight: FontWeight.w600),
                    ),
                    SizedBox(height: kSpacingUnit.w * 0.5),
                    Container(
                      padding: EdgeInsets.only(left: 20, right: 20),
                      child: TextField(
                        textInputAction: TextInputAction.next,
                        onSubmitted: (_) => FocusScope.of(context).nextFocus(),
                        keyboardType: TextInputType.text,
                        style: TextStyle(fontSize: 18, fontFamily: "Poppins"),
                        cursorColor: Color(0XFFF898989),
                        decoration: InputDecoration(
                          contentPadding:
                              EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 15.0),
                          hintText: "Write the Recipe title",
                          hintStyle: TextStyle(
                              color: Color(0XFFBDBDBD),
                              fontSize: 14,
                              fontFamily: "Poppins"),
                          fillColor: Color(0xFFFFFFFF),
                          filled: true,
                          focusedBorder: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(3.0)),
                            borderSide: BorderSide(color: Color(0xFF578DDE)),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(3.0)),
                            borderSide:
                                BorderSide(color: Color(0xFFF4F4F4), width: 2),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Text(
                      '      Ingredients',
                      style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                            color: Color(0xff578DDE),
                            fontSize: 18,
                          ),
                          fontWeight: FontWeight.w600),
                    ),
                    PreparationSpan(
                      number: '1',
                      numberSpan: '800g'
                          ' \n White Flour',
                    ),
                    SizedBox(height: 30),
                    Container(
                      padding: EdgeInsets.only(left: 33, right: 33),
                      child: Material(
                        borderRadius: BorderRadius.circular(7),
                        color: Color(0xFFF578DDE),
                        child: MaterialButton(
                          // padding: EdgeInsets.all(1),
                          minWidth: 330,
                          onPressed: () {},
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Column(
                                children: <Widget>[
                                  Text(
                                    "Add Ingredient",
                                    style: GoogleFonts.poppins(
                                        textStyle: TextStyle(
                                            letterSpacing: 1,
                                            color: Colors.white,
                                            fontSize: 18),
                                        fontWeight: FontWeight.w500),
                                    textAlign: TextAlign.center,
                                  ),
                                ],
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Column(children: <Widget>[
                                Icon(
                                  Icons.add,
                                  color: Colors.white,
                                ),
                              ])
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Text(
                      '      Procedures',
                      style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                            color: Color(0xff578DDE),
                            fontSize: 18,
                          ),
                          fontWeight: FontWeight.w600),
                    ),
                    Text(
                      '      STEP 1',
                      style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                            color: Color(0xff333333),
                            fontSize: 18,
                          ),
                          fontWeight: FontWeight.w500),
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 25),
                      child: Text(
                        'Place a large roasting pan in the oven then preheat oven.',
                        style: GoogleFonts.poppins(
                            textStyle: TextStyle(
                              color: Color(0xff333333),
                              fontSize: 16,
                            ),
                            fontWeight: FontWeight.normal),
                      ),
                    ),
                    SizedBox(height: 30),
                    Container(
                      padding: EdgeInsets.only(left: 33, right: 33),
                      child: Material(
                        borderRadius: BorderRadius.circular(7),
                        color: Color(0xFFF578DDE),
                        child: MaterialButton(
                          // padding: EdgeInsets.all(1),
                          minWidth: 330,
                          onPressed: () {},
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Column(
                                children: <Widget>[
                                  Text(
                                    "Add a new step",
                                    style: GoogleFonts.poppins(
                                        textStyle: TextStyle(
                                            letterSpacing: 1,
                                            color: Colors.white,
                                            fontSize: 18),
                                        fontWeight: FontWeight.w500),
                                    textAlign: TextAlign.center,
                                  ),
                                ],
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Column(children: <Widget>[
                                Icon(
                                  Icons.add,
                                  color: Colors.white,
                                ),
                              ])
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 30),
                    Text(
                      '      Health Benefits',
                      style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                            color: Color(0xff578DDE),
                            fontSize: 18,
                          ),
                          fontWeight: FontWeight.w600),
                    ),
                    SizedBox(height: 10),
                    Container(
                      padding: EdgeInsets.only(left: 20, right: 20),
                      child: TextField(
                        textInputAction: TextInputAction.done,
                        onSubmitted: (_) => FocusScope.of(context).unfocus(),
                        minLines: 9,
                        maxLines: 20,
                        keyboardType: TextInputType.text,
                        style: TextStyle(
                          fontSize: 14,
                          fontFamily: "Poppins",
                        ),
                        cursorColor: Color(0XFFF898989),
                        decoration: InputDecoration(
                          hintText: 'Start typing...',
                          hintStyle:
                              TextStyle(color: Color(0XFFBDBDBD), fontSize: 14),
                          contentPadding:
                              EdgeInsets.fromLTRB(20.0, 30.0, 20.0, 15.0),
                          fillColor: Color(0xFFFFFFF),
                          filled: true,
                          focusedBorder: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(3.0)),
                            borderSide: BorderSide(color: Color(0xFF578DDE)),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(3.0)),
                            borderSide:
                                BorderSide(color: Color(0xFFF4F4F4), width: 2),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 30),
                    Text(
                      '      Add Images',
                      style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                            color: Color(0xff578DDE),
                            fontSize: 18,
                          ),
                          fontWeight: FontWeight.w600),
                    ),
                    SizedBox(height: 13),
                    Container(
                      child: Wrap(
                        children: <Widget>[
                          _recentdish('assets/images/3.png'),
                          _recentdish('assets/images/upload_image.png'),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 26, right: 38, top: 20),
                      child: Material(
                        borderRadius: BorderRadius.circular(7),
                        color: Color(0xFFF578DDE),
                        child: MaterialButton(
                          onPressed: () {},
                          child: Text(
                            "Upload",
                            style: GoogleFonts.poppins(
                                textStyle: TextStyle(
                                    letterSpacing: 1,
                                    color: Colors.white,
                                    fontSize: 18),
                                fontWeight: FontWeight.w500),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 75),
                    Center(
                      child: Container(
                        child: Material(
                          borderRadius: BorderRadius.circular(10),
                          color: Color(0xFFF578DDE),
                          child: MaterialButton(
                            padding: EdgeInsets.all(15),
                            minWidth: 330,
                            onPressed: () {},
                            child: Text(
                              "Complete Recipe",
                              style: GoogleFonts.poppins(
                                  textStyle: TextStyle(
                                      letterSpacing: 1,
                                      color: Colors.white,
                                      fontSize: 18),
                                  fontWeight: FontWeight.w500),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 75),
                    SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Container _recentdish(
  String image,
) =>
    Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            height: 127,
            width: 147,
            margin: EdgeInsets.only(left: 15),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(7.0),
              child: Image.asset(image, fit: BoxFit.fitHeight),
            ),
          ),
        ],
      ),
    );

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
          SizedBox(width: kSpacingUnit.w * 2),
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
                        TextStyle(color: Color(0xffffffff), fontSize: 16),
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
                        TextStyle(color: Color(0xff333333), fontSize: 16),
                    fontWeight: FontWeight.w500),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
