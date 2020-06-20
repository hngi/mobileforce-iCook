import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:icook_mobile/ui/profile_screen/constant.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, height: 896, width: 414, allowFontScaling: true);

    var themeSwitcher = ThemeSwitcher(
      builder: (context) {
        return AnimatedCrossFade(
          duration: Duration(milliseconds: 200),
          crossFadeState:
              ThemeProvider.of(context).brightness == Brightness.dark
                  ? CrossFadeState.showFirst
                  : CrossFadeState.showSecond,
          firstChild: GestureDetector(
            onTap: () =>
                ThemeSwitcher.of(context).changeTheme(theme: kLightTheme),
            child: Icon(
              LineAwesomeIcons.sun,
              size: ScreenUtil().setSp(kSpacingUnit.w * 3),
            ),
          ),
          secondChild: GestureDetector(
            onTap: () =>
                ThemeSwitcher.of(context).changeTheme(theme: kDarkTheme),
            child: Icon(
              LineAwesomeIcons.moon,
              size: ScreenUtil().setSp(kSpacingUnit.w * 3),
            ),
          ),
        );
      },
    );

    var header = Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(width: kSpacingUnit.w * 1),
        Icon(
          LineAwesomeIcons.angle_left,
          size: ScreenUtil().setSp(kSpacingUnit.w * 3),
        ),
        SizedBox(width: kSpacingUnit.w * 2),
        Text(
          'My profile',
          style: GoogleFonts.workSans(
              textStyle: TextStyle(color: Colors.black, fontSize: 24),
              fontWeight: FontWeight.w500),
        ),
        SizedBox(width: kSpacingUnit.w * 2),
        Icon(LineAwesomeIcons.search),
        SizedBox(width: kSpacingUnit.w * 2),
      ],
    );

    return Scaffold(
      body: Column(
        children: <Widget>[
          SizedBox(height: kSpacingUnit.w * 5),
          header,
          Expanded(
            child: ListView(
              children: <Widget>[
                ListTile(
                  leading: CircleAvatar(
                    backgroundImage: AssetImage('assets/images/avatar.png'),
                  ),
                  title: Text(
                    'Chef Emmanuel',
                    style: GoogleFonts.workSans(
                        textStyle: TextStyle(color: Colors.black, fontSize: 24),
                        fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(
                    'Emmanuelchef@gmail.com',
                    style: GoogleFonts.workSans(
                        textStyle:
                            TextStyle(color: Colors.blueGrey, fontSize: 14)),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(1.0),
                  ),
                  child: ListTile(
                    title: Text(
                      'Account Information',
                      style: GoogleFonts.workSans(
                          textStyle: TextStyle(
                              color: Colors.black,
                              fontSize: 24,
                              fontWeight: FontWeight.w500)),
                    ),
                    subtitle: Text(
                      'Edit profile',
                      style: GoogleFonts.workSans(
                          textStyle:
                              TextStyle(color: Colors.blueGrey, fontSize: 14)),
                    ),
                    trailing: Icon(Icons.keyboard_arrow_right),
                    onTap: () {
                      print('Account Information');
                    },
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(1.0),
                  ),
                  child: ListTile(
                    title: Text(
                      'My Dishes',
                      style: GoogleFonts.workSans(
                          textStyle: TextStyle(
                              color: Colors.black,
                              fontSize: 24,
                              fontWeight: FontWeight.w500)),
                    ),
                    subtitle: Text(
                      '4 dishes posted',
                      style: GoogleFonts.workSans(
                          textStyle:
                              TextStyle(color: Colors.blueGrey, fontSize: 14)),
                    ),
                    trailing: Icon(Icons.keyboard_arrow_right),
                    onTap: () {
                      print('my dishes');
                    },
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(1.0),
                  ),
                  child: ListTile(
                    title: Text(
                      'Notifications',
                      style: GoogleFonts.workSans(
                          textStyle: TextStyle(
                              color: Colors.black,
                              fontSize: 24,
                              fontWeight: FontWeight.w500)),
                    ),
                    subtitle: Text(
                      '10 pending notifications',
                      style: GoogleFonts.workSans(
                          textStyle:
                              TextStyle(color: Colors.blueGrey, fontSize: 14)),
                    ),
                    trailing: Icon(Icons.keyboard_arrow_right),
                    onTap: () {
                      print('notification');
                    },
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(1.0),
                  ),
                  child: ListTile(
                    title: Text(
                      'My Reviews',
                      style: GoogleFonts.workSans(
                          textStyle:
                              TextStyle(color: Colors.black, fontSize: 24),
                          fontWeight: FontWeight.w500),
                    ),
                    subtitle: Text(
                      'Reviews for 4 recipe',
                      style: GoogleFonts.workSans(
                          textStyle:
                              TextStyle(color: Colors.blueGrey, fontSize: 14)),
                    ),
                    trailing: Icon(Icons.keyboard_arrow_right),
                    onTap: () {
                      print('reviews');
                    },
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(1.0),
                  ),
                  child: ListTile(
                    title: Text(
                      'Settings',
                      style: GoogleFonts.workSans(
                          textStyle: TextStyle(
                              color: Colors.black,
                              fontSize: 24,
                              fontWeight: FontWeight.w500)),
                    ),
                    subtitle: Text(
                      'Newsletter, linked accounts, Change Password',
                      style: GoogleFonts.workSans(
                          textStyle:
                              TextStyle(color: Colors.blueGrey, fontSize: 14)),
                    ),
                    trailing: Icon(Icons.keyboard_arrow_right),
                    onTap: () {
                      print('reviews');
                    },
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
