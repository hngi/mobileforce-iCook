import 'package:flutter/material.dart';
import 'package:icook_mobile/core/constants/view_routes.dart';
import 'package:icook_mobile/ui/home_page/home_page.dart';
import 'package:icook_mobile/ui/shared/k_button.dart';
import 'package:transformer_page_view/transformer_page_view.dart';

import '../ui_helper.dart';

class OnboardingScreen extends StatefulWidget {
  final String title;
  OnboardingScreen({this.title});
  @override
  OnboardingScreenState createState() {
    return new OnboardingScreenState();
  }
}

class OnboardingScreenState extends State<OnboardingScreen> {
  int _slideIndex = 0;

  final List<String> images = [
    "assets/images/image1.png",
    "assets/images/image2.png",
    "assets/images/image3.png",
  ];

  final List<String> text0 = [
    "Find the foods you love",
    "Capture Hearts",
    "Share your recipes",
  ];

  final List<String> text1 = [
    "Learn new receipes from other chefs and create that food you love. ",
    "Nothing says home like the smell of baking",
    "Share your unique cooking receipe with a host of other chefs.",
  ];

  final IndexController controller = IndexController();

  @override
  Widget build(BuildContext context) {
    TransformerPageView transformerPageView = TransformerPageView(
        pageSnapping: true,
        onPageChanged: (index) {
          setState(() {
            this._slideIndex = index;
          });
        },
        loop: false,
        controller: controller,
        transformer: new PageTransformerBuilder(
            builder: (Widget child, TransformInfo info) {
          return new Material(
            color: Colors.white,
            elevation: 8.0,
            textStyle: new TextStyle(color: Colors.white),
            borderRadius: new BorderRadius.circular(12.0),
            child: new Container(
              alignment: Alignment.center,
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(18.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(
                      height: 30.0,
                    ),
                    Expanded(
                      child: new ParallaxContainer(
                        child: new Image.asset(
                          images[info.index],
                          fit: BoxFit.contain,
                          height: 350,
                        ),
                        position: info.position,
                        translationFactor: 400.0,
                      ),
                    ),
                    SizedBox(
                      height: 30.0,
                    ),
                    new ParallaxContainer(
                      position: info.position,
                      translationFactor: 500.0,
                      child: Dots(
                        controller: controller,
                        slideIndex: _slideIndex,
                        numberOfDots: images.length,
                      ),
                    ),
                    SizedBox(
                      height: 40.0,
                    ),
                    new ParallaxContainer(
                      child: new Text(
                        text0[info.index],
                        style: new TextStyle(
                            color: Colors.blueAccent,
                            fontSize: 28.0,
                            fontFamily: 'Work sans',
                            fontWeight: FontWeight.bold),
                      ),
                      position: info.position,
                      opacityFactor: .8,
                      translationFactor: 400.0,
                    ),
                    /*   SizedBox(
                          height: 45.0,
                        ),*/

                    new ParallaxContainer(
                      child: new Text(
                        text1[info.index],
                        textAlign: TextAlign.center,
                        style: new TextStyle(
                            color: Colors.black,
                            fontSize: 18.0,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.normal),
                      ),
                      position: info.position,
                      translationFactor: 300.0,
                    ),
                    SizedBox(
                      height: 55.0,
                    ),
                  ],
                ),
              ),
            ),
          );
        }),
        itemCount: 3);

    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: <Widget>[
          Expanded(child: transformerPageView),
          KButton(
              onPressed: () {},
              title: 'Create an account',
              buttonColor: Constants.kbuttonColor1,
              textColor: Colors.white),
          SizedBox(
            height: 10.0,
          ),
          KButton(
              onPressed: () {
                Navigator.popAndPushNamed(context, ViewRoutes.home);
              },
              title: 'Login',
              buttonColor: Constants.kbuttonColor2,
              textColor: Colors.black),
          SizedBox(
            height: 55.0,
          ),
        ],
      ),
    );
  }
}

class Dots extends StatelessWidget {
  final IndexController controller;
  final int slideIndex;
  final int numberOfDots;

  Dots({this.controller, this.slideIndex, this.numberOfDots});

  Widget _activeSlide(int index) {
    return GestureDetector(
      onTap: () {
        print('Tapped');
        // controller.move(index);
      },
      child: new Container(
        child: Padding(
          padding: EdgeInsets.only(left: 8.0, right: 8.0),
          child: Container(
            width: 10.0,
            height: 10.0,
            decoration: BoxDecoration(
              color: Colors.blueAccent.withOpacity(.8),
              borderRadius: BorderRadius.circular(10.0),
            ),
          ),
        ),
      ),
    );
  }

  Widget _inactiveSlide(int index) {
    return GestureDetector(
      onTap: () {
        controller.move(index);
      },
      child: new Container(
        child: Padding(
          padding: EdgeInsets.only(left: 5.0, right: 5.0),
          child: Container(
            width: 10.0,
            height: 10.0,
            decoration: BoxDecoration(
                color: Colors.grey.withOpacity(0.7),
                borderRadius: BorderRadius.circular(10.0)),
          ),
        ),
      ),
    );
  }

  List<Widget> _generateDots() {
    List<Widget> dots = [];
    for (int i = 0; i < numberOfDots; i++) {
      dots.add(i == slideIndex ? _activeSlide(i) : _inactiveSlide(i));
    }
    return dots;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: _generateDots(),
    ));
  }
}
