import 'package:get/get.dart';
import 'package:icook_mobile/core/constants/view_routes.dart';
import 'package:icook_mobile/core/datasources/remotedata_source/DIsh/dishdatasource.dart';
import 'package:icook_mobile/models/response/Dish/dishitem.dart';
import 'package:icook_mobile/ui/base_view_model.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:timeago/timeago.dart' as timeago;

import '../../locator.dart';

class DetailsModel extends BaseNotifier {
  final navigation = locator<NavigationService>();

  final datasource = locator<DishDataSource>();
  final snack = locator<SnackbarService>();

  bool _isLiked = false;
  bool get isLiked => _isLiked;

  int _likes = 0;
  int get likes => _likes;

  Dish _data;
  Dish get data => _data;

  DateTime _dateTime;
  DateTime get dateTime => _dateTime;

  String get time => timeago.format(dateTime) ?? "";

  void setData(final Dish data) {
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
      // _isLiked == true
      //     ? showSnack('Liked successfully')
      //     : showSnack('Unliked successfully');
    } catch (e) {
      print('dish model exception $e');
      showSnack(e.toString());
    }
  }

  Future<void> favourite() async {
    try {
      var result = await datasource.toggleFavouriteDish(data.id);
      print(result);
      // showSnack('Added Successfully');
    } catch (e) {
      print('dish model exception $e');
      showSnack(e.toString());
    }
  }

  void seeUserInfo() {
    navigation.navigateTo(ViewRoutes.userprofile);
  }

  void showSnack(String message) {
    snack.showCustomSnackBar(
        message: message,
        title: 'iCook_bot',
        instantInit: true,
        duration: Duration(seconds: 2),
        snackPosition: SnackPosition.BOTTOM);
  }
}
