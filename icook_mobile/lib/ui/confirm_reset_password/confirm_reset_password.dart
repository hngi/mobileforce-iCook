import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:icook_mobile/ui/confirm_reset_password/confirmpassmodel.dart';
import 'package:icook_mobile/ui/shared/resetButton.dart';
import 'package:icook_mobile/ui/shared/state_responsive.dart';
import 'package:icook_mobile/ui/signup_screen/signup_screen.dart';
import 'package:icook_mobile/ui/signup_screen/signupmodel.dart';
import 'package:icook_mobile/ui/ui_helper.dart';
import 'package:stacked/stacked.dart';

class ConfirmResetPasswordScreen extends StatelessWidget {
  final _views = [ConfirmToken(), NewPassword()];
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context,
        height: double.infinity, width: 375, allowFontScaling: true);

    return ViewModelBuilder<ConfirmResetPasswordModel>.reactive(
      viewModelBuilder: () => ConfirmResetPasswordModel(),
      builder: (context, model, child) => Scaffold(
        key: model.scaffoldKey,
        appBar: AppBar(
            title: Text(
          "Reset Password",
        )),
        body: Center(
          child: Container(
            constraints: BoxConstraints(maxWidth: 600),
            child: PageView.builder(
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) => _views[model.index],
              itemCount: _views.length,
            ),
          ),
        ),
      ),
    );
  }
}

class ConfirmToken extends ViewModelWidget<ConfirmResetPasswordModel> {
  const ConfirmToken({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, ConfirmResetPasswordModel model) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        SizedBox(
          height: 34,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: Form(
            key: model.formkey,
            child: Column(
              children: <Widget>[
                Text(
                    'Please enter below the  unique code sent to your registered email',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                        fontSize: 14, fontWeight: FontWeight.normal)),
                SizedBox(height: 22),
                Container(
                  child: TextFormField(
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(hintText: 'Enter Token'),
                    validator: (value) => value.isEmpty ? "enter token" : null,
                  ),
                ),
                SizedBox(height: 56),
                StateResponsive(
                    state: model.state,
                    busyWidget: Center(
                      child: CircularProgressIndicator(),
                    ),
                    idleWidget: Center(
                        child: ResetButton(
                      title: 'Confirm',
                      onPressed: () {
                        FocusScope.of(context).unfocus();
                        model.changeTab(1);
                      },
                      textColor: Colors.white,
                      isEnabled: true,
                    ))),
                SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: Text('Re-enter email',
                          style: GoogleFonts.poppins(
                              color: Constants.kbuttonColor1,
                              fontSize: 18,
                              fontWeight: FontWeight.w600)),
                    )
                  ],
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}

class NewPassword extends ViewModelWidget<ConfirmResetPasswordModel> {
  const NewPassword({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, ConfirmResetPasswordModel model) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        SizedBox(
          height: 34,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: Form(
            key: model.formkey2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  "New password",
                  textAlign: TextAlign.left,
                ),
                SizedBox(
                  height: 15,
                ),
                PasswordField(
                  passwordType: PasswordType.password,
                  validator: (value) =>
                      model.validatePassword(model.password.text),
                  controller: model.password,
                ),
                SizedBox(
                  height: 15,
                ),
                Text("Confirm password"),
                SizedBox(height: 8),
                Container(
                  child: PasswordField(
                    passwordType: PasswordType.confirmPassword,
                    controller: model.confirmPassword,
                    validator: (value) => model.validateConfirmPassword(
                        model.password.text, model.confirmPassword.text),
                  ),
                ),
                SizedBox(height: 56),
                StateResponsive(
                    state: model.state,
                    busyWidget: Center(
                      child: CircularProgressIndicator(),
                    ),
                    idleWidget: Center(
                        child: ResetButton(
                      title: 'Confirm',
                      onPressed: () {
                        FocusScope.of(context).unfocus();
                        model.changeTab(0);
                      },
                      textColor: Colors.white,
                      isEnabled: true,
                    ))),
                SizedBox(height: 16),
              ],
            ),
          ),
        )
      ],
    );
  }
}
