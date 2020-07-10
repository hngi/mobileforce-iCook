import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:icook_mobile/core/constants/view_routes.dart';
import 'package:icook_mobile/core/constants/view_state.dart';
import 'package:icook_mobile/core/datasources/remotedata_source/DIsh/dishdatasource.dart';
import 'package:icook_mobile/core/datasources/remotedata_source/UserProfile/userprofiledatasource.dart';
import 'package:icook_mobile/core/datasources/remotedata_source/Users/usersdatasource.dart';
import 'package:icook_mobile/core/services/key_storage/key_storage_service.dart';
import 'package:icook_mobile/models/response/Dish/dishitem.dart';
import 'package:icook_mobile/models/response/Users/getauser.dart';
import 'package:icook_mobile/ui/base_view_model.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../locator.dart';

class UserProfileModel extends BaseNotifier {
  final data = locator<DishDataSource>();
  final userdata = locator<UsersDataSource>();
  final key = locator<KeyStorageService>();
  final navigation = locator<NavigationService>();
  final snack = locator<SnackbarService>();

  List<Dish> _list = [];
  User _user = null;
  User get user => _user;

  bool _isFollow = false;
  bool get isFollow => _isFollow;

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
      _isFollow = response.data.user.isFollowing;
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

  void editDetails() {
    navigation.navigateTo(ViewRoutes.edit_profile);
  }

  Future<void> follow() async {
    try {
      var result = await userdata.followUser(user.id);
      print(result);
      _isFollow = true;
      notifyListeners();
      showSnack('followed Successfully');
    } catch (e) {
      print('dish model exception $e');
      showSnack(e.toString());
    }
  }

  Future<void> unfollow() async {
    try {
      var result = await userdata.unfollowUser(user.id);
      print(result);
      _isFollow = false;
      notifyListeners();

      showSnack('unfollowed Successfully');
    } catch (e) {
      print('dish model exception $e');
      showSnack(e.toString());
    }
  }

  void showSnack(String message) {
    snack.showCustomSnackBar(
        message: message,
        title: 'iCook_bot',
        instantInit: true,
        duration: Duration(seconds: 2),
        snackPosition: SnackPosition.BOTTOM);
  }

  void toogleFollow() {
    if (isFollow) {
      unfollow();
    } else {
      follow();
    }
  }
}
