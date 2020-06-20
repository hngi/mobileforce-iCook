import 'package:flutter/material.dart';
import 'package:icook_mobile/core/services/key_storage_service.dart';
import 'package:icook_mobile/locator.dart';
import 'package:stacked_services/stacked_services.dart';

class Constants {
  static String appName = "iCook";

  //Colors for theme
  static Color lightPrimary = Color(0xfffcfcff);
  static Color darkPrimary = Colors.black;
  static Color lightAccent = Colors.black;
  static Color darkAccent = Colors.white;
  static Color lightBG = Color(0xFFE5E5E5);
  static Color darkBG = Colors.black;
  static Color badgeColor = Colors.red;

  //Reusable Colors
  static const kcolor1 = Color(0xFF1D1754);
  static const kcolor2 = Color(0xFFC4C4C4);
  static const korange = Color(0xFFFFAC50);
  static const kcolor3 = Color(0xFFFC7A1E);
  static const kdarkOrange = Color(0xFF8E3900);

  //Reusable Spacers
  static const kPaddingS = 8.0;
  static const kPaddingM = 16.0;
  static const kPaddingL = 32.0;

  static ThemeData lightTheme = ThemeData(
    backgroundColor: lightBG,
    primaryColor: lightPrimary,
    accentColor: lightAccent,
    cursorColor: lightAccent,
    scaffoldBackgroundColor: lightBG,
    appBarTheme: AppBarTheme(
      elevation: 0,
      textTheme: TextTheme(
        headline6: TextStyle(
          color: darkBG,
          fontSize: 18.0,
          fontWeight: FontWeight.w800,
        ),
      ),
//      iconTheme: IconThemeData(
//        color: lightAccent,
//      ),
    ),
  );

  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    backgroundColor: darkBG,
    primaryColor: darkPrimary,
    accentColor: darkAccent,
    cardColor: darkPrimary,
    scaffoldBackgroundColor: darkBG,
    cursorColor: darkAccent,
    appBarTheme: AppBarTheme(
      elevation: 0,
      textTheme: TextTheme(
        headline6: TextStyle(
          color: lightBG,
          fontSize: 18.0,
          fontWeight: FontWeight.w800,
        ),
      ),
//      iconTheme: IconThemeData(
//        color: darkAccent,
//      ),
    ),
  );
}

class ThemeNotifier extends ChangeNotifier {
  final keystorage = locator<KeyStorageService>();

  void updateTheme() {
    keystorage.isDarkMOde = !keystorage.isDarkMOde;
    notifyListeners();
  }
}
