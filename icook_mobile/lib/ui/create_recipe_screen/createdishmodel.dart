import 'package:flutter/material.dart';
import 'package:icook_mobile/core/mixins/validators.dart';
import 'package:icook_mobile/ui/base_view_model.dart';

class CreateDishModel extends BaseNotifier with Validators {
  List<String> _ingredients;
  List<String> get ingredients => _ingredients;

  List<String> _images;
  List<String> get images => _images;

  List<String> _recipes;
  List<String> get recipes => _recipes;

  //scaffoldkey
  final scaffoldKey = new GlobalKey<ScaffoldState>();

  //formkey
  final formkey = GlobalKey<FormState>();

  //Textcontroller
  final title = TextEditingController();
  final healthbenefits = TextEditingController();
}
