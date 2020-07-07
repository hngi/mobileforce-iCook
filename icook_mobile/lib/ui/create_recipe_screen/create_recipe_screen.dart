import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:icook_mobile/ui/create_recipe_screen/createdishmodel.dart';
import 'package:icook_mobile/ui/edit_profile_screen/edit_profile.dart';
import 'package:icook_mobile/ui/shared/state_responsive.dart';
import 'package:image_picker/image_picker.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:stacked/stacked.dart';

import '../profile_screen/constant.dart';
import '../ui_helper.dart';

class CreateRecipeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<CreateDishModel>.reactive(
      viewModelBuilder: () => CreateDishModel(),
      builder: (context, model, child) => Scaffold(
        appBar: AppBar(
          title: Text("Add New Dish"),
        ),
        body: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
            new TextEditingController().clear();
          },
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(top: 5.0, left: 20, right: 20),
              child: Form(
                key: model.formkey,
                child: Column(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Title',
                          style: GoogleFonts.poppins(
                              textStyle: TextStyle(
                                  color: Color(0xff578DDE), fontSize: 18),
                              fontWeight: FontWeight.w600),
                        ),
                        SizedBox(height: 10),
                        TextFormField(
                          controller: model.title,
                          textInputAction: TextInputAction.next,
                          keyboardType: TextInputType.text,
                          validator: (v) =>
                              model.validateName(model.title.text),
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
                              borderSide: BorderSide(
                                  color: Color(0xFFF4F4F4), width: 2),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Row(
                          children: <Widget>[
                            Text(
                              'Ingredients',
                              style: GoogleFonts.poppins(
                                  textStyle: TextStyle(
                                    color: Color(0xff578DDE),
                                    fontSize: 18,
                                  ),
                                  fontWeight: FontWeight.w600),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text('(not less than 3)')
                          ],
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        ListView.builder(
                          itemCount: model.ingredients.length,
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) => PreparationSpan(
                            index: index,
                            numberSpan: model.ingredients[index],
                            onPressed: () => model.removeIngredient(index),
                          ),
                        ),
                        SizedBox(height: 30),
                        TextFormField(
                          controller: model.ingre,
                          textInputAction: TextInputAction.next,
                          keyboardType: TextInputType.text,
                          style: TextStyle(fontSize: 18, fontFamily: "Poppins"),
                          cursorColor: Color(0XFFF898989),
                          decoration: InputDecoration(
                            contentPadding:
                                EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 15.0),
                            hintText: "Enter Ingredient",
                            hintStyle: TextStyle(
                                color: Color(0XFFBDBDBD),
                                fontSize: 14,
                                fontFamily: "Poppins"),
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
                              borderSide: BorderSide(
                                  color: Color(0xFFF4F4F4), width: 2),
                            ),
                          ),
                        ),
                        Material(
                          borderRadius: BorderRadius.circular(7),
                          color: Color(0xFFF578DDE),
                          child: MaterialButton(
                            // padding: EdgeInsets.all(1),
                            minWidth: 330,
                            onPressed: () => model.addIngredient(),
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
                        SizedBox(
                          height: 30,
                        ),
                        Row(
                          children: <Widget>[
                            Text(
                              'Procedures',
                              style: GoogleFonts.poppins(
                                  textStyle: TextStyle(
                                    color: Color(0xff578DDE),
                                    fontSize: 18,
                                  ),
                                  fontWeight: FontWeight.w600),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text('(not less than 3)')
                          ],
                        ),
                        ListView.builder(
                            itemCount: model.recipes.length,
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemBuilder: (context, index) => ProcedureItem(
                                text: model.recipes[index],
                                step: index,
                                onPressed: () => model.removeStep(index))),
                        SizedBox(height: 30),
                        TextFormField(
                          controller: model.steps,
                          textInputAction: TextInputAction.next,
                          keyboardType: TextInputType.text,
                          style: TextStyle(fontSize: 18, fontFamily: "Poppins"),
                          cursorColor: Color(0XFFF898989),
                          decoration: InputDecoration(
                            contentPadding:
                                EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 15.0),
                            hintText: "Enter Step",
                            hintStyle: TextStyle(
                                color: Color(0XFFBDBDBD),
                                fontSize: 14,
                                fontFamily: "Poppins"),
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
                              borderSide: BorderSide(
                                  color: Color(0xFFF4F4F4), width: 2),
                            ),
                          ),
                        ),
                        Material(
                          borderRadius: BorderRadius.circular(7),
                          color: Color(0xFFF578DDE),
                          child: MaterialButton(
                            // padding: EdgeInsets.all(1),
                            minWidth: 330,
                            onPressed: () => model.addStep(),
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
                        SizedBox(height: 30),
                        Text(
                          'Health Benefits',
                          style: GoogleFonts.poppins(
                              textStyle: TextStyle(
                                color: Color(0xff578DDE),
                                fontSize: 18,
                              ),
                              fontWeight: FontWeight.w600),
                        ),
                        SizedBox(height: 10),
                        TextFormField(
                          controller: model.healthbenefits,
                          textInputAction: TextInputAction.done,
                          validator: (v) =>
                              model.validateName(model.healthbenefits.text),
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
                            hintStyle: TextStyle(
                                color: Color(0XFFBDBDBD), fontSize: 14),
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
                              borderSide: BorderSide(
                                  color: Color(0xFFF4F4F4), width: 2),
                            ),
                          ),
                        ),
                        SizedBox(height: 30),
                        Text(
                          'Add Images',
                          style: GoogleFonts.poppins(
                              textStyle: TextStyle(
                                color: Color(0xff578DDE),
                                fontSize: 18,
                              ),
                              fontWeight: FontWeight.w600),
                        ),
                        SizedBox(height: 13),
                        // Container(
                        //   child: Wrap(
                        //     children: model.images
                        //         .map((e) => AssetThumb(
                        //             asset: e, width: 200, height: 200))
                        //         .toList(),
                        //   ),
                        // ),
                        _recentdish('assets/images/upload_image.png'),
                        Container(
                          margin: EdgeInsets.only(top: 20),
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
                        StateResponsive(
                          state: model.state,
                          busyWidget: Center(
                            child: CircularProgressIndicator(),
                          ),
                          idleWidget: Center(
                            child: Container(
                              child: Material(
                                borderRadius: BorderRadius.circular(10),
                                color: Color(0xFFF578DDE),
                                child: MaterialButton(
                                  padding: EdgeInsets.all(15),
                                  minWidth: 330,
                                  onPressed: () => model.postDish(),
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
  final int index;
  final Function onPressed;

  const PreparationSpan({
    Key key,
    this.number,
    this.numberSpan,
    this.index,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Row(
            children: <Widget>[
              Container(
                height: 30,
                width: 30,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color(0xff578DDE),
                ),
                child: Center(
                  child: Text(
                    "${index + 1}",
                    style: GoogleFonts.poppins(
                        textStyle:
                            TextStyle(color: Color(0xffffffff), fontSize: 16),
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
                        textStyle: TextStyle(fontSize: 16),
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ),
            ],
          ),
        ),
        IconButton(icon: Icon(Icons.clear), onPressed: onPressed)
      ],
    );
  }
}

class ProcedureItem extends StatelessWidget {
  final int step;
  final String text;
  final Function onPressed;

  const ProcedureItem({Key key, this.step, this.text, this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'STEP ${step + 1}',
                style: GoogleFonts.poppins(
                    textStyle: TextStyle(
                      color: Color(0xff333333),
                      fontSize: 18,
                    ),
                    fontWeight: FontWeight.w500),
              ),
              Text(
                text,
                style: GoogleFonts.poppins(
                    textStyle: TextStyle(
                      fontSize: 16,
                    ),
                    fontWeight: FontWeight.normal),
              ),
            ],
          ),
        ),
        IconButton(
          icon: Icon(Icons.clear),
          onPressed: onPressed,
        )
      ],
    );
  }
}
