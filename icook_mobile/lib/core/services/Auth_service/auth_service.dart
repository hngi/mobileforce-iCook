import 'package:icook_mobile/core/constants/api_routes.dart';
import 'package:icook_mobile/core/services/Api/ApiService.dart';
import 'package:icook_mobile/models/requests/login.dart';
import 'package:icook_mobile/models/requests/signup.dart';
import 'package:icook_mobile/models/response/login.dart';
import 'package:icook_mobile/models/response/signup.dart';
import '../../../locator.dart';

abstract class AuthService {
  ///User signin with local details{Post}
  Future<LoginResponse> login(LoginRequest request);

  ///User signup with local details{Post}
  Future<SignUpResponse> signUp(SignUpRequest request);

  ///User signup/login with google{Post}
  Future<String> googleAuth();

  ///user signup/login with facebook {Post}
  Future<String> facebookAuth();

  ///update user password{Put}
  Future<void> updatePassword();

  ///forget password{Post}
  Future<void> forgotPassword();

  ///reset password with token{patch}
  Future<void> resetPasswordWithToken();

  ///unlink Google oauth{patch}
  Future<void> unlinkGoogle();

  ///unlink facebook oauth{patch}
  Future<void> unlinkFacebook();
}

class AuthServiceImpl extends AuthService {
  final api = locator<ApiService>();

  @override
  Future<String> facebookAuth() {
    // TODO: implement facebookAuth
    throw UnimplementedError();
  }

  @override
  Future<String> googleAuth() {
    // TODO: implement googleAuth
    throw UnimplementedError();
  }

  @override
  Future<LoginResponse> login(LoginRequest request) async {
    final headers = <String, String>{
      "Accept": "application/json",
      "Content-Type": "application/x-www-form-urlencoded"
    };
    try {
      final response =
          await api.post('${ApiRoutes.signin}', headers, request.toMap());
      print('signin response $response');
      LoginResponse user = LoginResponse.fromJson(response);
      print(user);
      return user;
    } catch (e) {
      print('exception $e');
      throw (e);
    }
  }

  @override
  Future<SignUpResponse> signUp(SignUpRequest request) async {
    final headers = <String, String>{
      "Accept": "application/json",
      "Content-Type": "application/x-www-form-urlencoded"
    };
    try {
      final response =
          await api.post('${ApiRoutes.signup}', headers, request.toMap());
      print('signup response $response');
      SignUpResponse user = SignUpResponse.fromJson(response);
      print(user);
      return user;
    } catch (e) {
      throw (e);
    }
  }

  @override
  Future<void> forgotPassword() {
    // TODO: implement forgotPassword
    throw UnimplementedError();
  }

  @override
  Future<void> updatePassword() {
    // TODO: implement updatePassword
    throw UnimplementedError();
  }

  @override
  Future<void> resetPasswordWithToken() {
    // TODO: implement resetPasswordWithToken
    throw UnimplementedError();
  }

  @override
  Future<void> unlinkFacebook() {
    // TODO: implement unlinkFacebook
    throw UnimplementedError();
  }

  @override
  Future<void> unlinkGoogle() {
    // TODO: implement unlinkGoogle
    throw UnimplementedError();
  }
}
