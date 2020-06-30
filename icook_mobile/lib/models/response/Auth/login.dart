import 'dart:convert';

class LoginResponse {
  String status;
  String error;
  Data data;
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
  String message;
  String userId;
  String token;
  Data({
    this.message,
    this.userId,
    this.token,
  });

  Data copyWith({
    String message,
    String userId,
    String token,
  }) {
    return Data(
      message: message ?? this.message,
      userId: userId ?? this.userId,
      token: token ?? this.token,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'message': message,
      'user_id': userId,
      'token': token,
    };
  }

  static Data fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return Data(
      message: map['message'],
      userId: map['user_id'],
      token: map['token'],
    );
  }

  String toJson() => json.encode(toMap());

  static Data fromJson(String source) => fromMap(json.decode(source));

  @override
  String toString() =>
      'Data(message: $message, userId: $userId, token: $token)';

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is Data &&
        o.message == message &&
        o.userId == userId &&
        o.token == token;
  }

  @override
  int get hashCode => message.hashCode ^ userId.hashCode ^ token.hashCode;
}
