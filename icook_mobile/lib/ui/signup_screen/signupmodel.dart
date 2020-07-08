import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:icook_mobile/core/constants/view_routes.dart';
import 'package:icook_mobile/core/constants/view_state.dart';
import 'package:icook_mobile/core/mixins/validators.dart';
import 'package:icook_mobile/core/services/Auth_service/auth_service.dart';
import 'package:icook_mobile/core/services/key_storage/key_storage_service.dart';
import 'package:icook_mobile/models/requests/Auth/fb_google.dart';
import 'package:icook_mobile/models/requests/signup.dart';
import 'package:icook_mobile/ui/base_view_model.dart';
import 'package:stacked_services/stacked_services.dart';
import '../../locator.dart';

class SignUpModel extends BaseNotifier with Validators {
  final navigation = locator<NavigationService>();
  final auth = locator<AuthService>();
  final snack = locator<SnackbarService>();
  final key = locator<KeyStorageService>();

  final scaffoldKey = new GlobalKey<ScaffoldState>();

  GoogleSignIn _googleSignIn = GoogleSignIn(
    scopes: <String>[
      'email',
      'https://www.googleapis.com/auth/contacts.readonly',
    ],
  );

  //Country Code
  String _countryCode = "+234";
  String get countryCode => _countryCode;

  void setCountryCode(String code) {
    print(code);
    _countryCode = code;
    notifyListeners();
  }

  //ButtonState
  bool _buttonEnabled = false;
  bool get buttonEnabled => _buttonEnabled;

  // TermsandAgreement CheckBox
  bool _isChecked = false;
  bool get isChecked => _isChecked;

  void checkBoxState(bool value) {
    print(value);
    _isChecked = value;
    notifyListeners();
  }

  //formkey
  final formkey = GlobalKey<FormState>();
  final node = FocusScopeNode();

  //textcontrolers
  final name = TextEditingController();
  final email = TextEditingController();
  final phone = TextEditingController();
  final password = TextEditingController();
  final confirmPassword = TextEditingController();

  //TextField Values
  String _gender = 'Male';
  String get gender => _gender;

  void signUp() async {
    if (!formkey.currentState.validate()) return;

    String phoneNumber = '$countryCode${phone.text}';

    final request = SignUpRequest(
        name: name.text,
        email: email.text,
        gender: gender.toLowerCase(),
        phone: phoneNumber,
        password: password.text);

    print(request);

    setState(ViewState.Busy);

    try {
      var user = await auth.signUp(request);
      print(user);
      setState(ViewState.Idle);

      key.name = user.data?.name;
      key.email = user.data?.email;
      key.token = user.data?.token;
      key.id = user.data?.userID;
      key.isLoggedIn = true;
      navigation.pushNamedAndRemoveUntil(ViewRoutes.home);
    } catch (e) {
      setState(ViewState.Idle);
      print('signup model exception $e');
      final snackbar = SnackBar(content: Text(e));
      scaffoldKey.currentState.showSnackBar(snackbar);
    }
  }

  Future<void> handleSignIn() async {
    try {
      final result = await _googleSignIn.signIn();
      print('email ${result.email}');
      final key = await result.authentication;
      if (key.accessToken != null) {
        final google = await auth
            .googleAuth(FbGoogleRequest(access_token: key.accessToken));
        print(google);
        navigation.pushNamedAndRemoveUntil(ViewRoutes.home);
      }

      print(key.accessToken);
    } catch (error) {
      print(error);
    }
  }

  void login() {
    navigation.pushNamedAndRemoveUntil(ViewRoutes.login);
  }

  setGender(String s) {
    _gender = s;
    notifyListeners();
  }
}
