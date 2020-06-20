import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:flutter/material.dart';
import 'package:icook_mobile/core/services/key_storage_service.dart';
import 'package:icook_mobile/locator.dart';
import 'package:icook_mobile/provider_setup.dart';
import 'package:icook_mobile/ui/details_screen/details_screen.dart';
import 'package:icook_mobile/ui/router.dart';
import 'package:icook_mobile/ui/ui_helper.dart';
import 'package:icook_mobile/ui/view/constant.dart';
import 'package:icook_mobile/ui/view/profile_screen.dart';
import 'package:provider/provider.dart';
import 'package:stacked_services/stacked_services.dart';

import 'ui/view/profile_screen.dart';

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
    return ThemeProvider(
      initTheme: kDarkTheme,
      
      child: Builder(
        builder: (context) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeProvider.of(context),
            home: ProfileScreen(),
            
          );
        },
      ),
    );
    // return MultiProvider(
    //   providers: providers,
    //   child: MaterialApp(
    //     debugShowCheckedModeBanner: false,
    //     title: Constants.appName,
    //     theme: kDarkTheme,
    //     darkTheme: Constants.darkTheme,
    //     navigatorKey: navigationService.navigatorKey,
    //     onGenerateRoute: Router.generateRoute,
    //     home: ProfileScreen(),
    //   ),
    // );
  }
}

class TestRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
