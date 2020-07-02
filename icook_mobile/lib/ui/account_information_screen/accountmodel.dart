import 'package:icook_mobile/core/services/key_storage/key_storage_service.dart';
import 'package:icook_mobile/ui/base_view_model.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../locator.dart';

class AccountModel extends BaseNotifier{
  final key = locator<KeyStorageService>();
  final navigation = locator<NavigationService>();

  String afterKey = "";

  String get username => key.name.toLowerCase();

   String get email => key.email;
}