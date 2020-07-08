import 'package:flutter/material.dart';
import 'package:icook_mobile/core/constants/view_routes.dart';
import 'package:icook_mobile/core/constants/view_state.dart';
import 'package:icook_mobile/core/mixins/validators.dart';
import 'package:icook_mobile/core/services/Auth_service/auth_service.dart';
import 'package:icook_mobile/models/requests/Auth/forgotpassword.dart';
import 'package:icook_mobile/ui/base_view_model.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../locator.dart';

class ForgotPasswordModel extends BaseNotifier with Validators {
  final navigation = locator<NavigationService>();
  final auth = locator<AuthService>();

  //scaffoldkey
  final scaffoldKey = new GlobalKey<ScaffoldState>();

  //formkey
  final formkey = GlobalKey<FormState>();
  final node = FocusScopeNode();

  //textcontrolers
  final password = TextEditingController();
  final email = TextEditingController();

  void sendMail() async {
    if (!formkey.currentState.validate()) return;

    final request = ForgotPassRequest(email: email.text);
    print(request);
    setState(ViewState.Busy);

    try {
      var res = await auth.forgotPassword(request);
      print(res);
      setState(ViewState.Idle);

      var status = res['status'];
      if (status == "success") {
        gotoConfirmToken();
      }
    } catch (e) {
      setState(ViewState.Idle);
      print('login  exception $e');
      final snackbar = SnackBar(content: Text(e.toString()));
      scaffoldKey.currentState.showSnackBar(snackbar);
    }
  }

  void gotoConfirmToken() {
    navigation.navigateTo(ViewRoutes.confirmtoken);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    node.dispose();
  }
}
