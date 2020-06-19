import 'package:get_it/get_it.dart';
import 'package:hive/hive.dart';
import 'package:icook_mobile/core/services/key_storage_impl.dart';
import 'package:stacked_services/stacked_services.dart';

import 'core/services/key_storage_service.dart';

GetIt locator = GetIt.instance;


Future<void> setupLocator({bool test = false}) async {
  // Services
  locator.registerLazySingleton(
    () => NavigationService(),
  );

  locator.registerLazySingleton(
    () => DialogService(),
  );

  locator.registerLazySingleton(
    () => SnackbarService(),
  );

  locator.registerLazySingleton<HiveInterface>(() => Hive);

  if (!test) {
    await _setupSharedPreferences();
  }

  // Utils

  // External
}

Future<void> _setupSharedPreferences() async {
  final instance = await KeyStorageServiceImpl.getInstance();
  locator.registerLazySingleton<KeyStorageService>(() => instance);
}
