import 'package:icook_mobile/models/requests/Profile/updateprofile.dart';
import 'package:icook_mobile/models/response/UserProfile/getmyprofile.dart';
import 'package:icook_mobile/models/response/UserProfile/myfavouritedish.dart';
import 'package:icook_mobile/models/response/UserProfile/updateprofile.dart';
import 'package:icook_mobile/models/response/UserProfile/userauthdetails.dart';

abstract class UserProfileDataSource {
  ///Get my profile {Get}
  Future<dynamic> getMyProfile();

  ///user authentication profile{Get}
  Future<dynamic> userAuthProfile();

  ///Update profile{Patch}
  Future<dynamic> updateProfile(UpdateProfileRequest request);

  ///My favourite Dishes{Get}
  Future<dynamic> myFavouriteDishes();
}
