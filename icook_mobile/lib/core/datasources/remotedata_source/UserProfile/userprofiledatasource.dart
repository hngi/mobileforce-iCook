import 'package:icook_mobile/models/requests/Profile/updateprofile.dart';
import 'package:icook_mobile/models/response/UserProfile/getmyprofile.dart';
import 'package:icook_mobile/models/response/UserProfile/myfavouritedish.dart';
import 'package:icook_mobile/models/response/UserProfile/updateprofile.dart';
import 'package:icook_mobile/models/response/UserProfile/userauthdetails.dart';

abstract class UserProfileDataSource {
  ///Get my profile {Get}
  Future<GetMyProfileResponse> getMyProfile();

  ///user authentication profile{Get}
  Future<UserAuthDetailsResponse> userAuthProfile();

  ///Update profile{Patch}
  Future<UpdateProfileResponse> updateProfile(UpdateProfileRequest request);

  ///My favourite Dishes{Get}
  Future<MyFavouriteDishesResponse> myFavouriteDishes();
}
