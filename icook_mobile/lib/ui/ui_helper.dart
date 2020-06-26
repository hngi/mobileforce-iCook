import 'package:flutter/material.dart';
import 'package:icook_mobile/core/services/key_storage/key_storage_service.dart';
import 'package:icook_mobile/locator.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

class Constants {
  static String appName = "iCook";

  //Colors for theme
  static Color lightPrimary = Color(0xfffcfcff);
  static Color darkPrimary = Colors.black;
  static Color lightAccent = Colors.black;
  static Color darkAccent = Colors.white;
  static Color lightBG = Color(0xFFffffff);
  static Color darkBG = Colors.black;
  static Color badgeColor = Colors.red;

  //Reusable Colors
  static const kbuttonColor1 = Color(0xFF558CE2);
  static const kbuttonColor2 = Color(0xFFECEBEB);

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
    textTheme: TextTheme(
      headline6: TextStyle(
        color: darkBG,
        fontSize: 18,
        fontFamily: 'Poppins',
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      contentPadding: EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 15.0),
      fillColor: Color(0xFFF4F4F4),
      filled: true,
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(7.0)),
        borderSide: BorderSide(color: Color(0xFF578DDE)),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(10.0)),
        borderSide: BorderSide(color: Color(0xFFF4F4F4)),
      ),
      hintStyle: TextStyle(
          color: Color(0XFFBDBDBD), fontSize: 16, fontFamily: "Poppins"),
    ),
    appBarTheme: AppBarTheme(
      elevation: 0,
      textTheme: TextTheme(
        headline6: TextStyle(
          color: darkBG,
          fontSize: 24,
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w500,
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
    textTheme: TextTheme(
      headline6: TextStyle(
        color: darkBG,
        fontSize: 18,
        fontFamily: 'Poppins',
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      contentPadding: EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 15.0),
      fillColor: Colors.grey,
      filled: true,
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(7.0)),
        borderSide: BorderSide(color: Color(0xFF578DDE)),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(10.0)),
        borderSide: BorderSide(color: Color(0xFFF4F4F4)),
      ),
      hintStyle: TextStyle(
          color: Colors.black, fontSize: 16, fontFamily: "Poppins"),
    ),
    appBarTheme: AppBarTheme(
      elevation: 0,
      textTheme: TextTheme(
        headline6: TextStyle(
          color: lightBG,
          fontSize: 24,
          fontWeight: FontWeight.w500,
        ),
      ),
//      iconTheme: IconThemeData(
//        color: darkAccent,
//      ),
    ),
  );

  static const kSpacingUnit = 10;

  static const kDarkPrimaryColor = Color(0xFF212121);
  static const kDarkSecondaryColor = Color(0xFF373737);
  static const kLightPrimaryColor = Color(0xFFFFFFFF);
  static const kLightSecondaryColor = Color(0xFFF3F7FB);
  static const kAccentColor = Color(0xFFFFC107);

  final kTitleTextStyle = TextStyle(
    fontSize: ScreenUtil().setSp(kSpacingUnit.w * 1.7),
    fontWeight: FontWeight.w600,
  );

  final kCaptionTextStyle = TextStyle(
    fontSize: ScreenUtil().setSp(kSpacingUnit.w * 1.3),
    fontWeight: FontWeight.w100,
  );

  final kButtonTextStyle = TextStyle(
    fontSize: ScreenUtil().setSp(kSpacingUnit.w * 1.5),
    fontWeight: FontWeight.w400,
    color: kDarkPrimaryColor,
  );

  final kDarkTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: kDarkPrimaryColor,
    canvasColor: kDarkPrimaryColor,
    backgroundColor: kDarkSecondaryColor,
    accentColor: kAccentColor,
    iconTheme: ThemeData.dark().iconTheme.copyWith(
          color: kLightSecondaryColor,
        ),
    textTheme: ThemeData.dark().textTheme.apply(
          bodyColor: kLightSecondaryColor,
          displayColor: kLightSecondaryColor,
        ),
  );

  final kLightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: kLightPrimaryColor,
    canvasColor: kLightPrimaryColor,
    backgroundColor: kLightSecondaryColor,
    accentColor: kAccentColor,
    iconTheme: ThemeData.light().iconTheme.copyWith(
          color: kDarkSecondaryColor,
        ),
    textTheme: ThemeData.light().textTheme.apply(
          bodyColor: kDarkSecondaryColor,
          displayColor: kDarkSecondaryColor,
        ),
  );
}

class ThemeNotifier extends ChangeNotifier {
  final keystorage = locator<KeyStorageService>();

  void updateTheme({bool value = false}) {
    print(value);
    keystorage.isDarkMOde = value;
    notifyListeners();
  }
}
