import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:icook_mobile/models/response/Dish/getmydishes.dart';
import 'package:icook_mobile/ui/home_page/home_page_model.dart';
import 'package:icook_mobile/ui/home_screen/home_model.dart';
import 'package:icook_mobile/ui/shared/recipe_item.dart';
import 'package:icook_mobile/ui/shared/recipe_item_shim.dart';
import 'package:icook_mobile/ui/shared/state_responsive.dart';
import 'package:icook_mobile/ui/ui_helper.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';
import 'package:stacked/stacked.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  ScrollController controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeScreenModel>.reactive(
      viewModelBuilder: () => HomeScreenModel(),
      onModelReady: (model) => model.init(),
      builder: (context, model, child) => Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            controller: controller,
            child: Column(
              children: <Widget>[
                SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListTile(
                    leading: Container(
                        width: 60,
                        height: 90,
                        decoration: new BoxDecoration(
                            shape: BoxShape.circle,
                            image: new DecorationImage(
                                fit: BoxFit.cover,
                                image: new AssetImage(
                                    'assets/images/chefavatar1.png')))),
                    title: Text(
                      'Hi Chef ${model.username}',
                      style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                              color: Constants.kbuttonColor1, fontSize: 18),
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Provider.of<HomePageModel>(context, listen: false)
                        .changeTab(1);
                  },
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(24)),
                    child: Row(children: <Widget>[
                      Icon(Icons.search),
                      SizedBox(width: 10),
                      Text('Search', style: GoogleFonts.poppins())
                    ]),
                  ),
                ),
                StateResponsive(
                  state: model.state,
                  noDataAvailableWidget: Center(
                    child: Text('No Posts'),
                  ),
                  busyWidget: ListView.builder(
                      shrinkWrap: true,
                      itemCount: 6,
                      itemBuilder: (context, index) => Shimmer.fromColors(
                            direction: ShimmerDirection.rtl,
                            period: Duration(seconds: 6),
                            baseColor: Colors.grey[400],
                            highlightColor: Colors.white,
                            child: RecipeItemShim(
                              chefImage: "assets/images/avatar.png",
                              chefName: "",
                              foodName: "",
                              foodDescription: "",
                              likes: 0,
                              foodImage: [
                                "assets/images/amala.jpeg",
                                "assets/images/recipes.png",
                                "assets/images/amala.jpeg"
                              ],
                            ),
                          )),
                  idleWidget: Center(
                    child: Text('No Posts'),
                  ),
                  dataFetchedWidget: ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: 6,
                    itemBuilder: (context, index) => RecipeItem(
                      dish: Dishe(
                          name: 'Garri',
                          likesCount: 76,
                          isLiked: false,
                          recipe: [
                            'cook and boil',
                            'bless the meal',
                            'cook and boil',
                            'cook and boil',
                            'cook and boil',
                            'cook and boil',
                            'cook and boil',
                          ],
                          dishImages: [
                            'assets/images/amala.jpeg',
                            'assets/images/fufu.jpeg'
                          ],
                          ingredients: [
                            '1 spoon of garri',
                            '2 basins of sugar',
                            '2 basins of sugar',
                            '2 basins of sugar',
                            '2 basins of sugar',
                            '2 basins of sugar',
                            '2 basins of sugar',
                            '2 basins of sugar',
                          ],
                          healthBenefits: [
                            'Good for overcoming Athrirtis'
                          ]),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
