import 'package:icook_mobile/core/constants/api_routes.dart';
import 'package:icook_mobile/core/datasources/remotedata_source/UserProfile/userprofiledatasource.dart';
import 'package:icook_mobile/core/services/Api/ApiService.dart';
import 'package:icook_mobile/core/services/key_storage/key_storage_service.dart';
import 'package:icook_mobile/models/response/UserProfile/userauthdetails.dart';
import 'package:icook_mobile/models/response/UserProfile/updateprofile.dart';
import 'package:icook_mobile/models/response/UserProfile/myfavouritedish.dart';
import 'package:icook_mobile/models/response/UserProfile/getmyprofile.dart';
import 'package:icook_mobile/models/requests/Profile/updateprofile.dart';

import '../../../../locator.dart';

class UserProfileDataSourceImpl extends UserProfileDataSource {
  final key = locator<KeyStorageService>();
  final api = locator<ApiService>();
  @override
  Future<GetMyProfileResponse> getMyProfile() async {
    String token = key.token ?? "";
    final headers = <String, String>{
      "Accept": "application/json",
      "Content-Type": "application/x-www-form-urlencoded",
      "Authorization": "$token"
    };

    final route = '${ApiRoutes.dish}';
    try {
      final response = await api.gett(route, headers);
      print('get dishes response $response');
      GetMyProfileResponse res = GetMyProfileResponse.fromJson(response);
      print(res);
      return res;
    } catch (e) {
      print('exception $e');
      throw (e);
    }
  }

  @override
  Future<MyFavouriteDishesResponse> myFavouriteDishes() async {
    String token = key.token ?? "";
    final headers = <String, String>{
      "Accept": "application/json",
      "Content-Type": "application/x-www-form-urlencoded",
      "Authorization": "$token"
    };

    final route = '${ApiRoutes.myfavourites}';
    try {
      final response = await api.gett(route, headers);
      print('get dishes response $response');
      MyFavouriteDishesResponse res =
          MyFavouriteDishesResponse.fromJson(response);
      print(res);
      return res;
    } catch (e) {
      print('exception $e');
      throw (e);
    }
  }

  @override
  Future<UpdateProfileResponse> updateProfile(
      UpdateProfileRequest request) async {
    String token = key.token ?? "";
    final headers = <String, String>{
      "Accept": "application/json",
      "Content-Type": "application/x-www-form-urlencoded",
      "Authorization": "$token"
    };

    final route = '${ApiRoutes.updateprofile}';
    try {
      final response = await api.patch(route, headers, request.toMap());
      print('get dishes response $response');
      UpdateProfileResponse res = UpdateProfileResponse.fromJson(response);
      print(res);
      return res;
    } catch (e) {
      print('exception $e');
      throw (e);
    }
  }

  @override
  Future<UserAuthDetailsResponse> userAuthProfile() async {
    String token = key.token ?? "";
    final headers = <String, String>{
      "Accept": "application/json",
      "Content-Type": "application/x-www-form-urlencoded",
      "Authorization": "$token"
    };

    final route = '${ApiRoutes.userauthprofile}';
    try {
      final response = await api.gett(route, headers);
      print('get dishes response $response');
      UserAuthDetailsResponse res = UserAuthDetailsResponse.fromJson(response);
      print(res);
      return res;
    } catch (e) {
      print('exception $e');
      throw (e);
    }
  }
}
