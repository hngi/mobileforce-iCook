import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:icook_mobile/core/constants/view_state.dart';
import 'package:icook_mobile/core/datasources/remotedata_source/UserProfile/userprofiledatasource.dart';
import 'package:icook_mobile/core/services/key_storage/key_storage_service.dart';
import 'package:icook_mobile/locator.dart';
import 'package:icook_mobile/models/response/Dish/dishitem.dart';
import 'package:icook_mobile/models/response/Dish/dishresponse.dart';
import 'package:icook_mobile/models/response/Dish/favouriteresponse.dart';

import 'package:icook_mobile/ui/base_view_model.dart';
import 'package:stacked_services/stacked_services.dart';

class FavoriteScreenModel extends BaseNotifier {
  final navigation = locator<NavigationService>();
  final data = locator<UserProfileDataSource>();
  final key = locator<KeyStorageService>();

  List<Dish> _dishList = [];

  List<Dish> get dishList => _dishList;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final easycontroller = EasyRefreshController();

  Future<void> loadData() async {
    setState(ViewState.Busy);

    try {
      var response = await data.myFavouriteDishes() as FavouriteResponse;
      print(response);
      _dishList.clear();
      _dishList = response.data.dishes;
      _checkIfAvailableData();
      easycontroller.finishRefresh(success: true);
    } catch (e) {
      setState(ViewState.Idle);
      easycontroller.finishRefresh(success: true);

      print('favourite screen model exception $e');
      final snackbar = SnackBar(content: Text(e));
      scaffoldKey.currentState.showSnackBar(snackbar);
    }
  }

  void _checkIfAvailableData() {
    (_dishList.isEmpty)
        ? setState(ViewState.NoDataAvailable)
        : setState(ViewState.DataFetched);
  }

  Future<void> init() async {
    setState(ViewState.Busy);
    await loadData();
  }
}
