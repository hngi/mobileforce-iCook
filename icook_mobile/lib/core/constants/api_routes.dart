class ApiRoutes {
  ApiRoutes._();

  static const baseUrl = 'https://floating-plains-18946.herokuapp.com/api/v1';

  ///Authorizaation
  static const signin = '$baseUrl/authenticate/signin';
  static const signup = '$baseUrl/authenticate/signup';
  static const googleauth = '$baseUrl/authenticate/oauth/google';
  static const facebookauth = '$baseUrl/authenticate/oauth/facebook';
  static const updatepassword = '$baseUrl/authenticate/updatepassword';
  static const forgotpassword = '$baseUrl/authenticate/forgotPassword';
  static const confirmToken = '$baseUrl/authenticate/confirmToken';
  static const resetPassword = '$baseUrl/authenticate/resetPassword';
  static const unlinkGoogle = '$baseUrl/authenticate/unlink/google';
  static const unlinkFacebook = '$baseUrl/authenticate/unlink/facebook';

  ///User Profile
  static const myprofile = '$baseUrl/me';
  static const userauthprofile = '$baseUrl/me/auth';
  static const updateprofile = '$baseUrl/me/update';
  static const myfavourites = '$baseUrl/me/favourites';
  static const uploadprofile = '$baseUrl/me/upload_photo';

  ///Users
  static const getallusers = '$baseUrl/users';
  static const getuser = '$baseUrl/users';
  static const followuser = '$baseUrl/users/follow';
  static const getFollowers = '$baseUrl/users/followers';
  static const getFollowing = '$baseUrl/users/following/';
  static const unfollow = '$baseUrl/users/unfollow';

  ///Dish
  static const postdish = '$baseUrl/dishes';
  static const getmydishes = '$baseUrl/dishes';
  static const dish = '$baseUrl/dishes';
  static const tooglefavouritedish = 'floating-plains-18946.herokuapp.com';
  static const tooglelikedish = 'floating-plains-18946.herokuapp.com';

  ///Search
  static const searchuser = '$baseUrl/search?type=person&name=';
  static const searchdish = '$baseUrl/search?type=dish&name=';


  //Comments
  static const comments = '$baseUrl/dishes/comments';
}
