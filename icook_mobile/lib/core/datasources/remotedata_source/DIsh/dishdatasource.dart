import 'package:icook_mobile/models/requests/Dish/postdish.dart';
import 'package:icook_mobile/models/response/Dish/deletedish.dart';
import 'package:icook_mobile/models/response/Dish/editdish.dart';
import 'package:icook_mobile/models/response/Dish/favouritedish.dart';
import 'package:icook_mobile/models/response/Dish/getdishbyid.dart';
import 'package:icook_mobile/models/response/Dish/getmydishes.dart';
import 'package:icook_mobile/models/response/Dish/likedish.dart';
import 'package:icook_mobile/models/response/Dish/postadish.dart';

abstract class DishDataSource {
  Future<PostDishResponse> postADish(PostDIshBody body);

Future<GetMyDishesResponse> getDishes({String after});

  Future<GetDIshByIdResponse> getDishById(String id);

  Future<EditDishResponse> editDish(PostDIshBody body, String id);

  Future<DeleteDIshResponse> deleteDish(String id);

  Future<FavouriteDishResponse> toggleFavouriteDish(String id);

  Future<LikeDIshResponse> toggleLikeDish(String id);
}
