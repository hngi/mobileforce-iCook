import 'package:get/get.dart';
import 'package:icook_mobile/core/constants/view_state.dart';
import 'package:icook_mobile/core/datasources/remotedata_source/DIsh/dishdatasource.dart';
import 'package:icook_mobile/core/services/key_storage/key_storage_service.dart';
import 'package:icook_mobile/models/response/Dish/dishitem.dart';
import 'package:icook_mobile/ui/base_view_model.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../locator.dart';

class AccountModel extends BaseNotifier {
  final key = locator<KeyStorageService>();
  final navigation = locator<NavigationService>();
  final data = locator<DishDataSource>();
  final snack = locator<SnackbarService>();

  String afterKey = "";

  String get username => key.name.toLowerCase();

  String get email => key.email;

  List<Dish> _list = [];

  List<Dish> get list => _list;

  Future<void> loadData() async {
    setState(ViewState.Busy);

    try {
      var response = await data.getMyDishes();
      print(response);
      _list.clear();
      _list = response.data.dishes;
      _checkIfAvailableData();
    } catch (e) {
      setState(ViewState.Idle);
      print('homescreen model exception $e');
      showSnack(e.toString());
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

  void showSnack(String message) {
    snack.showCustomSnackBar(
        message: message,
        title: 'iCook_bot',
        instantInit: true,
        duration: Duration(seconds: 2),
        snackPosition: SnackPosition.BOTTOM);
  }
}
