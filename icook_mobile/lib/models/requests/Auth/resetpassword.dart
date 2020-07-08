import 'dart:convert';

class ResetPasswordRequest {
  final String password;
  final String email;
  ResetPasswordRequest({
    this.password,
    this.email,
  });

  ResetPasswordRequest copyWith({
    String password,
    String email,
  }) {
    return ResetPasswordRequest(
      password: password ?? this.password,
      email: email ?? this.email,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'password': password,
      'email': email,
    };
  }

  static ResetPasswordRequest fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return ResetPasswordRequest(
      password: map['password'],
      email: map['email'],
    );
  }

  String toJson() => json.encode(toMap());

  static ResetPasswordRequest fromJson(String source) =>
      fromMap(json.decode(source));

  @override
  String toString() =>
      'ResetPasswordRequest(password: $password, email: $email)';

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is ResetPasswordRequest &&
        o.password == password &&
        o.email == email;
  }

  @override
  int get hashCode => password.hashCode ^ email.hashCode;
}
