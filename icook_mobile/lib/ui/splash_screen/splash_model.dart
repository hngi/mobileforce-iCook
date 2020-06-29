import 'package:icook_mobile/core/constants/view_routes.dart';
import 'package:icook_mobile/core/services/key_storage/key_storage_service.dart';
import 'package:icook_mobile/locator.dart';
import 'package:icook_mobile/ui/base_view_model.dart';
import 'package:stacked_services/stacked_services.dart';

class SplashModel extends BaseNotifier {
  final navigation = locator<NavigationService>();
  final key = locator<KeyStorageService>();

  bool get isFirstTime => key.isFirstTime ?? true;

  Future<void> init() async {
    if (!isFirstTime) {
      await Future.delayed(Duration(seconds: 3));
      if (key.isLoggedIn) {
        navigation.navigateTo(ViewRoutes.home);
      } else
        navigation.navigateTo(ViewRoutes.login);
    }
  }

  void getStarted() {
    navigation.pushNamedAndRemoveUntil(ViewRoutes.onboarding);
  }
}
