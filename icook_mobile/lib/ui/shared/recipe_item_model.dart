import 'package:icook_mobile/models/response/Dish/getmydishes.dart';
import 'package:icook_mobile/ui/base_view_model.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:icook_mobile/locator.dart';
import 'package:icook_mobile/core/constants/view_routes.dart';
import 'package:timeago/timeago.dart' as timeago;

class RecipeItemModel extends BaseNotifier {
  final navigation = locator<NavigationService>();

  bool _isLiked = false;
  bool get isLiked => _isLiked;

  Dishe _data;
  Dishe get data => _data;

  DateTime _dateTime;
  DateTime get dateTime => _dateTime;

  String get time => timeago.format(dateTime) ?? "";

  void setData(final Dishe data) {
    _data = data;
    _dateTime = DateTime.parse(data?.createdAt ?? DateTime.now().toString());
  }

  void init({bool isLiked = false}) {
    _isLiked = isLiked;
  }

  void click() {
    print(_data);
    _isLiked = !_isLiked;
    notifyListeners();
  }

  void seeDetails(Dishe dishe) {
    navigation.navigateTo(ViewRoutes.recipe_details, arguments: dishe);
  }

  void seeUserInfo() {
    navigation.navigateTo(ViewRoutes.userprofile);
  }
}
