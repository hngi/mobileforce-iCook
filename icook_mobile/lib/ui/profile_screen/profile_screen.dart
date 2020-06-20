import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

import '../ui_helper.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, height: 896, width: 414, allowFontScaling: true);
    var header = Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        SizedBox(width: 1),
        Icon(
          LineAwesomeIcons.angle_left,
          size: 31,
        ),
        SizedBox(width: Constants.kSpacingUnit.w * 2),
        Text(
          'My profile',
          style: GoogleFonts.workSans(
              textStyle: TextStyle(color: Colors.black, fontSize: 24),
              fontWeight: FontWeight.w500),
        ),
        SizedBox(width: Constants.kSpacingUnit.w * 4.2),
        Icon(Icons.search, size: 30),
        SizedBox(width: 0.1),
      ],
    );

    return Scaffold(
      body: Column(
        children: <Widget>[
          SizedBox(height: Constants.kSpacingUnit.w * 6),
          header,
          Expanded(
            child: ListView(
              children: <Widget>[
                ListTile(
                  leading: Container(
                      width: 60,
                      height: 90,
                      decoration: new BoxDecoration(
                          shape: BoxShape.circle,
                          image: new DecorationImage(
                              fit: BoxFit.cover,
                              image:
                                  new AssetImage('assets/images/avatar.png')))),
                  title: Text(
                    'Chef Emmanuel',
                    style: GoogleFonts.workSans(
                        textStyle:
                            TextStyle(color: Color(0xFF222222), fontSize: 18),
                        fontWeight: FontWeight.w600),
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
                    borderRadius: BorderRadius.circular(0),
                  ),
                  child: ListTile(
                    title: Text(
                      'Account Information',
                      style: GoogleFonts.workSans(
                          textStyle: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.w500)),
                    ),
                    subtitle: Text(
                      'Edit profile',
                      style: GoogleFonts.workSans(
                          textStyle:
                              TextStyle(color: Colors.blueGrey, fontSize: 12)),
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
                              fontSize: 16,
                              fontWeight: FontWeight.w500)),
                    ),
                    subtitle: Text(
                      '4 dishes posted',
                      style: GoogleFonts.workSans(
                          textStyle:
                              TextStyle(color: Colors.blueGrey, fontSize: 12)),
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
                              fontSize: 16,
                              fontWeight: FontWeight.w500)),
                    ),
                    subtitle: Text(
                      '10 pending notifications',
                      style: GoogleFonts.workSans(
                          textStyle:
                              TextStyle(color: Colors.blueGrey, fontSize: 12)),
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
                              TextStyle(color: Colors.black, fontSize: 16),
                          fontWeight: FontWeight.w500),
                    ),
                    subtitle: Text(
                      'Reviews for 4 recipe',
                      style: GoogleFonts.workSans(
                          textStyle:
                              TextStyle(color: Colors.blueGrey, fontSize: 12)),
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
                              fontSize: 16,
                              fontWeight: FontWeight.w500)),
                    ),
                    subtitle: Text(
                      'Newsletter, Dark mode, Change Password',
                      style: GoogleFonts.workSans(
                          textStyle:
                              TextStyle(color: Colors.blueGrey, fontSize: 12)),
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
