import 'package:icook_mobile/ui/base_view_model.dart';

class RecipeItemModel extends BaseNotifier {
  bool _isLiked = false;
  bool get isLiked => _isLiked;

  void init({bool isLiked = false}) {
    _isLiked = isLiked;
  }

  void click() {
    _isLiked = !_isLiked;
    notifyListeners();
  }
}
