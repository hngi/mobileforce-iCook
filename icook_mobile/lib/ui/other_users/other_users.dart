import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:icook_mobile/models/response/Dish/dishitem.dart';
import 'package:icook_mobile/ui/edit_profile_screen/edit_profile.dart';
import 'package:icook_mobile/ui/other_users/userprofilemode.dart';
import 'package:icook_mobile/ui/profile_screen/constant.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:icook_mobile/ui/shared/recipe_item.dart';
import 'package:icook_mobile/ui/shared/state_responsive.dart';
import 'package:icook_mobile/ui/shared/sumbitButton.dart';
import 'package:stacked/stacked.dart';

import '../ui_helper.dart';

class OtherUserInfoScreen extends StatelessWidget {
  final String userId;

  OtherUserInfoScreen({Key key, this.userId}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<UserProfileModel>.reactive(
      viewModelBuilder: () => UserProfileModel(),
      onModelReady: (model) => model.init(userId),
      builder: (context, model, child) => Scaffold(
        key: model.scaffoldKey,
        appBar: AppBar(
          title: Text("Profile"),
        ),
        body: StateResponsive(
            state: model.state,
            noDataAvailableWidget: Text("Couldn't Fetch Profile"),
            busyWidget: Center(
              child: CircularProgressIndicator(),
            ),
            idleWidget: Center(child: Text("Oops something went wrong!!!")),
            dataFetchedWidget: SmallScreen()),
      ),
    );
  }
}

class SmallScreen extends ViewModelWidget<UserProfileModel> {
  const SmallScreen({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, UserProfileModel model) {
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
                          image:
                              CachedNetworkImageProvider(model.user.userImage),
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
                                      model.user.followersCount.toString(),
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
                                      model.user.dishesCount.toString(),
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
                                      model.user.followingCount.toString(),
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
                          title: model.isFollow ? "UnFollow" : "Follow",
                          isEnabled: true,
                          onPressed: () => model.toogleFollow(),
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
              "Chef ${model.user.name}",
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
              model.user.email,
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
              model.user.gender,
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

          ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: model.list.length,
            itemBuilder: (context, index) =>
                RecipeItem(dish: model.list[index]),
          ),

          SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}
