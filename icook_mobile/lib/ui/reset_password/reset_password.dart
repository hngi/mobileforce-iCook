import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:icook_mobile/ui/profile_screen/constant.dart';
import 'package:icook_mobile/ui/shared/resetButton.dart';
import 'package:icook_mobile/ui/shared/state_responsive.dart';
import 'package:icook_mobile/ui/signup_screen/signupmodel.dart';
import 'package:icook_mobile/ui/ui_helper.dart';
import 'package:stacked/stacked.dart';
import 'package:animated_dialog_box/animated_dialog_box.dart';

class ResetPasswordScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context,
        height: double.infinity, width: 375, allowFontScaling: true);

    return ViewModelBuilder<SignUpModel>.reactive(
      viewModelBuilder: () => SignUpModel(),
      builder: (context, model, child) => Scaffold(
        key: model.scaffoldKey,
        appBar: AppBar(
            title: Text(
          "Reset Password",
        )),
        body: ListView(
          children: <Widget>[
            SizedBox(
              height: 34,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Form(
                key: model.formkey,
                child: FocusScope(
                  node: model.node,
                  child: Column(
                    children: <Widget>[
                      SizedBox(
                        height: 20,
                      ),
                      _buildTitle("Enter New Password"),
                      SizedBox(height: 8),
                      PasswordField(
                        passwordType: PasswordType.password,
                        validator: (value) =>
                            model.validatePassword(model.password.text),
                        controller: model.password,
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      _buildTitle("Confirm password"),
                      SizedBox(height: 8),
                      Container(
                        child: PasswordField(
                          passwordType: PasswordType.confirmPassword,
                          controller: model.confirmPassword,
                          validator: (value) => model.validateConfirmPassword(
                              model.password.text, model.confirmPassword.text),
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          SizedBox(
                            width: kSpacingUnit.w * 1,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 103,
                      ),
                      StateResponsive(
                          state: model.state,
                          busyWidget: Center(
                            child: CircularProgressIndicator(),
                          ),
                          idleWidget: Center(
                              child: ResetButton(
                            title: 'Reset password',
                            onPressed: () async {
                              await animated_dialog_box.showCustomAlertBox(
                                  context: context,
                                  firstButton: 
                                     MaterialButton(
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(5),
                                      ),
                                      color: Constants.kbuttonColor1,
                                      child: Text(
                                        'Continue',style: GoogleFonts.poppins(
                                                  fontSize: 18,
                                                  fontWeight:
                                                      FontWeight.normal)
                                      ),
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                    ),
                                 
                                  yourWidget: Container(
                                    child: Padding(
                                      padding: const EdgeInsets.all(15.0),
                                      child: Column(
                                        children: <Widget>[
                                          Image(
                                            image: AssetImage(
                                                'assets/images/check.png'),
                                          ),
                                          Text('Password Changed Successful',
                                              style: GoogleFonts.poppins(
                                                  fontSize: 16,
                                                  fontWeight:
                                                      FontWeight.normal)),
                                        ],
                                      ),
                                    ),
                                  ));
                              model.signUp();
                              FocusScope.of(context).unfocus();
                            },
                            textColor: Colors.white,
                            isEnabled: true,
                          ))),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildTitle(String title) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          title,
          style: GoogleFonts.poppins(
              fontSize: 16,
              fontStyle: FontStyle.normal,
              fontWeight: FontWeight.w500),
        ),
        SizedBox(
          width: kSpacingUnit.w * 0.5,
        ),
      ],
    );
  }
}

enum PasswordType { password, confirmPassword }

class PasswordField extends StatefulWidget {
  const PasswordField({
    this.passwordType,
    this.validator,
    this.controller,
  });

  final PasswordType passwordType;
  final Function(String) validator;
  final TextEditingController controller;

  @override
  _PasswordFieldState createState() => new _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  bool _obscureText = true;
  bool isVisible = false;
  Color selectedColor = Color(0xffEB5757);
  int currentStep = 0;

  final FocusNode _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(() {
      print("Focus changed");
      setState(() {
        isVisible = _focusNode.hasFocus;
      });
    });
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Focus(
          onFocusChange: (s) {
            if (widget.passwordType != PasswordType.password) {
              setState(() {
                isVisible = false;
              });
            }
          },
          child: TextFormField(
            controller: widget.controller,
            validator: widget.validator,
            onFieldSubmitted: (_) => FocusScope.of(context).unfocus(),
            obscureText: _obscureText,
            decoration: new InputDecoration(
              border: OutlineInputBorder(
                  borderSide: BorderSide(width: 0.0, style: BorderStyle.none),
                  borderRadius: BorderRadius.circular(4)),
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.lightBlue)),
              suffixIcon: new GestureDetector(
                onTap: () {
                  setState(() {
                    _obscureText = !_obscureText;
                  });
                },
                child: new Icon(
                  _obscureText ? Icons.visibility : Icons.visibility_off,
                  color: Color(0xff939090),
                ),
              ),
            ),
          ),
        ),
        SizedBox(
          height: 5,
        ),
        isVisible
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "Password does not match",
                    style: GoogleFonts.poppins(
                        fontSize: 11,
                        color: Color(0xff828282),
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.normal),
                  ),
                ],
              )
            : SizedBox(
                width: 1,
              )
      ],
    );
  }
}
