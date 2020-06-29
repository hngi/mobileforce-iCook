import 'dart:convert';

class SignUpResponse {
  final String status;
  final String error;
  final String message;
  final Data data;
  SignUpResponse({
    this.status,
    this.error,
    this.message,
    this.data,
  });

  SignUpResponse copyWith({
    String status,
    String error,
    String message,
    Data data,
  }) {
    return SignUpResponse(
      status: status ?? this.status,
      error: error ?? this.error,
      message: message ?? this.message,
      data: data ?? this.data,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'status': status,
      'error': error,
      'message': message,
      'data': data?.toMap(),
    };
  }

  static SignUpResponse fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
  
    return SignUpResponse(
      status: map['status'],
      error: map['error'],
      message: map['message'],
      data: Data.fromMap(map['data']),
    );
  }

  String toJson() => json.encode(toMap());

  static SignUpResponse fromJson(String source) => fromMap(json.decode(source));

  @override
  String toString() {
    return 'SignUpResponse(status: $status, error: $error, message: $message, data: $data)';
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;
  
    return o is SignUpResponse &&
      o.status == status &&
      o.error == error &&
      o.message == message &&
      o.data == data;
  }

  @override
  int get hashCode {
    return status.hashCode ^
      error.hashCode ^
      message.hashCode ^
      data.hashCode;
  }
}

class Data {
  final String token;
  final String userID;
  final String profileID;
  final String email;
  final String name;
  Data({
    this.token,
    this.userID,
    this.profileID,
    this.email,
    this.name,
  });

  Data copyWith({
    String token,
    String userID,
    String profileID,
    String email,
    String name,
  }) {
    return Data(
      token: token ?? this.token,
      userID: userID ?? this.userID,
      profileID: profileID ?? this.profileID,
      email: email ?? this.email,
      name: name ?? this.name,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'token': token,
      'userID': userID,
      'profileID': profileID,
      'email': email,
      'name': name,
    };
  }

  static Data fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
  
    return Data(
      token: map['token'],
      userID: map['userID'],
      profileID: map['profileID'],
      email: map['email'],
      name: map['name'],
    );
  }

  String toJson() => json.encode(toMap());

  static Data fromJson(String source) => fromMap(json.decode(source));

  @override
  String toString() {
    return 'Data(token: $token, userID: $userID, profileID: $profileID, email: $email, name: $name)';
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;
  
    return o is Data &&
      o.token == token &&
      o.userID == userID &&
      o.profileID == profileID &&
      o.email == email &&
      o.name == name;
  }

  @override
  int get hashCode {
    return token.hashCode ^
      userID.hashCode ^
      profileID.hashCode ^
      email.hashCode ^
      name.hashCode;
  }
}