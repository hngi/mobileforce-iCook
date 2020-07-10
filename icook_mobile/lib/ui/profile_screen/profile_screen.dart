import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:icook_mobile/core/services/key_storage/key_storage_service.dart';
import 'package:icook_mobile/ui/account_information_screen/account_information_screen.dart';
import 'package:icook_mobile/ui/dish_screen/dish_screen.dart';
import 'package:icook_mobile/ui/edit_profile_screen/edit_profile.dart';
import 'package:icook_mobile/ui/profile_screen/profilescreenmodel.dart';
import 'package:icook_mobile/ui/settings/settings.dart';
import 'package:icook_mobile/ui/shared/sumbitButton.dart';
import 'package:stacked/stacked.dart';
// import 'package:line_awesome_flutter/line_awesome_flutter.dart';

import '../../locator.dart';
import '../ui_helper.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, height: 896, width: 414, allowFontScaling: true);

    final key = locator<KeyStorageService>();
    return ViewModelBuilder<ProfileScreenModel>.reactive(
      viewModelBuilder: () => ProfileScreenModel(),
      builder: (context, model, child) => Scaffold(
        appBar: AppBar(
          title: Text("My profile"),
          actions: <Widget>[
            IconButton(icon: Icon(Icons.search), onPressed: () {})
          ],
        ),
        body: Column(
          children: <Widget>[
            SizedBox(
              height: 10,
            ),
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
                              image: key.profileImageUrl.isEmpty
                                  ? AssetImage('assets/images/chefavatar1.png')
                                  : CachedNetworkImageProvider(
                                      key.profileImageUrl),
                            ))),
                    title: Text(
                      'Chef ${model.username}',
                      style: GoogleFonts.poppins(
                          textStyle: TextStyle(fontSize: 18),
                          fontWeight: FontWeight.w600),
                    ),
                    subtitle: Text(
                      '${model.email}',
                      style: GoogleFonts.poppins(
                          textStyle:
                              TextStyle(color: Colors.blueGrey, fontSize: 14)),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  ListTile(
                    title: Text(
                      'Account Information',
                      style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w500)),
                    ),
                    subtitle: Text(
                      'Edit profile',
                      style: GoogleFonts.poppins(
                          textStyle:
                              TextStyle(color: Colors.blueGrey, fontSize: 12)),
                    ),
                    trailing: Icon(Icons.keyboard_arrow_right),
                    onTap: () {
                      print('Account Information');
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  AccountInformationScreen()));
                    },
                  ),
                  // SizedBox(
                  //   height: 5,
                  // ),
                  // ListTile(
                  //   title: Text(
                  //     'My Dishes',
                  //     style: GoogleFonts.poppins(
                  //         textStyle: TextStyle(
                  //             fontSize: 16, fontWeight: FontWeight.w500)),
                  //   ),
                  //   subtitle: Text(
                  //     '4 dishes posted',
                  //     style: GoogleFonts.poppins(
                  //         textStyle:
                  //             TextStyle(color: Colors.blueGrey, fontSize: 12)),
                  //   ),
                  //   trailing: Icon(Icons.keyboard_arrow_right),
                  //   onTap: () {
                  //     print('my dishes');
                  //     Navigator.push(
                  //         context,
                  //         MaterialPageRoute(
                  //             builder: (context) => MyDishScreen()));
                  //   },
                  // ),
                  SizedBox(
                    height: 5,
                  ),
                  ListTile(
                    title: Text(
                      'Notifications',
                      style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w500)),
                    ),
                    subtitle: Text(
                      '10 pending notifications',
                      style: GoogleFonts.poppins(
                          textStyle:
                              TextStyle(color: Colors.blueGrey, fontSize: 12)),
                    ),
                    trailing: Icon(Icons.keyboard_arrow_right),
                    onTap: () {
                      print('notification');
                    },
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  ListTile(
                    title: Text(
                      'My Reviews',
                      style: GoogleFonts.poppins(
                          textStyle: TextStyle(fontSize: 16),
                          fontWeight: FontWeight.w500),
                    ),
                    subtitle: Text(
                      'Reviews for 4 recipe',
                      style: GoogleFonts.poppins(
                          textStyle:
                              TextStyle(color: Colors.blueGrey, fontSize: 12)),
                    ),
                    trailing: Icon(Icons.keyboard_arrow_right),
                    onTap: () {
                      print('reviews');
                    },
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  ListTile(
                    title: Text(
                      'Settings',
                      style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w500)),
                    ),
                    subtitle: Text(
                      'Newsletter, Dark mode, Change Password',
                      style: GoogleFonts.poppins(
                          textStyle:
                              TextStyle(color: Colors.blueGrey, fontSize: 12)),
                    ),
                    trailing: Icon(Icons.keyboard_arrow_right),
                    onTap: () {
                      print('reviews');
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SettingsScreen()));
                    },
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: SubmitButton(
                      title: 'Logout',
                      onPressed: () => model.logout(),
                      isEnabled: true,
                      textColor: Colors.white,
                      buttonColor: Colors.red,
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
