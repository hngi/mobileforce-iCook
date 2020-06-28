import 'package:icook_mobile/core/constants/view_routes.dart';
import 'package:icook_mobile/core/constants/view_state.dart';
import 'package:icook_mobile/ui/base_view_model.dart';
import 'package:stacked_services/stacked_services.dart';
import '../../locator.dart';

class SignUpModel extends BaseNotifier {
  final navigation = locator<NavigationService>();

  void signUp() async {
    setState(ViewState.Busy);
    await Future.delayed(Duration(seconds: 3));
    navigation.pushNamedAndRemoveUntil(ViewRoutes.home);
  }

  void login() {
    navigation.pushNamedAndRemoveUntil(ViewRoutes.login);
  }
}
