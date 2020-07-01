import 'package:flutter/material.dart';
import 'package:icook_mobile/core/datasources/remotedata_source/DIsh/dishdatasource.dart';
import 'package:icook_mobile/models/response/Dish/getmydishes.dart';
import 'package:icook_mobile/ui/base_view_model.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:icook_mobile/locator.dart';
import 'package:icook_mobile/core/constants/view_routes.dart';
import 'package:timeago/timeago.dart' as timeago;

class RecipeItemModel extends BaseNotifier {
  final navigation = locator<NavigationService>();
  final datasource = locator<DishDataSource>();
  final snack = locator<SnackbarService>();

  bool _isLiked = false;
  bool get isLiked => _isLiked;

  int _likes = 0;
  int get likes => _likes;

  Dishe _data;
  Dishe get data => _data;

  DateTime _dateTime;
  DateTime get dateTime => _dateTime;

  String get time => timeago.format(dateTime) ?? "";

  void setData(final Dishe data) {
    _data = data;
    _isLiked = data.isLiked;
    _likes = data.likesCount;
    _dateTime = DateTime.parse(data?.createdAt ?? DateTime.now().toString());
  }

  Future<void> like() async {
    _isLiked = !_isLiked;

    _isLiked ? _likes++ : _likes--;
    notifyListeners();

    try {
      var result = await datasource.toggleLikeDish(data.id);
      print(result);
      snack.showSnackbar(
          barBlur: 50,
          title: 'icook_bot',
          message: 'Liked Successfully',
          iconData: Icons.person);
    } catch (e) {
      print('dish model exception $e');
      snack.showSnackbar(
          barBlur: 50,
          title: 'icook_bot',
          message: '$e',
          iconData: Icons.person);
    }
  }

  void seeDetails(Dishe dishe) {
    navigation.navigateTo(ViewRoutes.recipe_details, arguments: dishe);
  }

  void seeUserInfo() {
    navigation.navigateTo(ViewRoutes.userprofile);
  }
}
