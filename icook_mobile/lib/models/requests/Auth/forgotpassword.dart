import 'dart:convert';

class ForgotPassRequest {
  final String email;
  ForgotPassRequest({
    this.email,
  });

  ForgotPassRequest copyWith({
    String email,
  }) {
    return ForgotPassRequest(
      email: email ?? this.email,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'email': email,
    };
  }

  static ForgotPassRequest fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
  
    return ForgotPassRequest(
      email: map['email'],
    );
  }

  String toJson() => json.encode(toMap());

  static ForgotPassRequest fromJson(String source) => fromMap(json.decode(source));

  @override
  String toString() => 'ForgotPassRequest(email: $email)';

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;
  
    return o is ForgotPassRequest &&
      o.email == email;
  }

  @override
  int get hashCode => email.hashCode;
}