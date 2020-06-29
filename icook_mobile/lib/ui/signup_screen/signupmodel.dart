import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:icook_mobile/core/constants/view_routes.dart';
import 'package:icook_mobile/core/constants/view_state.dart';
import 'package:icook_mobile/core/mixins/validators.dart';
import 'package:icook_mobile/core/services/Auth_service/auth_service.dart';
import 'package:icook_mobile/models/requests/signup.dart';
import 'package:icook_mobile/ui/base_view_model.dart';
import 'package:stacked_services/stacked_services.dart';
import '../../locator.dart';

class SignUpModel extends BaseNotifier with Validators {
  final navigation = locator<NavigationService>();
  final auth = locator<AuthService>();
  final snack = locator<SnackbarService>();

  final scaffoldKey = new GlobalKey<ScaffoldState>();

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
      final snackbar = SnackBar(content: Text(user.message));
      scaffoldKey.currentState.showSnackBar(snackbar);
    } catch (e) {
      setState(ViewState.Idle);
      print('signup model exception $e');
      final snackbar = SnackBar(content: Text(e));
      scaffoldKey.currentState.showSnackBar(snackbar);
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
