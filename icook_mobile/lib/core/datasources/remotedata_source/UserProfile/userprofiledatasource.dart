abstract class UserProfileDataSource {
  ///Get my profile {Get}
  Future<void> getMyProfile();

  ///user authentication profile{Get}
  Future<void> userAuthProfile();

  ///Update profile{Patch}
  Future<void> updateProfile();

  ///My favourite Dishes{Get}
  Future<void> myFavouriteDishes();
}
