import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';

import 'package:google_fonts/google_fonts.dart';

import 'package:icook_mobile/core/constants/view_routes.dart';

import 'package:icook_mobile/core/constants/view_state.dart';
import 'package:icook_mobile/core/datasources/remotedata_source/DIsh/dishdatasource.dart';
import 'package:icook_mobile/core/services/key_storage/key_storage_service.dart';
import 'package:icook_mobile/models/response/Dish/dishitem.dart';
import 'package:icook_mobile/models/response/Dish/dishresponse.dart';
import 'package:icook_mobile/ui/base_view_model.dart';
import 'package:icook_mobile/ui/ui_helper.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../locator.dart';

class HomeScreenModel extends BaseNotifier {
  final navigation = locator<NavigationService>();
  final data = locator<DishDataSource>();
  final key = locator<KeyStorageService>();

  String afterKey = "";

  final easycontroller = EasyRefreshController();

  String getFirstWord(String text) {
    int index = text.indexOf(' ');

    if (index > -1) {
      // Check if there is more than one word.

      return text.substring(0, index).trim(); // Extract first word.

    } else {
      return text; // Text is the first word itself.
    }
  }

  String get username => getFirstWord(key.name);

  List<Dish> _list = [];

  List<Dish> get list => _list;

  //scaffoldkey
  final scaffoldKey = new GlobalKey<ScaffoldState>();

  void editDetails() {
    navigation.navigateTo(ViewRoutes.edit_profile);
  }

  Future<void> loadData() async {
    setState(ViewState.Busy);

    try {
      var response = await data.getDishes();
      print(response);
      _list.clear();
      _list = response.data.dishes;
      _checkIfAvailableData();
      easycontroller.finishRefresh(success: true);

      // //show
      // final snackbar = SnackBar(content: Text(response.status));
      // scaffoldKey.currentState.showSnackBar(snackbar);
    } catch (e) {
      setState(ViewState.Idle);
      easycontroller.finishRefresh(success: true);
      print('homescreen model exception $e');
      final snackbar = SnackBar(content: Text(e.toString()));
      scaffoldKey.currentState.showSnackBar(snackbar);
    }
  }

  void _checkIfAvailableData() {
    (_list.isEmpty)
        ? setState(ViewState.NoDataAvailable)
        : setState(ViewState.DataFetched);
  }

  ///on initState
  Future<void> init() async {
    setState(ViewState.Busy);
    await loadData();
  }
}
