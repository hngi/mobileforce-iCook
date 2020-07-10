import 'package:flutter/material.dart';
import 'package:icook_mobile/core/constants/view_state.dart';
import 'package:icook_mobile/core/datasources/remotedata_source/DIsh/dishdatasource.dart';
import 'package:icook_mobile/core/services/key_storage/key_storage_service.dart';
import 'package:icook_mobile/models/response/Dish/dishitem.dart';
import 'package:icook_mobile/models/response/Users/getauser.dart';
import 'package:icook_mobile/ui/base_view_model.dart';

import '../../locator.dart';

class UserProfileModel extends BaseNotifier {
  final data = locator<DishDataSource>();
  final key = locator<KeyStorageService>();

  List<Dish> _list = [];
  User _user = null;
  User get user => _user;

  String _id = "";
  String get id => _id;

  List<Dish> get list => _list;

  //scaffoldkey
  final scaffoldKey = new GlobalKey<ScaffoldState>();

  Future<void> loadData() async {
    setState(ViewState.Busy);

    try {
      var response = await data.getDishById(id) as UserResponse;
      print(response);
      _user = response.data.user;
      _list.clear();
      _list = response.data.user.dishes;
      _checkIfAvailableData();

      // //show
      // final snackbar = SnackBar(content: Text(response.status));
      // scaffoldKey.currentState.showSnackBar(snackbar);
    } catch (e) {
      setState(ViewState.Idle);
      print('user profile model exception $e');
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
  Future<void> init(String id) async {
    _id = id;
    setState(ViewState.Busy);
    await loadData();
  }
}
