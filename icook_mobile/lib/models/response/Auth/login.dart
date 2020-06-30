import 'dart:convert';

class LoginResponse {
  final String status;
  final String error;
  final Data data;
  LoginResponse({
    this.status,
    this.error,
    this.data,
  });

  LoginResponse copyWith({
    String status,
    String error,
    Data data,
  }) {
    return LoginResponse(
      status: status ?? this.status,
      error: error ?? this.error,
      data: data ?? this.data,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'status': status,
      'error': error,
      'data': data?.toMap(),
    };
  }

  static LoginResponse fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return LoginResponse(
      status: map['status'],
      error: map['error'],
      data: Data.fromMap(map['data']),
    );
  }

  String toJson() => json.encode(toMap());

  static LoginResponse fromJson(String source) => fromMap(json.decode(source));

  @override
  String toString() =>
      'LoginResponse(status: $status, error: $error, data: $data)';

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is LoginResponse &&
        o.status == status &&
        o.error == error &&
        o.data == data;
  }

  @override
  int get hashCode => status.hashCode ^ error.hashCode ^ data.hashCode;
}

class Data {
  final String userID;
  final String userName;
  final String email;
  final String token;
  Data({
    this.userID,
    this.userName,
    this.email,
    this.token,
  });

  Data copyWith({
    String userID,
    String userName,
    String email,
    String token,
  }) {
    return Data(
      userID: userID ?? this.userID,
      userName: userName ?? this.userName,
      email: email ?? this.email,
      token: token ?? this.token,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'user_id': userID,
      'user_name': userName,
      'email': email,
      'token': token,
    };
  }

  static Data fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return Data(
      userID: map['user_id'],
      userName: map['user_name'],
      email: map['email'],
      token: map['token'],
    );
  }

  String toJson() => json.encode(toMap());

  static Data fromJson(String source) => fromMap(json.decode(source));

  @override
  String toString() {
    return 'Data(userID: $userID, userName: $userName, email: $email, token: $token)';
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is Data &&
        o.userID == userID &&
        o.userName == userName &&
        o.email == email &&
        o.token == token;
  }

  @override
  int get hashCode {
    return userID.hashCode ^
        userName.hashCode ^
        email.hashCode ^
        token.hashCode;
  }
}
