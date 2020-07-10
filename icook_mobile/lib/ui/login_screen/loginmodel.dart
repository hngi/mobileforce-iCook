import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:icook_mobile/core/constants/view_routes.dart';
import 'package:icook_mobile/core/constants/view_state.dart';
import 'package:icook_mobile/core/mixins/validators.dart';
import 'package:icook_mobile/core/services/Auth_service/auth_service.dart';
import 'package:icook_mobile/core/services/key_storage/key_storage_service.dart';
import 'package:icook_mobile/models/requests/Auth/fb_google.dart';
import 'package:icook_mobile/models/requests/login.dart';
import 'package:icook_mobile/ui/base_view_model.dart';
import 'package:stacked_services/stacked_services.dart';
import '../../locator.dart';

class LoginModel extends BaseNotifier with Validators {
  final navigation = locator<NavigationService>();
  final auth = locator<AuthService>();
  final key = locator<KeyStorageService>();

  //scaffoldkey
  final scaffoldKey = new GlobalKey<ScaffoldState>();

  //formkey
  final formkey = GlobalKey<FormState>();
  final node = FocusScopeNode();

  //textcontrolers
  final password = TextEditingController();
  final email = TextEditingController();

  GoogleSignIn _googleSignIn = GoogleSignIn(
    scopes: <String>[
      'email',
      'profile',
      'https://www.googleapis.com/auth/contacts.readonly'
    ],
  );

  void login() async {
    if (!formkey.currentState.validate()) return;

    final request = LoginRequest(email: email.text, password: password.text);
    print(request);
    setState(ViewState.Busy);

    try {
      var user = await auth.login(request);
      print(user);
      setState(ViewState.Idle);

      key.name = user.data?.userName;
      key.email = user.data?.email;
      key.token = user.data?.token;
      key.id = user.data?.userID;
      key.isLoggedIn = true;

      navigation.pushNamedAndRemoveUntil(ViewRoutes.home);
    } catch (e) {
      setState(ViewState.Idle);
      print('login model exception $e');
      final snackbar = SnackBar(content: Text(e.toString()));
      scaffoldKey.currentState.showSnackBar(snackbar);
    }
  }

  Future<void> handleSignIn() async {
    try {
      final result = await _googleSignIn.signIn();

      print('email ${result.email}');
      final key = await result.authentication;

      print('keyeyyyyyyyyyy ${key.accessToken}');
      if (key.accessToken.isNotEmpty) {
        setState(ViewState.Busy);
        final google = await auth
            .googleAuth(FbGoogleRequest(access_token: key.accessToken));
        print(google);
        navigation.pushNamedAndRemoveUntil(ViewRoutes.home);
      }
    } catch (e) {
      setState(ViewState.Idle);
      await _googleSignIn.disconnect();
      print('login model exception $e');
      final snackbar = SnackBar(content: Text(e.toString()));
      scaffoldKey.currentState.showSnackBar(snackbar);
    }
  }

  void signUp() {
    navigation.pushNamedAndRemoveUntil(ViewRoutes.signup);
  }

  void forgotPassword() {
    navigation.navigateTo(ViewRoutes.forogotpassword);
  }

  // Future<void> loginwithfacebook() async {
  //   final facebookLogin = FacebookLogin();
  //   final fb = await facebookLogin.logIn(['email']);

  //   final request = FbGoogleRequest(access_token: fb.accessToken.token);

  //   switch (fb.status) {
  //     case FacebookLoginStatus.loggedIn:
  //       try {
  //         var user = await auth.facebookAuth(request);
  //         print(user);
  //         setState(ViewState.Idle);

  //         key.name = user.data?.userName;
  //         key.email = user.data?.email;
  //         key.token = user.data?.token;
  //         key.id = user.data?.userID;
  //         key.isLoggedIn = true;

  //         navigation.pushNamedAndRemoveUntil(ViewRoutes.home);
  //       } catch (e) {
  //         setState(ViewState.Idle);
  //         print('login model exception $e');
  //       }

  //       break;
  //     case FacebookLoginStatus.cancelledByUser:
  //       final snackbar = SnackBar(content: Text('Cancelled'));
  //       scaffoldKey.currentState.showSnackBar(snackbar);
  //       break;
  //     case FacebookLoginStatus.error:
  //       final snackbar = SnackBar(content: Text('error in login user'));
  //       scaffoldKey.currentState.showSnackBar(snackbar);
  //       break;
  //   }
  // }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    node.dispose();
  }
}
