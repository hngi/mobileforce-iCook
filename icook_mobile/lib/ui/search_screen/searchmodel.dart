import 'package:flutter/material.dart';
import 'package:icook_mobile/core/constants/view_state.dart';
import 'package:icook_mobile/core/datasources/remotedata_source/Search/searchdatasource.dart';
import 'package:icook_mobile/models/response/Dish/dishitem.dart';
import 'package:icook_mobile/ui/base_view_model.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../locator.dart';

class SearchModel extends BaseNotifier {
  final navigation = locator<NavigationService>();
  final data = locator<SearchDataSource>();

  String afterKey = "";

  List<Dish> _list = [];

  List<Dish> get list => _list;

  //scaffoldkey
  final scaffoldKey = new GlobalKey<ScaffoldState>();

  Future<void> loadData(String name) async {
    if (name.isNotEmpty) {
      _list.clear();
      setState(ViewState.Busy);
      try {
        var result = await data.searchForDish(name);
        print(result);
        _list.clear();
        _list = result.data.result;
        _checkIfAvailableData();
      } catch (e) {
        setState(ViewState.Idle);
        print('searchscreen model exception $e');
        final snackbar = SnackBar(content: Text(e));
        scaffoldKey.currentState.showSnackBar(snackbar);
      }
    } else {
      _list.clear();
      setState(ViewState.NoDataAvailable);
    }
  }

  void _checkIfAvailableData() {
    (_list.isEmpty)
        ? setState(ViewState.NoDataAvailable)
        : setState(ViewState.DataFetched);
  }

  ///on initState
  Future<void> init() async {}
}
