abstract class AuthService {
  Future<void> login({String email, String password});

  Future<void> signUp(
      {String email, String password, String gender, String phoneNumber});

  Future<String> googleAuth();

  Future<String> facebookAuth();
}

class AuthServiceImpl extends AuthService {
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
  Future<void> login({String email, String password}) {
    // TODO: implement login
    throw UnimplementedError();
  }

  @override
  Future<void> signUp(
      {String email, String password, String gender, String phoneNumber}) {
    // TODO: implement signUp
    throw UnimplementedError();
  }
}
