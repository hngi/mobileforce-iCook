import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:icook_mobile/ui/profile_screen/constant.dart';
import 'package:icook_mobile/ui/shared/k_button.dart';
import 'package:icook_mobile/ui/shared/state_responsive.dart';
import 'package:icook_mobile/ui/shared/sumbitButton.dart';
import 'package:icook_mobile/ui/signup_screen/signupmodel.dart';
import 'package:flutter_country_picker/flutter_country_picker.dart';
import 'package:icook_mobile/ui/ui_helper.dart';
import 'package:provider/provider.dart';
import 'package:stacked/stacked.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

class SignUpScreen extends StatelessWidget {
  final List<String> genderOptions = ["name", "okay"];

  final List<String> countryOptions = [
    "+234",
    "+233",
    "+121",
    "+191",
    "+213",
    "+93",
    "+376",
    "+1",
    "+55",
    "+91"
  ];

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SignUpModel>.reactive(
      viewModelBuilder: () => SignUpModel(),
      builder: (context, model, child) => Scaffold(
          key: model.scaffoldKey,
          appBar: AppBar(
              title: Text(
            "Create an account",
          )),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Form(
                key: model.formkey,
                child: FocusScope(
                  node: model.node,
                  child: Center(
                    child: Container(
                      constraints: BoxConstraints(maxWidth: 600),
                      child: Column(
                        children: <Widget>[
                          _buildTitle("Name"),
                          SizedBox(height: 8),
                          TextFormField(
                            textInputAction: TextInputAction.next,
                            keyboardType: TextInputType.text,
                            onEditingComplete: () => model.node.nextFocus(),
                            validator: (value) =>
                                model.validateName(model.name.text),
                            controller: model.name,
                            decoration: InputDecoration(
                              hintText: 'Enter name',
                              border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      width: 0.0, style: BorderStyle.none),
                                  borderRadius: BorderRadius.circular(4)),
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
                                value: model.gender,
                                icon: Icon(Icons.keyboard_arrow_down),
                                iconSize: 24,
                                elevation: 16,
                                onChanged: (s) => model.setGender(s),
                                items: <String>[
                                  "Male",
                                  "Female"
                                ].map<DropdownMenuItem<String>>((String value) {
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
                          TextFormField(
                            textInputAction: TextInputAction.next,
                            keyboardType: TextInputType.text,
                            onEditingComplete: () => model.node.nextFocus(),
                            controller: model.email,
                            validator: (value) =>
                                model.validateEmail(model.email.text),
                            decoration: InputDecoration(
                              hintText: 'Enter email',
                              border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      width: 0.0, style: BorderStyle.none),
                                  borderRadius: BorderRadius.circular(4)),
                            ),
                          ),
                          SizedBox(height: 20),
                          _buildTitle("Phone number"),
                          SizedBox(height: 8),
                          Padding(
                            padding: const EdgeInsets.only(left: 8),
                            child: Row(
                              children: <Widget>[
                                Container(
                                  child: DropdownButton<String>(
                                    underline: Container(
                                      height: 0.0,
                                    ),
                                    value: model.countryCode,
                                    icon: Icon(Icons.keyboard_arrow_down),
                                    iconSize: 24,
                                    elevation: 16,
                                    onChanged: (s) => model.setCountryCode(s),
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
                                  child: TextFormField(
                                    onFieldSubmitted: (_) =>
                                        FocusScope.of(context).nextFocus(),
                                    controller: model.phone,
                                    validator: (value) => model
                                        .validatePhoneNumber(model.phone.text),
                                    keyboardType: TextInputType.number,
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              width: 0.0,
                                              style: BorderStyle.none),
                                          borderRadius:
                                              BorderRadius.circular(4)),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          _buildTitle("Password"),
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
                              validator: (value) =>
                                  model.validateConfirmPassword(
                                      model.password.text,
                                      model.confirmPassword.text),
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
                                value: model.isChecked,
                                onChanged: (s) => model.checkBoxState(s),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              // RichText(
                              //   text: TextSpan(children: [
                              //     TextSpan(
                              //         text: "I agree to the",
                              //         style: GoogleFonts.montserrat(
                              //             fontSize: 14,
                              //             fontStyle: FontStyle.normal,
                              //             fontWeight: FontWeight.normal)),
                              //     TextSpan(
                              //       text: "  ",
                              //     ),
                              //     TextSpan(
                              //         text: "terms and conditions",
                              //         style: GoogleFonts.montserrat(
                              //             fontSize: 14,
                              //             color: Colors.lightBlue,
                              //             fontStyle: FontStyle.normal,
                              //             fontWeight: FontWeight.normal),
                              //         recognizer: TapGestureRecognizer()
                              //           ..onTap = () {
                              //             print("Sign in Tapped");
                              //           }),
                              //   ]),
                              // ),
                            ],
                          ),
                          SizedBox(
                            height: 60,
                          ),
                          StateResponsive(
                              state: model.state,
                              busyWidget: Center(
                                child: CircularProgressIndicator(),
                              ),
                              idleWidget: Center(
                                  child: SubmitButton(
                                buttonColor: Constants.kbuttonColor1,
                                title: 'Sign Up',
                                onPressed: () {
                                  model.signUp();
                                  FocusScope.of(context).unfocus();
                                },
                                textColor: Colors.white,
                                isEnabled: model.isChecked,
                              ))),
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
                                        model.login();
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
                  ),
                ),
              ),
            ),
          )),
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
          width: 10.5,
        ),
        Tooltip(
          message: 'Put it on',
          child: Icon(
            Icons.error,
            size: 17,
            color: Color(0xffC4C4C4),
          ),
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
      width: 10.4,
      height: 10.4,
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
            onChanged: (s) {
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
              hintText: "Enter password",
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

// class CountryCode extends StatefulWidget {
//   CountryCode({Key key}) : super(key: key);

//   @override
//   _CountryCodeState createState() => new _CountryCodeState();
// }

// class _CountryCodeState extends State<CountryCode> {
//   Country _selected;

//   @override
//   Widget build(BuildContext context) {
//     return new Scaffold(
//       appBar: new AppBar(),
//       body: new Center(
//         child: CountryPicker(
//           showDialingCode: true,
//           onChanged: (Country country) {
//             setState(() {
//               _selected = country;
//             });
//           },
//           selectedCountry: _selected,
//         ),
//       ),
//     );
//   }
// }
