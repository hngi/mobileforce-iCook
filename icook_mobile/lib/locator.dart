import 'package:get_it/get_it.dart';
import 'package:hive/hive.dart';
import 'package:icook_mobile/core/datasources/remotedata_source/DIsh/dishdatasource.dart';
import 'package:icook_mobile/core/datasources/remotedata_source/DIsh/dishdatasourceimpl.dart';
import 'package:icook_mobile/core/datasources/remotedata_source/Search/searchdatasource.dart';
import 'package:icook_mobile/core/datasources/remotedata_source/Search/searchdatasourceimpl.dart';
import 'package:icook_mobile/core/datasources/remotedata_source/UserProfile/userprofiledatasource.dart';
import 'package:icook_mobile/core/datasources/remotedata_source/UserProfile/userprofiledatasourceimpl.dart';
import 'package:icook_mobile/core/datasources/remotedata_source/Users/usersdatasource.dart';
import 'package:icook_mobile/core/datasources/remotedata_source/Users/usersdatasourceimpl.dart';
import 'package:icook_mobile/core/services/Api/ApiService.dart';
import 'package:icook_mobile/core/services/Api/ApiServiceImpl.dart';
import 'package:icook_mobile/core/services/Auth_service/auth_service.dart';
import 'package:icook_mobile/core/services/connectivity/connectivity_service.dart';
import 'package:icook_mobile/core/services/connectivity/connectivity_service_impl.dart';
import 'package:icook_mobile/core/services/key_storage/key_storage_impl.dart';
import 'package:icook_mobile/core/services/key_storage/key_storage_service.dart';
import 'package:icook_mobile/core/utils/file_helper.dart';
import 'package:stacked_services/stacked_services.dart';

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

  locator.registerLazySingleton<ConnectivityService>(
      () => ConnectivityServiceImpl());

  locator.registerLazySingleton<ApiService>(() => ApiServiceImpl());

  locator.registerLazySingleton<AuthService>(() => AuthServiceImpl());

  locator.registerLazySingleton<HiveInterface>(() => Hive);

  if (!test) {
    await _setupSharedPreferences();
  }

  // Utils
  locator.registerLazySingleton<FileHelper>(() => FileHelperImpl());

  // DataSources

  locator.registerLazySingleton<DishDataSource>(() => DishDataSourceImpl());

  locator.registerLazySingleton<SearchDataSource>(() => SearchDataSourceImpl());

  locator.registerLazySingleton<UserProfileDataSource>(
      () => UserProfileDataSourceImpl());

  locator.registerLazySingleton<UsersDataSource>(() => UsersDataSourceImpl());
}

Future<void> _setupSharedPreferences() async {
  final instance = await KeyStorageServiceImpl.getInstance();
  locator.registerLazySingleton<KeyStorageService>(() => instance);
}
