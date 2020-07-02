import 'package:flutter/material.dart';
import 'package:icook_mobile/core/mixins/validators.dart';
import 'package:icook_mobile/ui/base_view_model.dart';
import 'package:multi_image_picker/multi_image_picker.dart';

class CreateDishModel extends BaseNotifier with Validators {
  List<String> _ingredients;
  List<String> get ingredients => _ingredients;

  List<String> _images;
  // List<String> get images => _images;

  List<Asset> images = List<Asset>();
  String _error = 'No Error Dectected';

  List<String> _recipes;
  List<String> get recipes => _recipes;

  //scaffoldkey
  final scaffoldKey = new GlobalKey<ScaffoldState>();

  //formkey
  final formkey = GlobalKey<FormState>();

  //Textcontroller
  final title = TextEditingController();
  final healthbenefits = TextEditingController();

  void getImages() async {
    List<Asset> resultList = List<Asset>();
    String error = 'No Error Dectected';

    try {
      resultList = await MultiImagePicker.pickImages(
        maxImages: 4,
        enableCamera: true,
        selectedAssets: images,
        cupertinoOptions: CupertinoOptions(takePhotoIcon: "chat"),
        materialOptions: MaterialOptions(
          actionBarColor: "#abcdef",
          actionBarTitle: "Selected Images",
          allViewTitle: "All Photos",
          useDetailsView: false,
          selectCircleStrokeColor: "#000000",
        ),
      );
    } on Exception catch (e) {
      error = e.toString();
    }

    images = resultList;
    _error = error;

    notifyListeners();
  }
}
