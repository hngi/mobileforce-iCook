import 'package:flutter/material.dart';
import 'package:icook_mobile/core/constants/view_state.dart';
import 'package:icook_mobile/core/exceptions/network_exception.dart';
import 'package:icook_mobile/core/mixins/validators.dart';
import 'package:icook_mobile/core/services/Auth_service/auth_service.dart';
import 'package:icook_mobile/core/services/key_storage/key_storage_service.dart';
import 'package:icook_mobile/locator.dart';
import 'package:icook_mobile/models/requests/Auth/updatepassword.dart';
import 'package:icook_mobile/ui/base_view_model.dart';
import 'package:stacked_services/stacked_services.dart';

class SettingsModel extends BaseNotifier with Validators {
  final auth = locator<AuthService>();

  StateSetter myState;

  final navigation = locator<NavigationService>();
  final key = locator<KeyStorageService>();

  final scaffoldKey = new GlobalKey<ScaffoldState>();
  final formKey = GlobalKey<FormState>();

  final name = TextEditingController();
  final email = TextEditingController();

  //password
  final oldPassword = TextEditingController();
  final newPassword = TextEditingController();
  final confirmNewPassword = TextEditingController();

  String responseMessage = "";

  Future<void> init() async {
    fetchLocalStorage();
  }

  void fetchLocalStorage() {
    name.text = key.name;
    email.text = key.email;
  }

  void changePassword() async {
    if (!formKey.currentState.validate()) return;
    setState(ViewState.Busy);
    myState(() {});
    var request = UpdatePasswordRequest(
      currentPassword: oldPassword.text,
      newPassword: newPassword.text.trim(),
    );
    var response;
    try {
      response = await auth.updatePassword(request);
      responseMessage = response["message"];
      if (response["status"] == "fail") {
        setState(ViewState.Error);
      } else {
        print("Old Token is ${key.token}");

        responseMessage = "Password Changed Successfully";
        key.token = response["token"];
        oldPassword.clear();
        newPassword.clear();
        confirmNewPassword.clear();
        setState(ViewState.Success);
        print("New Token is ${key.token}");
      }
    } catch (e) {

      responseMessage = e.toString();
      if(e is NetworkException){
        responseMessage = e.message;
      }

      setState(ViewState.Error);
    }

    myState(() {
      
    });
  }
}
