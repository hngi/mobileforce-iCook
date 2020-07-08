import 'package:flutter/material.dart';
import 'package:icook_mobile/core/mixins/validators.dart';
import 'package:icook_mobile/core/services/Auth_service/auth_service.dart';
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
}
