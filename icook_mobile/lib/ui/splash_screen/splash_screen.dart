import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:icook_mobile/ui/widgets/k_button.dart';

import '../ui_helper.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image(
              image: AssetImage('assets/images/icook_logo.png'),
            ),
            SizedBox(height: 100),
            KButton(
                title: 'Get Started',
                buttonColor: Constants.kbuttonColor1,
                textColor: Colors.white),
          ],
        ),
      ),
    );
  }
}
