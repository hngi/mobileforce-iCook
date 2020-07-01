import 'package:flutter/material.dart';
import 'package:icook_mobile/core/constants/view_routes.dart';
import 'package:icook_mobile/core/constants/view_state.dart';
import 'package:icook_mobile/core/mixins/validators.dart';
import 'package:icook_mobile/core/services/Auth_service/auth_service.dart';
import 'package:icook_mobile/models/requests/login.dart';
import 'package:icook_mobile/ui/base_view_model.dart';
import 'package:stacked_services/stacked_services.dart';
import '../../locator.dart';

class LoginModel extends BaseNotifier with Validators {
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

  void login() async {
    if (!formkey.currentState.validate()) return;

    final request = LoginRequest(email: email.text, password: password.text);
    print(request);
    setState(ViewState.Busy);

    try {
      var user = await auth.login(request);
      print(user);
      setState(ViewState.Idle);
      final snackbar = SnackBar(content: Text(user.status));
      scaffoldKey.currentState.showSnackBar(snackbar);
      navigation.pushNamedAndRemoveUntil(ViewRoutes.home);
    } catch (e) {
      setState(ViewState.Idle);
      print('login model exception $e');
      final snackbar = SnackBar(content: Text(e));
      scaffoldKey.currentState.showSnackBar(snackbar);
    }
  }

  void signUp() {
    navigation.pushNamedAndRemoveUntil(ViewRoutes.signup);
  }

  void forgotPassword() {
    navigation.navigateTo(ViewRoutes.forogotpassword);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    node.dispose();
  }
}
