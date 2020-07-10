import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:icook_mobile/core/services/key_storage/key_storage_service.dart';
import 'package:icook_mobile/locator.dart';
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
    final key = locator<KeyStorageService>();
    return ViewModelBuilder<HomeScreenModel>.reactive(
      viewModelBuilder: () => HomeScreenModel(),
      onModelReady: (model) => model.init(),
      builder: (context, model, child) => Scaffold(
        key: model.scaffoldKey,
        body: SafeArea(
          child: EasyRefresh(
            enableControlFinishRefresh: true,
            onRefresh: () => model.init(),
            controller: model.easycontroller,
            child: SingleChildScrollView(
              controller: controller,
              child: Center(
                child: Container(
                  constraints: BoxConstraints(maxWidth: 600),
                  child: Column(
                    children: <Widget>[
                      SizedBox(height: 20),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ListTile(
                          onTap: () => model.editDetails(),
                          leading: Container(
                              width: 60,
                              height: 60,
                              decoration: new BoxDecoration(
                                  color: Theme.of(context).primaryColor,
                                  shape: BoxShape.circle,
                                  image: new DecorationImage(
                                    fit: BoxFit.cover,
                                    image: key.profileImageUrl.isEmpty
                                        ? AssetImage(
                                            'assets/images/chefavatar1.png')
                                        : CachedNetworkImageProvider(
                                            key.profileImageUrl),
                                  ))),
                          title: Text(
                            'Hi Chef ${model.username}',
                            style: GoogleFonts.poppins(
                                textStyle: TextStyle(
                                    color: Constants.kbuttonColor1,
                                    fontSize: 18),
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
                          margin: EdgeInsets.symmetric(
                              horizontal: 30, vertical: 20),
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
                                  direction: ShimmerDirection.ltr,
                                  period: Duration(seconds: 2),
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
                          itemCount: model.list.length,
                          itemBuilder: (context, index) =>
                              RecipeItem(dish: model.list[index]),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
