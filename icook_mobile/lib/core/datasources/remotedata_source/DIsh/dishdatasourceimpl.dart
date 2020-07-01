import 'package:icook_mobile/core/constants/api_routes.dart';
import 'package:icook_mobile/core/datasources/remotedata_source/DIsh/dishdatasource.dart';
import 'package:icook_mobile/core/services/Api/ApiService.dart';
import 'package:icook_mobile/core/services/key_storage/key_storage_service.dart';
import 'package:icook_mobile/locator.dart';
import 'package:icook_mobile/models/response/Dish/postadish.dart';
import 'package:icook_mobile/models/response/Dish/likedish.dart';
import 'package:icook_mobile/models/response/Dish/getmydishes.dart';
import 'package:icook_mobile/models/response/Dish/getdishbyid.dart';
import 'package:icook_mobile/models/response/Dish/favouritedish.dart';
import 'package:icook_mobile/models/response/Dish/editdish.dart';
import 'package:icook_mobile/models/response/Dish/deletedish.dart';
import 'package:icook_mobile/models/requests/Dish/postdish.dart';

class DishDataSourceImpl extends DishDataSource {
  final key = locator<KeyStorageService>();
  final api = locator<ApiService>();
  @override
  Future<DeleteDIshResponse> deleteDish(String id) async {
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
      DeleteDIshResponse res = DeleteDIshResponse.fromJson(response);
      print(res);
      return res;
    } catch (e) {
      print('exception $e');
      throw (e);
    }
  }

  @override
  Future<EditDishResponse> editDish(PostDIshBody body, String id) async {
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
      EditDishResponse res = EditDishResponse.fromJson(response);
      print(res);
      return res;
    } catch (e) {
      print('exception $e');
      throw (e);
    }
  }

  @override
  Future<GetDIshByIdResponse> getDishById(String id) async {
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
      GetDIshByIdResponse res = GetDIshByIdResponse.fromJson(response);
      print(res);
      return res;
    } catch (e) {
      print('exception $e');
      throw (e);
    }
  }

  @override
  Future<GetMyDishesResponse> getDishes(String after) async {
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
      GetMyDishesResponse res = GetMyDishesResponse.fromJson(response);
      print(res);
      return res;
    } catch (e) {
      print('exception $e');
      throw (e);
    }
  }

  @override
  Future<PostDishResponse> postADish(PostDIshBody body) async {
    String token = key.token ?? "";
    final headers = <String, String>{
      "Accept": "application/json",
      "Content-Type": "application/x-www-form-urlencoded",
      "Authorization": "$token"
    };

    final route = '${ApiRoutes.dish}';
    try {
      final response = await api.post(route, headers, body.toMap());
      print('signin response $response');
      PostDishResponse res = PostDishResponse.fromJson(response);
      print(res);
      return res;
    } catch (e) {
      print('exception $e');
      throw (e);
    }
  }

  @override
  Future<FavouriteDishResponse> toggleFavouriteDish(String id) async {
    String token = key.token ?? "";
    final headers = <String, String>{
      "Accept": "application/json",
      "Content-Type": "application/x-www-form-urlencoded",
      "Authorization": "$token"
    };

    final route = '${ApiRoutes.dish}/:$id';
    try {
      final response = await api.put(route, headers);
      print('signin response $response');
      FavouriteDishResponse res = FavouriteDishResponse.fromJson(response);
      print(res);
      return res;
    } catch (e) {
      print('exception $e');
      throw (e);
    }
  }

  @override
  Future<LikeDIshResponse> toggleLikeDish(String id) async {
    String token = key.token ?? "";
    final headers = <String, String>{
      "Accept": "application/json",
      "Content-Type": "application/x-www-form-urlencoded",
      "Authorization": "$token"
    };

    final route = '${ApiRoutes.dish}/:$id';
    try {
      final response = await api.put(route, headers);
      print('signin response $response');
      LikeDIshResponse res = LikeDIshResponse.fromJson(response);
      print(res);
      return res;
    } catch (e) {
      print('exception $e');
      throw (e);
    }
  }
}
