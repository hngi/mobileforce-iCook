import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:icook_mobile/ui/profile_screen/constant.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ForgotPasswordScreen extends StatelessWidget {

  //forgot_password_icon

  @override
  Widget build(BuildContext context) {

    ScreenUtil.init(context,
        height: double.infinity, width: 375, allowFontScaling: true);

    return Scaffold(
      appBar: AppBar(
        title: Text("Forgot Password",
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
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Column(

                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,

                  children: <Widget>[

                    SizedBox(
                      height: 34,
                    ),

                    Center(
                      child: Container(
                        width:kSpacingUnit.w * 104 ,
                        height: 136,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                fit: BoxFit.contain,
                                image: AssetImage("assets/images/forgot_password_icon.png")
                            )
                        ),
                      ),
                    ),

                    SizedBox(
                      height: 30,
                    ),

                    Text("Please enter below your email address to reset password.",

                      style: GoogleFonts.poppins(
                          fontStyle: FontStyle.normal,
                          fontSize: 16,
                          fontWeight: FontWeight.normal
                      ),
                    ),

                    SizedBox(
                      height: 30,
                    ),

                    Text("Email address",
                      style: GoogleFonts.poppins(
                          fontStyle: FontStyle.normal,
                          fontSize: 16,
                          fontWeight: FontWeight.normal
                      ),
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
                      child: Container(
                        height: 45,
                        width: kSpacingUnit.w * 16.3,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(7),
                          color: Color(0xff578DDE),
                        ),
                        child: GestureDetector(
                          onTap: (){},
                          child: Center(
                            child: Text("Reset",
                              style: GoogleFonts.poppins(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500,
                                  fontStyle: FontStyle.normal

                              ),
                            ),
                          ),
                        ),
                      ),
                    ),


                    SizedBox(
                      height: 31,
                    ),

                  ],
                ),

                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Center(
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                       children: <Widget>[
                         Text("Don’t have an account?",
                           style: GoogleFonts.montserrat(
                               fontStyle: FontStyle.normal,
                               fontSize: 16,
                               fontWeight: FontWeight.normal
                           ),
                         ),

                         Padding(
                           padding: EdgeInsets.only(
                             left: 10,
                             right: 12
                           ),
                           child: GestureDetector(
                             onTap: (){},
                             child:   Text("SIGN UP",
                               style: GoogleFonts.montserrat(
                                   fontStyle: FontStyle.normal,
                                   fontSize: 16,
                                   fontWeight: FontWeight.w600
                               ),
                             ),
                           ),
                         )
                       ],
                      ),
                    )
                  ],
                )

              ],
            )
          )
        ],
      ),
    );
  }
}
