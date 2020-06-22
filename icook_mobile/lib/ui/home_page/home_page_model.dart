import 'package:icook_mobile/ui/base_view_model.dart';

class HomePageModel extends BaseNotifier {
  int _index = 0;
  int get index => _index;

  //method to change the index of the pageviews with notifylisteners
  void changeTab(int newIndex) {
    _index = newIndex;
    notifyListeners();
  }
}
