import 'package:icook_mobile/models/requests/Dish/postdish.dart';
import 'package:icook_mobile/models/response/Dish/dishresponse.dart';

abstract class DishDataSource {
  Future<dynamic> postADish(PostDIshBody body);

  Future<DishResponse> getDishes({String after});

  Future<dynamic> getDishById(String id);

  Future<dynamic> editDish(PostDIshBody body, String id);

  Future<dynamic> deleteDish(String id);

  Future<dynamic> toggleFavouriteDish(String id);

  Future<dynamic> toggleLikeDish(String id);
  Future<DishResponse> getMyDishes();
}
