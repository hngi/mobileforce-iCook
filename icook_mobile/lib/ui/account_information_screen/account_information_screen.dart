import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:icook_mobile/ui/account_information_screen/accountmodel.dart';
import 'package:icook_mobile/ui/edit_profile_screen/edit_profile.dart';
import 'package:icook_mobile/ui/profile_screen/constant.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:icook_mobile/ui/shared/recipe_item.dart';
import 'package:icook_mobile/ui/shared/recipe_item_shim.dart';
import 'package:icook_mobile/ui/shared/state_responsive.dart';
import 'package:icook_mobile/ui/shared/sumbitButton.dart';
import 'package:icook_mobile/ui/ui_helper.dart';
import 'package:shimmer/shimmer.dart';
import 'package:stacked/stacked.dart';

class AccountInformationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<AccountModel>.nonReactive(
      viewModelBuilder: () => AccountModel(),
      onModelReady: (model) => model.init(),
      builder: (context, model, child) => Scaffold(
        appBar: AppBar(
          title: Text("My Profile"),
        ),
        body: SmallScreen(),
      ),
    );
  }
}

class SmallScreen extends ViewModelWidget<AccountModel> {
  const SmallScreen({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, AccountModel model) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Row(
              children: <Widget>[
                Container(
                  height: 70,
                  width: 70,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          image: AssetImage("assets/images/chefavatar1.png"),
                          fit: BoxFit.cover)),
                ),
                SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: Container(
                    constraints: BoxConstraints(maxHeight: 120),
                    child: Column(
                      children: <Widget>[
                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisSize: MainAxisSize.min,
                                  children: <Widget>[
                                    Text(
                                      "4.4k",
                                      style: GoogleFonts.poppins(
                                        fontStyle: FontStyle.normal,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14,
                                      ),
                                    ),
                                    Text(
                                      "Followers",
                                      style: GoogleFonts.poppins(
                                        fontStyle: FontStyle.normal,
                                        fontSize: 14,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisSize: MainAxisSize.min,
                                  children: <Widget>[
                                    Text(
                                      "13",
                                      style: GoogleFonts.poppins(
                                        fontStyle: FontStyle.normal,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14,
                                      ),
                                    ),
                                    Text(
                                      "Recipies",
                                      style: GoogleFonts.poppins(
                                        fontStyle: FontStyle.normal,
                                        fontSize: 14,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisSize: MainAxisSize.min,
                                  children: <Widget>[
                                    Text(
                                      "2.2k",
                                      style: GoogleFonts.poppins(
                                        fontStyle: FontStyle.normal,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14,
                                      ),
                                    ),
                                    Text(
                                      "Following",
                                      style: GoogleFonts.poppins(
                                        fontStyle: FontStyle.normal,
                                        fontSize: 14,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        SubmitButton(
                          title: "Edit information",
                          isEnabled: true,
                          onPressed: () => model.editDetails(),
                          textColor: Colors.white,
                          buttonColor: Constants.kbuttonColor1,
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),

          SizedBox(
            height: 26,
          ),

          //Chef name and bio

          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Text(
              "Chef ${model.username}",
              style: GoogleFonts.poppins(
                fontStyle: FontStyle.normal,
                fontWeight: FontWeight.w500,
                fontSize: 18,
              ),
            ),
          ),

          SizedBox(
            height: 8,
          ),

          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Text(
              "Bio:",
              style: GoogleFonts.poppins(
                fontStyle: FontStyle.normal,
                fontWeight: FontWeight.w500,
                fontSize: 18,
                color: Color(0xff578DDE),
              ),
            ),
          ),

          SizedBox(
            height: 5,
          ),

          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Text(
              "A good food is the language of kings.",
              style: GoogleFonts.poppins(
                fontStyle: FontStyle.normal,
                fontWeight: FontWeight.normal,
                fontSize: 16,
              ),
            ),
          ),

          SizedBox(
            height: 20,
          ),

          Center(
            child: Text(
              "My Dishes",
              style: GoogleFonts.poppins(
                fontStyle: FontStyle.normal,
                fontWeight: FontWeight.w600,
                fontSize: 18,
                color: Color(0xff578DDE),
              ),
            ),
          ),

          SizedBox(
            height: 12,
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

          SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}
