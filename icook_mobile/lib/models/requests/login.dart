import 'dart:convert';

class LoginRequest {
  String email;
  String password;
  LoginRequest({
    this.email,
    this.password,
  });

  LoginRequest copyWith({
    String email,
    String password,
  }) {
    return LoginRequest(
      email: email ?? this.email,
      password: password ?? this.password,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'email': email,
      'password': password,
    };
  }

  static LoginRequest fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return LoginRequest(
      email: map['email'],
      password: map['password'],
    );
  }

  String toJson() => json.encode(toMap());

  static LoginRequest fromJson(String source) => fromMap(json.decode(source));

  @override
  String toString() => 'LoginRequest(email: $email, password: $password)';

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is LoginRequest && o.email == email && o.password == password;
  }

  @override
  int get hashCode => email.hashCode ^ password.hashCode;
}
