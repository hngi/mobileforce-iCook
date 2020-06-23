import 'package:flutter/material.dart';
import 'package:icook_mobile/core/managers/core_manager.dart';
import 'package:icook_mobile/core/services/key_storage/key_storage_service.dart';
import 'package:icook_mobile/locator.dart';
import 'package:icook_mobile/provider_setup.dart';
import 'package:icook_mobile/ui/account_information_screen/account_information_screen.dart';
import 'package:icook_mobile/ui/details_screen/details_screen.dart';
import 'package:icook_mobile/ui/edit_profile_screen/edit_profile.dart';
import 'package:icook_mobile/ui/favorite_screen/favorite_screen.dart';
import 'package:icook_mobile/ui/home_page/home_page.dart';
import 'package:icook_mobile/ui/profile_screen/profile_screen.dart';
import 'package:icook_mobile/ui/router.dart';
import 'package:icook_mobile/ui/search_screen/search_page.dart';
import 'package:icook_mobile/ui/splash_screen/splash_screen.dart';

import 'package:icook_mobile/ui/ui_helper.dart';
import 'package:provider/provider.dart';
import 'package:stacked_services/stacked_services.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  final navigationService = locator<NavigationService>();
  final keystorage = locator<KeyStorageService>();
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: providers,
      child: CoreManager(
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: Constants.appName,
          theme: Constants.lightTheme,
          darkTheme: Constants.darkTheme,
          navigatorKey: navigationService.navigatorKey,
          onGenerateRoute: Router.generateRoute,
          home: SplashScreen(),
        ),
      ),
    );
  }
}

class TestRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
    );
  }
}
