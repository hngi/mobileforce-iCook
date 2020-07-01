import 'package:flutter/material.dart';
import 'package:icook_mobile/core/constants/view_state.dart';
import 'package:icook_mobile/core/datasources/remotedata_source/DIsh/dishdatasource.dart';
import 'package:icook_mobile/core/services/key_storage/key_storage_service.dart';
import 'package:icook_mobile/models/response/Dish/getmydishes.dart';
import 'package:icook_mobile/ui/base_view_model.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../locator.dart';

class HomeScreenModel extends BaseNotifier {
  final navigation = locator<NavigationService>();
  final data = locator<DishDataSource>();
  final key = locator<KeyStorageService>();

  String afterKey = "";

  String get username => key.name;

  List<Dishe> _list;

  List<Dishe> get list => _list;

  //scaffoldkey
  final scaffoldKey = new GlobalKey<ScaffoldState>();

  Future<void> loadData() async {
    setState(ViewState.Busy);

    try {
      var result = await data.getDishes();
      print(result);
      _list = result.data.dishes;
      _checkIfAvailableData();

      //show
      final snackbar = SnackBar(content: Text(result.status));
      scaffoldKey.currentState.showSnackBar(snackbar);
    } catch (e) {
      setState(ViewState.Idle);
      print('homescreen model exception $e');
      final snackbar = SnackBar(content: Text(e));
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
    await loadData();
  }
}
