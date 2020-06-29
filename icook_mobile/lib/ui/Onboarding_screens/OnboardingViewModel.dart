import 'package:icook_mobile/core/constants/view_routes.dart';
import 'package:icook_mobile/core/services/key_storage/key_storage_service.dart';
import 'package:icook_mobile/ui/base_view_model.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../locator.dart';

class OnboardingViewModel extends BaseNotifier {
  final navigation = locator<NavigationService>();
  final key = locator<KeyStorageService>();

  int _slideIndex = 0;
  int get slideIndex => _slideIndex;

  void changeIndex(int index) {
    _slideIndex = index;
    notifyListeners();
  }

  void goToLogin() {
    key.isFirstTime = false;
    navigation.pushNamedAndRemoveUntil(ViewRoutes.login);
  }

  void goToSignUp() {
    key.isFirstTime = false;
    navigation.pushNamedAndRemoveUntil(ViewRoutes.signup);
  }
}
