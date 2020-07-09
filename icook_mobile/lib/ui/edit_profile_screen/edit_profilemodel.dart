import 'dart:io';

import 'package:flutter/material.dart';
import 'package:icook_mobile/core/constants/api_routes.dart';
import 'package:icook_mobile/core/constants/view_state.dart';
import 'package:icook_mobile/core/mixins/validators.dart';
import 'package:icook_mobile/core/services/Api/ApiService.dart';
import 'package:icook_mobile/core/services/key_storage/key_storage_service.dart';
import 'package:icook_mobile/ui/base_view_model.dart';
import 'package:image_picker/image_picker.dart';

import '../../locator.dart';

class EditProfileModel extends BaseNotifier with Validators {
  final key = locator<KeyStorageService>();
  //formkey
  final formkey = GlobalKey<FormState>();
  final node = FocusScopeNode();

  String imageUrl = "";

  //textcontrolers
  final name = TextEditingController();
  final email = TextEditingController();
  final phone = TextEditingController();
  final password = TextEditingController();
  final bio = TextEditingController();

  //scaffoldkey
  final scaffoldKey = new GlobalKey<ScaffoldState>();

  void init() {
    name.text = key.name;
    email.text = key.email;
    imageUrl = key.profileImageUrl;
  }

  PickedFile file;
  final ImagePicker _picker = ImagePicker();
  List<File> files = [];
  String url = '';

  final api = locator<ApiService>();

  Future<void> chooseImage() async {
    final pickedFile = await _picker.getImage(
      source: ImageSource.gallery,
      maxWidth: 100,
      maxHeight: 100,
      imageQuality: 100,
    );

    print(pickedFile.path);
    files.add(File(pickedFile.path));
    print(files);

    setState(ViewState.Busy);

    final body = <String, dynamic>{};

    if (files.length > 0) {
      try {
        final response =
            api.postHttpForm(ApiRoutes.uploadprofile, body, files, "photo");

        print(response);
      } catch (e) {
        setState(ViewState.Idle);
        print('image upload exception $e');
        final snackbar = SnackBar(content: Text(e.toString()));
        scaffoldKey.currentState.showSnackBar(snackbar);
      }
    }

    // try {
    //   final token = key.token ?? "";
    //   final headers = <String, String>{
    //     "Content-Type": "application/x-www-form-urlencoded",
    //     "Authorization": "$token"
    //   };

    //   final response = api.profilePic(
    //       ApiRoutes.uploadprofile, '', File(pickedFile.path), headers);
    //   print(response);
    // } catch (e) {
    //   setState(ViewState.Idle);
    //   print('image upload exception $e');
    //   final snackbar = SnackBar(content: Text(e.toString()));
    //   scaffoldKey.currentState.showSnackBar(snackbar);
    // }
  }
}
