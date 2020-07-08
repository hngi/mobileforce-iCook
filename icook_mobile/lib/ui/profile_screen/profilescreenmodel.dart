import 'package:google_sign_in/google_sign_in.dart';
import 'package:icook_mobile/core/constants/view_routes.dart';
import 'package:icook_mobile/core/services/key_storage/key_storage_service.dart';
import 'package:icook_mobile/locator.dart';
import 'package:icook_mobile/ui/base_view_model.dart';
import 'package:stacked_services/stacked_services.dart';

class ProfileScreenModel extends BaseNotifier {
  final key = locator<KeyStorageService>();
  final navigation = locator<NavigationService>();

  String afterKey = "";

  String get username => key.name.toLowerCase();

  String get email => key.email;

  GoogleSignIn _googleSignIn = GoogleSignIn(
    scopes: <String>[
      'email',
      'https://www.googleapis.com/auth/contacts.readonly',
    ],
  );

  Future<void> logout() async {
    await handleSignOut();
    await key.clear();
    navigation.pushNamedAndRemoveUntil(ViewRoutes.login);
  }

  Future<void> handleSignOut() => _googleSignIn.disconnect();
}
