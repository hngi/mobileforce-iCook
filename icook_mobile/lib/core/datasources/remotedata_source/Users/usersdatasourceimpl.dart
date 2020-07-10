import 'package:icook_mobile/core/constants/api_routes.dart';
import 'package:icook_mobile/core/datasources/remotedata_source/Users/usersdatasource.dart';
import 'package:icook_mobile/core/services/Api/ApiService.dart';
import 'package:icook_mobile/core/services/key_storage/key_storage_service.dart';

import '../../../../locator.dart';

class UsersDataSourceImpl extends UsersDataSource {
  final key = locator<KeyStorageService>();
  final api = locator<ApiService>();

  @override
  Future<dynamic> followUser(String id) async {
    String token = key.token ?? "";
    final headers = <String, String>{"Authorization": "$token"};

    print(headers);

    var uri = Uri.https(
        '${ApiRoutes.tooglefavouritedish}', '/api/v1/users/follow/$id');
    print(uri.toString());
    try {
      final response = await api.put(uri, headers);
      print('follow response $response');

      return response;
    } catch (e) {
      print('exception $e');
      throw (e);
    }
  }

  @override
  Future<void> getAUser() {
    // TODO: implement getAUser
    throw UnimplementedError();
  }

  @override
  Future<void> getAllUsers() {
    // TODO: implement getAllUsers
    throw UnimplementedError();
  }

  @override
  Future<void> getFollowers() {
    // TODO: implement getFollowers
    throw UnimplementedError();
  }

  @override
  Future<void> getFollowings() {
    // TODO: implement getFollowings
    throw UnimplementedError();
  }

  @override
  Future<dynamic> unfollowUser(String id) async {
    String token = key.token ?? "";
    final headers = <String, String>{"Authorization": "$token"};
    print(headers);

    var uri = Uri.https(
        '${ApiRoutes.tooglefavouritedish}', '/api/v1/users/unfollow/$id');
    print(uri.toString());
    try {
      final response = await api.put(uri, headers);
      print('unfollow response $response');

      return response;
    } catch (e) {
      print('exception $e');
      throw (e);
    }
  }
}
