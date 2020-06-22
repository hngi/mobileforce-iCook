import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:icook_mobile/ui/profile_screen/constant.dart';

import '../ui_helper.dart';

class EditProfile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
        'Edit Details',
        style: GoogleFonts.poppins(
            textStyle: TextStyle(color: Colors.black, fontSize: 24),
            fontWeight: FontWeight.w500),
      )),
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
                Container(
                  height: 134,
                  width: 134,
                  child: Stack(
                    children: <Widget>[
                      GestureDetector(
                        onTap: () {},
                        child: Container(
                            width: 134,
                            height: 134,
                            decoration: new BoxDecoration(
                                shape: BoxShape.circle,
                                image: new DecorationImage(
                                    fit: BoxFit.cover,
                                    image: new AssetImage(
                                        'assets/images/editavatar.jpg')))),
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: Align(
                          alignment: Alignment.bottomRight,
                          child: Container(
                            color: Colors.white,
                            margin: EdgeInsets.only(bottom: 10, right: 10),
                            child: Icon(Icons.edit),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: kSpacingUnit.w * 2),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '      Name',
                      style: GoogleFonts.poppins(
                          textStyle:
                              TextStyle(color: Color(0xff333333), fontSize: 18),
                          fontWeight: FontWeight.w500),
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
                          hintText: "Enter Name",
                          hintStyle: TextStyle(
                              color: Color(0XFFBDBDBD),
                              fontSize: 16,
                              fontFamily: "Poppins"),
                          fillColor: Color(0xFFF4F4F4),
                          filled: true,
                          focusedBorder: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(7.0)),
                            borderSide: BorderSide(color: Color(0xFF578DDE)),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10.0)),
                            borderSide: BorderSide(color: Color(0xFFF4F4F4)),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      '      Email Address',
                      style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                            color: Color(0xff333333),
                            fontSize: 18,
                          ),
                          fontWeight: FontWeight.w500),
                    ),
                    SizedBox(height: kSpacingUnit.w * 0.5),
                    Container(
                      padding: EdgeInsets.only(left: 20, right: 20),
                      child: TextField(
                        textInputAction: TextInputAction.next,
                        onSubmitted: (_) => FocusScope.of(context).nextFocus(),
                        keyboardType: TextInputType.emailAddress,
                        style: TextStyle(fontSize: 16, fontFamily: "Poppins"),
                        cursorColor: Color(0XFFF898989),
                        decoration: InputDecoration(
                          contentPadding:
                              EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 15.0),
                          hintText: "Emmanuel.cook@gmail.com",
                          hintStyle: TextStyle(
                              color: Color(0XFFBDBDBD),
                              fontSize: 16,
                              fontFamily: "Poppins"),
                          fillColor: Color(0xFFF4F4F4),
                          filled: true,
                          focusColor: Colors.red,
                          focusedBorder: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(7.0)),
                            borderSide: BorderSide(color: Color(0xFF578DDE)),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10.0)),
                            borderSide: BorderSide(color: Color(0xFFF4F4F4)),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      '      Phone Number',
                      style: GoogleFonts.poppins(
                          textStyle:
                              TextStyle(color: Color(0xff333333), fontSize: 18),
                          fontWeight: FontWeight.w500),
                    ),
                    SizedBox(height: kSpacingUnit.w * 0.5),
                    Container(
                      padding: EdgeInsets.only(left: 20, right: 20),
                      child: TextField(
                        textInputAction: TextInputAction.next,
                        onSubmitted: (_) => FocusScope.of(context).nextFocus(),
                        keyboardType: TextInputType.number,
                        style: TextStyle(fontSize: 16, fontFamily: "Poppins"),
                        cursorColor: Color(0XFFF898989),
                        decoration: InputDecoration(
                          contentPadding:
                              EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 15.0),
                          fillColor: Color(0xFFF4F4F4),
                          filled: true,
                          focusedBorder: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(7.0)),
                            borderSide: BorderSide(color: Color(0xFF578DDE)),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10.0)),
                            borderSide: BorderSide(color: Color(0xFFF4F4F4)),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      '      Bio',
                      style: GoogleFonts.poppins(
                          textStyle:
                              TextStyle(color: Color(0XFF333333), fontSize: 18),
                          fontWeight: FontWeight.w500),
                    ),
                    SizedBox(height: kSpacingUnit.w * 0.5),
                    Container(
                      padding: EdgeInsets.only(left: 20, right: 20),
                      child: TextField(
                        textInputAction: TextInputAction.done,
                        onSubmitted: (_) => FocusScope.of(context).unfocus(),
                        minLines: 4,
                        maxLines: 10,
                        keyboardType: TextInputType.text,
                        style: TextStyle(
                          fontSize: 16,
                          fontFamily: "Poppins",
                        ),
                        cursorColor: Color(0XFFF898989),
                        decoration: InputDecoration(
                          hintText: 'Enter text',
                          hintStyle:
                              TextStyle(color: Color(0XFFBDBDBD), fontSize: 14),
                          contentPadding:
                              EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 15.0),
                          fillColor: Color(0xFFF4F4F4),
                          filled: true,
                          focusedBorder: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(7.0)),
                            borderSide: BorderSide(color: Color(0xFF578DDE)),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10.0)),
                            borderSide: BorderSide(color: Color(0xFFF4F4F4)),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 20, right: 20),
                      child: Material(
                        borderRadius: BorderRadius.circular(10),
                        color: Color(0xFFF578DDE),
                        child: MaterialButton(
                          padding: EdgeInsets.all(15),
                          minWidth: 330,
                          onPressed: () {},
                          child: Text(
                            "Update Profile",
                            style: GoogleFonts.poppins(
                                textStyle: TextStyle(
                                    letterSpacing: 1,
                                    color: Colors.white,
                                    fontSize: 18),
                                fontWeight: FontWeight.w600),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ),
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
