import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:icook_mobile/ui/profile_screen/constant.dart';
import 'package:icook_mobile/ui/ui_helper.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  String accountme = "Male";

  String selectedGender = 'Male';

  String selectedCountryOption = "+234";

  List<String> genderOptions = ["name", "okay"];

  List<String> countryOptions = ["+234", "+233", "+121"];

//  void setupControllers(){
//    controllers = [
//      nameController,
//      emailController,
//      phoneController,
//      passwordController
//
//    ];
//  }
//
//  void addListeners(){
//
//    controllers.forEach((element) {
//      element.addListener(() {
//
//      });
//    });
//
//  }

  String nameField = "";
  String emailField = "";
  String phoneField = "";
  String passwordField = "";


  bool termsAndAgreementChecked = false;

  bool buttonEnabled = false;



  void checkFields() {
    if (nameField.isEmpty || emailField.isEmpty || phoneField.isEmpty
        || passwordField.isEmpty || !termsAndAgreementChecked) {

      setState(() {
        buttonEnabled  = false;
      });

      return;
    }

    setState(() {
      buttonEnabled  = true;
    });

  }


  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context,
        height: double.infinity, width: 375, allowFontScaling: true);

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
          ),
          onPressed: () {},
        ),
        centerTitle: true,
        title: Text(
          "Create an account",
          style: GoogleFonts.poppins(
              fontSize: 17,
              fontStyle: FontStyle.normal,
              fontWeight: FontWeight.w500),
        ),
      ),
      body: ListView(
        children: <Widget>[
//          TextField(
//
//          ),
//
          SizedBox(
            height: 34,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Form(
              child: Column(
                children: <Widget>[
                  _buildTitle("Name"),
                  SizedBox(height: 8),
                  Container(
                    height: 50,
                    child: TextFormField(
                      onChanged: (s){
                        nameField = s;
                        print(nameField);
                        checkFields();
                      },
                      onTap: () {},
                      autovalidate: true,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderSide:
                            BorderSide(width: 0.0, style: BorderStyle.none),
                            borderRadius: BorderRadius.circular(4)),

                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: <Widget>[
                      Text(
                        "Gender",
                        style: GoogleFonts.poppins(
                            fontSize: 16,
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Container(
                    height: 50,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),

                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: DropdownButton<String>(
                        isExpanded: true,
                        underline: Container(
                          height: 0.0,
                        ),
                        value: selectedGender,
                        icon: Icon(Icons.keyboard_arrow_down),
                        iconSize: 24,
                        elevation: 16,
                        onChanged: (String newValue) {
                          setState(() {
                            selectedGender = newValue;
                          });
                        },
                        items: <String>["Male", "Female"]
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  _buildTitle("Email"),
                  SizedBox(height: 8),
                  Container(
                    height: 50,
                    child: TextFormField(
                      onTap: () {},
                      onChanged: (s){
                        emailField = s;
                        checkFields();
                      },
                      autovalidate: true,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderSide:
                            BorderSide(width: 0.0, style: BorderStyle.none),
                            borderRadius: BorderRadius.circular(4)),

                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  _buildTitle("Phone number"),
                  SizedBox(height: 8),
                  Container(
                    height: 50,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),

                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(
                        left: 8
                      ),
                      child: Row(
                        children: <Widget>[
                          Container(
                            child: DropdownButton<String>(

                              underline: Container(
                                height: 0.0,
                              ),
                              value: selectedCountryOption,
                              icon: Icon(Icons.keyboard_arrow_down),
                              iconSize: 24,
                              elevation: 16,
                              onChanged: (String newValue) {
                                setState(() {
                                  selectedCountryOption = newValue;
                                });
                              },
                              items: countryOptions
                                  .map<DropdownMenuItem<String>>(
                                      (String value) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(value),
                                    );
                                  }).toList(),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              height: 50,
                              child: TextFormField(
                                keyboardType: TextInputType.number,
                                onTap: () {},
                                onChanged: (s){
                                  phoneField = s;
                                  checkFields();
                                },
                                autovalidate: true,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          width: 0.0, style: BorderStyle.none),
                                      borderRadius: BorderRadius.circular(4)),

                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  _buildTitle("Password"),
                  SizedBox(height: 8),
                  Container(
                    child: PasswordField(
                      onChanged: (s) {
                        passwordField = s;
                        checkFields();

                      },
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      CheckBoxField(
                        value: termsAndAgreementChecked,
                        onChanged: (s) {
                          termsAndAgreementChecked = s;
                          checkFields();
                        },
                      ),
                      SizedBox(
                        width: kSpacingUnit.w * 1,
                      ),
                      RichText(
                        text: TextSpan(children: [
                          TextSpan(
                              text: "I agree to the",
                              style: GoogleFonts.montserrat(
                                  fontSize: 14,
                                  fontStyle: FontStyle.normal,
                                  fontWeight: FontWeight.normal)),
                          TextSpan(
                            text: "  ",
                          ),
                          TextSpan(
                              text: "terms and conditions",
                              style: GoogleFonts.montserrat(
                                  fontSize: 14,
                                  color: Colors.lightBlue,
                                  fontStyle: FontStyle.normal,
                                  fontWeight: FontWeight.normal),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  print("Sign in Tapd");
                                }),
                        ]),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 60,
                  ),
                  Center(
                    child: Container(
                      width: kSpacingUnit.w * 33.5,
                      height: 40,
                      decoration: BoxDecoration(
                        color: buttonEnabled ? Color(0xff578DDE) :Color(0xff939090),
                        borderRadius: BorderRadius.circular(7),
                      ),
                      child: Center(
                        child: GestureDetector(
                          child: Text(
                            "Sign Up",
                            style: GoogleFonts.poppins(
                                fontSize: 18,
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                                fontStyle: FontStyle.normal),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Center(
                    child: RichText(
                      text: TextSpan(children: [
                        TextSpan(
                            text: "Already have an account?",
                            style: GoogleFonts.poppins(
                                fontSize: 16,
                                fontStyle: FontStyle.normal,
                                fontWeight: FontWeight.normal)),
                        TextSpan(
                          text: "  ",
                        ),
                        TextSpan(
                            text: "Sign In",
                            style: GoogleFonts.poppins(
                                fontSize: 16,
                                color: Color(0xff558CE2),
                                fontStyle: FontStyle.normal,
                                fontWeight: FontWeight.w600),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                print("Sign in Tapd");
                              }),
                      ]),
                    ),
                  ),
                  SizedBox(
                    height: 59,
                  ),
                ],
              ),
            ),
          )
        ],
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
        Icon(
          Icons.error,
          size: 17,
          color: Color(0xffC4C4C4),
        )
      ],
    );
  }
}

class CheckBoxField extends StatefulWidget {
  bool value;
  var onChanged;

  CheckBoxField({this.value, this.onChanged});

  @override
  _CheckBoxFieldState createState() => _CheckBoxFieldState();
}

class _CheckBoxFieldState extends State<CheckBoxField> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: kSpacingUnit.w * 2.4,
      height: kSpacingUnit.w * 2.4,
      child: Checkbox(

          activeColor: Color(0xff578DDE),
          value: widget.value,
          onChanged: (b) {
            widget.onChanged(b);
            setState(() {
              widget.value = b;
            });
          }),
    );
  }
}

class PasswordField extends StatefulWidget {
  const PasswordField({
    this.onChanged,
  });
  final ValueChanged<String> onChanged;

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
            setState(() {
              isVisible = s;
            });
          },
          child: Container(
            height: 50,
            child: TextFormField(
              obscureText: _obscureText,
              onChanged: (s) {
                widget.onChanged(s);
                setState(() {
                  if (s.length < 5) {
                    currentStep = 20;
                    selectedColor = Color(0xffEB5757);
                  } else if (s.length >= 5 && s.length <= 7) {
                    currentStep = 50;
                    selectedColor = Color(0xffD3B134);
                  } else if (s.length >= 8 && s.length <= 10) {
                    currentStep = 70;
                    selectedColor = Color(0xff4AE930);
                  } else if (s.length >= 11) {
                    currentStep = 100;
                    selectedColor = Color(0xff4AE930);
                  }
                });
              },
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
        ),
        SizedBox(
          height: 5,
        ),
        isVisible
            ? Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              "Password Strength",
              style: GoogleFonts.poppins(
                  fontSize: 11,
                  color: Color(0xff828282),
                  fontStyle: FontStyle.normal,
                  fontWeight: FontWeight.normal),
            ),
            SizedBox(
              height: 3,
            ),
            StepProgressIndicator(
              totalSteps: 100,
              currentStep: currentStep,
              size: 6,
              padding: 0,
              selectedColor: selectedColor,
              unselectedColor: Color(0xffC4C4C4),
              roundedEdges: Radius.circular(10),
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
