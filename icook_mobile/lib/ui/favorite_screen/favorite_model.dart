
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:icook_mobile/core/constants/view_state.dart';
import 'package:icook_mobile/core/datasources/remotedata_source/UserProfile/userprofiledatasource.dart';
import 'package:icook_mobile/core/services/key_storage/key_storage_service.dart';
import 'package:icook_mobile/locator.dart';
import 'package:icook_mobile/models/response/Dish/getmydishes.dart';

import 'package:icook_mobile/ui/base_view_model.dart';
import 'package:stacked_services/stacked_services.dart';

class FavoriteScreenModel extends BaseNotifier{

  final navigation = locator<NavigationService>();
  final data = locator<UserProfileDataSource>();
  final key = locator<KeyStorageService>();

  List<Dishe> _dishList = [];

  List<Dishe> get dishList => _dishList;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  Future<void> loadData() async {

    try{

      var result = await data.myFavouriteDishes();
      _dishList = result.data.dishes;
      _checkIfAvailableData();

      final snackBar = SnackBar(content: Text(result.status),);
      scaffoldKey.currentState.showSnackBar(snackBar);
    } catch (e){
      setState(ViewState.Idle);
      final snackBar = SnackBar(content: Text(e),);
      scaffoldKey.currentState.showSnackBar(snackBar);
    }
  }

  void _checkIfAvailableData(){

    (_dishList.isEmpty) ?
    setState(ViewState.NoDataAvailable) : setState(ViewState.DataFetched);
  }

  Future<void> init() async {
    setState(ViewState.Busy);
    await loadData();
  }

}