abstract class DishDataSource {
  Future<void> postADish();

  Future<void> getMyDishes();

  Future<void> getDishById();

  Future<void> editDish();

  Future<void> deleteDish();

  Future<void> toggleFavouriteDish();

  Future<void> toggleLikeDish();
}
