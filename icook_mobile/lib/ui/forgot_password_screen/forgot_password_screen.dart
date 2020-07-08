import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:icook_mobile/ui/forgot_password_screen/forgot_passwordmodel.dart';
import 'package:icook_mobile/ui/profile_screen/constant.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:icook_mobile/ui/shared/state_responsive.dart';
import 'package:icook_mobile/ui/shared/sumbitButton.dart';
import 'package:icook_mobile/ui/ui_helper.dart';
import 'package:stacked/stacked.dart';

class ForgotPasswordScreen extends StatelessWidget {
  //forgot_password_icon

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ForgotPasswordModel>.reactive(
      viewModelBuilder: () => ForgotPasswordModel(),
      builder: (context, model, child) => Scaffold(
        key: model.scaffoldKey,
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
        body: SingleChildScrollView(
          child: Padding(
              padding: EdgeInsets.only(
                left: 20,
                right: 20,
              ),
              child: Form(
                key: model.formkey,
                child: Center(
                  child: Container(
                    constraints: BoxConstraints(maxWidth: 600),
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
                            width: 100,
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
                        TextFormField(
                          controller: model.email,
                          validator: (value) =>
                              model.validateEmail(model.email.text),
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
                        StateResponsive(
                          state: model.state,
                          busyWidget:
                              Center(child: CircularProgressIndicator()),
                          idleWidget: Center(
                            child: SubmitButton(
                              title: "Reset",
                              onPressed: () => model.sendMail(),
                              isEnabled: true,
                              buttonColor: Constants.kbuttonColor1,
                              textColor: Colors.white,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        GestureDetector(
                          onTap: () => model.gotoConfirmToken(),
                          child: Center(
                            child: Text(
                              "Already have a token?, Continue..",
                              style: GoogleFonts.poppins(
                                  color: Colors.red,
                                  fontStyle: FontStyle.normal,
                                  fontSize: 16,
                                  fontWeight: FontWeight.normal),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 31,
                        ),
                      ],
                    ),
                  ),
                ),
              )),
        ),
      ),
    );
  }
}
