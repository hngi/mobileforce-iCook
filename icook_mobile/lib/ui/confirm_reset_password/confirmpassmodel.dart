import 'package:flutter/material.dart';
import 'package:icook_mobile/core/constants/view_routes.dart';
import 'package:icook_mobile/core/constants/view_state.dart';
import 'package:icook_mobile/core/mixins/validators.dart';
import 'package:icook_mobile/core/services/Auth_service/auth_service.dart';
import 'package:icook_mobile/models/requests/Auth/resetpassword.dart';
import 'package:icook_mobile/ui/base_view_model.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../locator.dart';

class ConfirmResetPasswordModel extends BaseNotifier with Validators {
  final navigation = locator<NavigationService>();
  final auth = locator<AuthService>();

  //scaffoldkey
  final scaffoldKey = new GlobalKey<ScaffoldState>();

  //formkey
  final formkey = GlobalKey<FormState>();
  final formkey2 = GlobalKey<FormState>();
  final node = FocusScopeNode();

  //textcontrolers
  final email = TextEditingController();
  final token = TextEditingController();
  final password = TextEditingController();
  final confirmPassword = TextEditingController();

  int _index = 0;
  int get index => _index;

  //method to change the index of the pageviews with notifylisteners
  void changeTab(int newIndex) {
    _index = newIndex;
    notifyListeners();
  }

  void sendToken() async {
    if (!formkey.currentState.validate()) return;

    print(token.text);
    setState(ViewState.Busy);

    try {
      var res = await auth.confirmtoken(token.text);
      print(res);
      setState(ViewState.Idle);

      var status = res['status'];
      if (status == "successful") {
        changeTab(1);
        token.clear();
      }
    } catch (e) {
      setState(ViewState.Idle);
      print('token  exception $e');
      final snackbar = SnackBar(content: Text(e.toString()));
      scaffoldKey.currentState.showSnackBar(snackbar);
    }
  }

  void sendNewPassword() async {
    if (!formkey2.currentState.validate()) return;

    print(email.text);
    print(password.text);
    setState(ViewState.Busy);

    try {
      var res = await auth.resetPasswordWithEmail(
          ResetPasswordRequest(email: email.text, password: password.text));
      print(res);
      setState(ViewState.Idle);

      var status = res['status'];
      if (status == "successful") {
        email.clear();
        password.clear();
        confirmPassword.clear();
        navigation.pushNamedAndRemoveUntil(ViewRoutes.login);
      }
    } catch (e) {
      setState(ViewState.Idle);
      print('token  exception $e');
      final snackbar = SnackBar(content: Text(e.toString()));
      scaffoldKey.currentState.showSnackBar(snackbar);
    }
  }
}
