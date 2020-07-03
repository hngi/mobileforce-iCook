import 'dart:convert';

import 'package:icook_mobile/core/constants/api_routes.dart';
import 'package:icook_mobile/core/datasources/remotedata_source/DIsh/dishdatasource.dart';
import 'package:icook_mobile/core/services/Api/ApiService.dart';
import 'package:icook_mobile/core/services/key_storage/key_storage_service.dart';
import 'package:icook_mobile/locator.dart';
import 'package:icook_mobile/models/requests/Dish/postdish.dart';
import 'package:icook_mobile/models/response/Dish/dishresponse.dart';

class DishDataSourceImpl extends DishDataSource {
  final key = locator<KeyStorageService>();
  final api = locator<ApiService>();
  @override
  Future<dynamic> deleteDish(String id) async {
    String token = key.token ?? "";
    final headers = <String, String>{
      "Accept": "application/json",
      "Content-Type": "application/x-www-form-urlencoded",
      "Authorization": "$token"
    };

    final route = '${ApiRoutes.dish}/:$id';
    try {
      final response = await api.delete(route, headers);
      print('delete dish response $response');

      return response;
    } catch (e) {
      print('exception $e');
      throw (e);
    }
  }

  @override
  Future<dynamic> editDish(PostDIshBody body, String id) async {
    String token = key.token ?? "";
    final headers = <String, String>{
      "Accept": "application/json",
      "Content-Type": "application/x-www-form-urlencoded",
      "Authorization": "$token"
    };

    final route = '${ApiRoutes.dish}/:$id';
    try {
      final response = await api.patch(route, headers, body.toMap());
      print('edit dish response $response');

      return response;
    } catch (e) {
      print('exception $e');
      throw (e);
    }
  }

  @override
  Future<dynamic> getDishById(String id) async {
    String token = key.token ?? "";
    final headers = <String, String>{
      "Accept": "application/json",
      "Content-Type": "application/x-www-form-urlencoded",
      "Authorization": "$token"
    };

    final route = '${ApiRoutes.dish}/:$id';
    try {
      final response = await api.gett(route, headers);
      print('get dish by $id response $response');

      return response;
    } catch (e) {
      print('exception $e');
      throw (e);
    }
  }

  @override
  Future<DishResponse> getDishes({String after}) async {
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
      DishResponse respons = DishResponse.fromJson(response);
      print("edited   $respons");

      return respons;
    } catch (e) {
      print('exception $e');
      throw (e);
    }
  }

  @override
  Future<DishResponse> getMyDishes() async {
    String token = key.token ?? "";
    final headers = <String, String>{
      "Accept": "application/json",
      "Content-Type": "application/x-www-form-urlencoded",
      "Authorization": "$token"
    };

    final route = '${ApiRoutes.myprofile}/dishes';
    try {
      final response = await api.gett(route, headers);
      print('get dishes response $response');
      DishResponse respons = DishResponse.fromJson(response);
      print("edited   $respons");

      return respons;
    } catch (e) {
      print('exception $e');
      throw (e);
    }
  }

  @override
  Future<dynamic> postADish(PostDIshBody body) async {
    String token = key.token ?? "";
    final headers = <String, String>{
      "Accept": "application/json",
      "Content-Type": "application/json",
      "Authorization": "$token"
    };

    final route = '${ApiRoutes.dish}';
    print(body.toJson());
    try {
      final response = await api.post(route, headers, body.toJson());
      print('post response $response');

      return jsonDecode(response);
    } catch (e) {
      print('exception $e');
      throw (e);
    }
  }

  @override
  Future<dynamic> toggleFavouriteDish(String id) async {
    String token = key.token ?? "";
    final headers = <String, String>{
      "Accept": "application/json",
      "Content-Type": "application/x-www-form-urlencoded",
      "Authorization": "$token"
    };

    final queryParams = <String, String>{"id": "$id"};
    print(queryParams);

    var uri = Uri.https('${ApiRoutes.tooglefavouritedish}',
        '/api/v1/dishes/toggle_favourite/$id');
    print(uri.toString());
    try {
      final response = await api.put(uri, headers);
      print('favourite response $response');

      return response;
    } catch (e) {
      print('exception $e');
      throw (e);
    }
  }

  @override
  Future<dynamic> toggleLikeDish(String id) async {
    String token = key.token ?? "";
    final headers = <String, String>{
      "Accept": "application/json",
      "Content-Type": "application/x-www-form-urlencoded",
      "Authorization": "$token"
    };

    final queryParams = <String, String>{"id": "$id"};
    print(queryParams);

    var uri = Uri.https(
        '${ApiRoutes.tooglelikedish}', '/api/v1/dishes/toggle_like/$id');

    print(uri.toString());
    try {
      final response = await api.put(uri, headers);
      print('like response $response');

      return response;
    } catch (e) {
      print('exception $e');
      throw (e);
    }
  }
}
