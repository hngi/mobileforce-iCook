import 'package:flutter/material.dart';
import 'package:icook_mobile/ui/shared/k_button.dart';
import 'package:icook_mobile/ui/splash_screen/splash_model.dart';
import 'package:stacked/stacked.dart';

import '../ui_helper.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SplashModel>.nonReactive(
      viewModelBuilder: () => SplashModel(),
      onModelReady: (model) => model.init(),
      builder: (context, model, child) => Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Image(
                      image: AssetImage('assets/images/logo.png'),
                    ),
                    Image(
                      image: AssetImage('assets/images/iCook.png'),
                    ),
                  ],
                ),
              ),
              KButton(
                  onPressed: () => model.getStarted(),
                  title: 'Get Started',
                  buttonColor: Constants.kbuttonColor1,
                  textColor: Colors.white),
              SizedBox(height: 100,)
            ],
          ),
        ),
      ),
    );
  }
}
