import 'dart:convert';

class ResetPasswordRequest {
  final String password;
  ResetPasswordRequest({
    this.password,
  });

  ResetPasswordRequest copyWith({
    String password,
  }) {
    return ResetPasswordRequest(
      password: password ?? this.password,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'password': password,
    };
  }

  static ResetPasswordRequest fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
  
    return ResetPasswordRequest(
      password: map['password'],
    );
  }

  String toJson() => json.encode(toMap());

  static ResetPasswordRequest fromJson(String source) => fromMap(json.decode(source));

  @override
  String toString() => 'ResetPasswordRequest(password: $password)';

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;
  
    return o is ResetPasswordRequest &&
      o.password == password;
  }

  @override
  int get hashCode => password.hashCode;
}