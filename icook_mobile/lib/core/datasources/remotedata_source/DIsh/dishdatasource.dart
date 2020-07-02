import 'package:icook_mobile/models/requests/Dish/postdish.dart';

abstract class DishDataSource {
  Future<dynamic> postADish(PostDIshBody body);

Future<dynamic> getDishes({String after});

  Future<dynamic> getDishById(String id);

  Future<dynamic> editDish(PostDIshBody body, String id);

  Future<dynamic> deleteDish(String id);

  Future<dynamic> toggleFavouriteDish(String id);

  Future<dynamic> toggleLikeDish(String id);
}
