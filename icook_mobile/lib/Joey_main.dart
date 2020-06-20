import 'package:flutter/material.dart';
import 'package:transformer_page_view/transformer_page_view.dart';

void main() => runApp(MyApp());
class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'iCook',
      theme: ThemeData(
        // This is the theme of the application.
       
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'iCook Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final String title;
  MyHomePage({this.title});
  @override
  MyHomePageState createState() {
    return new MyHomePageState();
  }
}

class MyHomePageState extends State<MyHomePage> {
  int _slideIndex = 0;

  final List<String> images = [
    "assets/image1.png",
    "assets/image2.png",
    "assets/image3.png",
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
        loop: true,
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
                        new ParallaxContainer(
                          child: new Image.asset(
                            images[info.index],
                            fit: BoxFit.contain,
                            height: 350,
                          ),
                          position: info.position,
                          translationFactor: 400.0,
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
                        new Container(
                          width: 284.0,
                          height: 40.0,
                          decoration: BoxDecoration(
                            gradient: new LinearGradient(
                                colors: [
                                  Colors.blueAccent[100],
                                  Colors.blueAccent[100],
                                ],
                                begin: Alignment(0.5, -1.0),
                                end: Alignment(0.5, 1.0)
                            ),
                            borderRadius: new BorderRadius.circular(12.0),
                          ),
                          child: new Material(
                            child: MaterialButton(
                              child: Text('Create an account',
                                style: Theme.of(context).textTheme.button.copyWith(color: Colors.white),
                              ),
                              onPressed: (){},
                              highlightColor: Colors.blue.withOpacity(0.5),
                              splashColor: Colors.white30.withOpacity(0.5),
                            ),
                            color: Colors.transparent,
                            borderRadius: new BorderRadius.circular(12.0),
                          ),
                        ),
                        SizedBox(
                          height: 20.0,
                        ),

                        new Container(
                          width: 284.0,
                          height: 40.0,
                          decoration: BoxDecoration(
                            borderRadius: new BorderRadius.circular(12.0),
                            border: Border.all(color: Colors.grey, width: 1.0),
                            color: Colors.grey,
                          ),
                          child: new Material(
                            child: MaterialButton(
                              child: Text('Login',
                                style: Theme.of(context).textTheme.button.copyWith(color: Colors.white),
                              ),
                              onPressed: (){},
                              highlightColor: Colors.blueAccent,
                              splashColor: Colors.blueAccent,
                            ),
                            color: Colors.transparent,
                            borderRadius: new BorderRadius.circular(12.0),
                          ),
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
      body: transformerPageView,
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


