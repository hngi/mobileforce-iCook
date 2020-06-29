import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:icook_mobile/core/constants/view_state.dart';
import 'package:icook_mobile/ui/edit_profile_screen/edit_profile.dart';
import 'package:icook_mobile/ui/login_screen/loginmodel.dart';
import 'package:icook_mobile/ui/shared/state_responsive.dart';
import 'package:icook_mobile/ui/shared/sumbitButton.dart';
import 'package:image_picker/image_picker.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:stacked/stacked.dart';

import '../profile_screen/constant.dart';
import '../ui_helper.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    bool _showPassword = false;

    ScreenUtil.init(context, height: 896, width: 414, allowFontScaling: true);

    return ViewModelBuilder<LoginModel>.reactive(
      viewModelBuilder: () => LoginModel(),
      builder: (contex, model, child) => Scaffold(
        key: model.scaffoldKey,
        appBar: AppBar(
          title: Text("Login"),
          actions: <Widget>[],
        ),
        body: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
            new TextEditingController().clear();
          },
          child: Padding(
            padding: const EdgeInsets.only(top: 5.0),
            child: SingleChildScrollView(
              child: Form(
                key: model.formkey,
                child: Column(
                  children: [
                    SizedBox(height: kSpacingUnit.w * 2),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          alignment: Alignment.center,
                          child: Image(
                            image: AssetImage('assets/images/logo.png'),
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Text(
                            'Email Address',
                            style: GoogleFonts.poppins(
                                textStyle: TextStyle(fontSize: 16),
                                fontWeight: FontWeight.normal),
                          ),
                        ),
                        SizedBox(height: kSpacingUnit.w * 0.5),
                        Container(
                          padding: EdgeInsets.only(left: 20, right: 20),
                          child: TextFormField(
                            controller: model.email,
                            validator: (_) =>
                                model.validateEmail(model.email.text),
                            textInputAction: TextInputAction.next,
                            onEditingComplete: () =>
                                FocusScope.of(context).nextFocus(),
                            keyboardType: TextInputType.text,
                            style:
                                TextStyle(fontSize: 18, fontFamily: "Poppins"),
                            cursorColor: Color(0XFFF898989),
                            decoration: InputDecoration(
                              hintText: "Enter Address",
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Expanded(
                                child: Text(
                                  'Password',
                                  style: GoogleFonts.poppins(
                                      textStyle: TextStyle(fontSize: 16),
                                      fontWeight: FontWeight.normal),
                                ),
                              ),
                              Text(
                                'Forget password? ',
                                style: GoogleFonts.poppins(
                                    textStyle: TextStyle(
                                        color: Color(0xff578DDE), fontSize: 14),
                                    fontWeight: FontWeight.normal),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: kSpacingUnit.w * 0.5),
                        Container(
                          padding: EdgeInsets.only(left: 20, right: 20),
                          child: TextFormField(
                            controller: model.password,
                            obscureText: !_showPassword,
                            textInputAction: TextInputAction.done,
                            onFieldSubmitted: (_) =>
                                FocusScope.of(context).dispose(),
                            keyboardType: TextInputType.text,
                            style:
                                TextStyle(fontSize: 18, fontFamily: "Poppins"),
                            cursorColor: Color(0XFFF898989),
                            decoration: InputDecoration(
                              suffixIcon: GestureDetector(
                                onTap: () {},
                                child: Icon(
                                  _showPassword
                                      ? Icons.visibility
                                      : Icons.visibility,
                                  color: Colors.blueGrey,
                                ),
                              ),
                              hintText: "Enter Password",
                            ),
                          ),
                        ),
                        SizedBox(height: 50),
                        Container(
                          padding: EdgeInsets.only(left: 20, right: 20),
                          child: StateResponsive(
                              state: model.state,
                              busyWidget: Center(
                                child: CircularProgressIndicator(),
                              ),
                              idleWidget: Center(
                                  child: SubmitButton(
                                title: 'Log in',
                                onPressed: () {
                                  model.login();
                                  FocusScope.of(context).unfocus();
                                },
                                textColor: Colors.white,
                                isEnabled: true,
                              ))),
                        ),
                        SizedBox(
                          height: 40,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Image.asset('assets/images/Line.png'),
                            SizedBox(width: 10),
                            Text(
                              'OR',
                              style: GoogleFonts.poppins(
                                  textStyle: TextStyle(
                                    fontSize: 16,
                                  ),
                                  fontWeight: FontWeight.w500),
                            ),
                            SizedBox(width: 10),
                            Image.asset('assets/images/Line.png'),
                          ],
                        ),
                        SizedBox(height: 40),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Container(
                              width: 235,
                              height: 35,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  border: Border.all(
                                    color: Color(0xfff4f4f4),
                                    width: 1,
                                  )),
                              child: Material(
                                color: Color(0xffFDFDFD),
                                child: MaterialButton(
                                  onPressed: () {},
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: <Widget>[
                                      Image.asset('assets/images/Google.png'),
                                      SizedBox(
                                        width: 7.09,
                                      ),
                                      Text(
                                        "Continue with Google",
                                        style: GoogleFonts.poppins(
                                            textStyle: TextStyle(
                                                letterSpacing: -0.005,
                                                color: Colors.black,
                                                fontSize: 16),
                                            fontWeight: FontWeight.normal),
                                        textAlign: TextAlign.center,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(width: 20),
                            Image.asset(
                              'assets/images/facebook.png',
                              scale: 4.4,
                            ),
                          ],
                        ),
                        SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              ' Don\'t have an account?',
                              style: GoogleFonts.poppins(
                                  textStyle: TextStyle(
                                      color: Color(0xff939090), fontSize: 16),
                                  fontWeight: FontWeight.normal),
                            ),
                            SizedBox(width: 4),
                            GestureDetector(
                              onTap: () => model.signUp(),
                              child: Text(
                                'Sign Up',
                                style: GoogleFonts.poppins(
                                    textStyle: TextStyle(
                                        color: Color(0xff578DDE), fontSize: 16),
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 30),
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

  void setState(Null Function() param0) {}
}
