import 'package:icook_mobile/core/constants/api_routes.dart';
import 'package:icook_mobile/core/datasources/remotedata_source/Search/searchdatasource.dart';
import 'package:icook_mobile/core/services/Api/ApiService.dart';
import 'package:icook_mobile/core/services/key_storage/key_storage_service.dart';
import 'package:icook_mobile/models/response/Search/searchdish.dart';
import 'package:icook_mobile/models/response/Search/searchuser.dart';

import '../../../../locator.dart';

class SearchDataSourceImpl extends SearchDataSource {
  final api = locator<ApiService>();
  final key = locator<KeyStorageService>();
  @override
  Future<SearchDishResponse> searchForDish(String name) async {
    String token = key.token ?? "";
    final headers = <String, String>{
      "Accept": "application/json",
      "Content-Type": "application/x-www-form-urlencoded",
      "Authorization": "$token"
    };

    final route = '${ApiRoutes.searchdish}$name';
    try {
      final response = await api.gett(route, headers);
      print('get dishes response $response');
      SearchDishResponse res = SearchDishResponse.fromJson(response);
      print(res);
      return res;
    } catch (e) {
      print('exception $e');
      throw (e);
    }
  }

  @override
  Future<SearchUserResponse> searchForUser(String name) async {
    String token = key.token ?? "";
    final headers = <String, String>{
      "Accept": "application/json",
      "Content-Type": "application/x-www-form-urlencoded",
      "Authorization": "$token"
    };

    final route = '${ApiRoutes.searchuser}/$name';
    try {
      final response = await api.gett(route, headers);
      print('get dishes response $response');
      SearchUserResponse res = SearchUserResponse.fromJson(response);
      print(res);
      return res;
    } catch (e) {
      print('exception $e');
      throw (e);
    }
  }
}
