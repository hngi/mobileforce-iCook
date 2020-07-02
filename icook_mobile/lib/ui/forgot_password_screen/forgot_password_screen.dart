import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:icook_mobile/ui/profile_screen/constant.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:icook_mobile/ui/shared/sumbitButton.dart';
import 'package:icook_mobile/ui/ui_helper.dart';

class ForgotPasswordScreen extends StatelessWidget {
  //forgot_password_icon

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context,
        height: double.infinity, width: 375, allowFontScaling: true);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Forgot Password",
          style: GoogleFonts.poppins(
            fontStyle: FontStyle.normal,
            fontSize: 24,
          ),
        ),
        centerTitle: true,
      ),
      body: ListView(
        children: <Widget>[
          Padding(
              padding: EdgeInsets.only(
                left: 20,
                right: 20,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  SizedBox(
                    height: 34,
                  ),
                  Center(
                    child: Container(
                      width: kSpacingUnit.w * 104,
                      height: 136,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              fit: BoxFit.contain,
                              image: AssetImage(
                                  "assets/images/forgot_password_icon.png"))),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Text(
                    "Please enter below your email address to reset password.",
                    style: GoogleFonts.poppins(
                        fontStyle: FontStyle.normal,
                        fontSize: 16,
                        fontWeight: FontWeight.normal),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Text(
                    "Email address",
                    style: GoogleFonts.poppins(
                        fontStyle: FontStyle.normal,
                        fontSize: 16,
                        fontWeight: FontWeight.normal),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderSide: BorderSide(
                              width: 0.0, style: BorderStyle.none),
                          borderRadius: BorderRadius.circular(4)),
                    ),
                  ),
                  SizedBox(
                    height: 80,
                  ),
                  Center(
                    child: SubmitButton(
                      title: "Reset",
                      onPressed: () {},
                      isEnabled: true,
                      textColor: Colors.white,
                    ),
                  ),
                  SizedBox(
                    height: 31,
                  ),
                ],
              ))
        ],
      ),
    );
  }
}
