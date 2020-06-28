class ApiRoutes {
  ApiRoutes._();

  static const baseUrl = 'https://avengers-icook.herokuapp.com/api/v1';
  static const signin = '$baseUrl/authenticate/signin';
  static const signup = '$baseUrl/authenticate/signup';
  static const googleauth = '$baseUrl/authenticate/oauth/google';
}
