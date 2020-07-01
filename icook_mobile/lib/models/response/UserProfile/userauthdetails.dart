import 'dart:convert';

import 'package:collection/collection.dart';

class UserAuthDetailsResponse {
  final String status;
  final String error;
  final Data data;
  UserAuthDetailsResponse({
    this.status,
    this.error,
    this.data,
  });

  UserAuthDetailsResponse copyWith({
    String status,
    String error,
    Data data,
  }) {
    return UserAuthDetailsResponse(
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

  static UserAuthDetailsResponse fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return UserAuthDetailsResponse(
      status: map['status'],
      error: map['error'],
      data: Data.fromMap(map['data']),
    );
  }

  String toJson() => json.encode(toMap());

  static UserAuthDetailsResponse fromJson(String source) =>
      fromMap(json.decode(source));

  @override
  String toString() =>
      'UserAuthDetailsResponse(status: $status, error: $error, data: $data)';

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is UserAuthDetailsResponse &&
        o.status == status &&
        o.error == error &&
        o.data == data;
  }

  @override
  int get hashCode => status.hashCode ^ error.hashCode ^ data.hashCode;
}

class Data {
  final Me me;
  Data({
    this.me,
  });

  Data copyWith({
    Me me,
  }) {
    return Data(
      me: me ?? this.me,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'me': me?.toMap(),
    };
  }

  static Data fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return Data(
      me: Me.fromMap(map['me']),
    );
  }

  String toJson() => json.encode(toMap());

  static Data fromJson(String source) => fromMap(json.decode(source));

  @override
  String toString() => 'Data(me: $me)';

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is Data && o.me == me;
  }

  @override
  int get hashCode => me.hashCode;
}

class Me {
  final Local local;
  final List<String> profile;
  final String id;
  final String method;
  final String createdAt;
  final String updatedAt;
  final int v;
  Me({
    this.local,
    this.profile,
    this.id,
    this.method,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  Me copyWith({
    Local local,
    List<String> profile,
    String id,
    String method,
    String createdAt,
    String updatedAt,
    int v,
  }) {
    return Me(
      local: local ?? this.local,
      profile: profile ?? this.profile,
      id: id ?? this.id,
      method: method ?? this.method,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      v: v ?? this.v,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'local': local?.toMap(),
      'profile': profile,
      '_id': id,
      'method': method,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
      '__v': v,
    };
  }

  static Me fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return Me(
      local: Local.fromMap(map['local']),
      profile: List<String>.from(map['profile']),
      id: map['_id'],
      method: map['method'],
      createdAt: map['createdAt'],
      updatedAt: map['updatedAt'],
      v: map['__v']?.toInt(),
    );
  }

  String toJson() => json.encode(toMap());

  static Me fromJson(String source) => fromMap(json.decode(source));

  @override
  String toString() {
    return 'Me(local: $local, profile: $profile, id: $id, method: $method, createdAt: $createdAt, updatedAt: $updatedAt, v: $v)';
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;
    final listEquals = const DeepCollectionEquality().equals;

    return o is Me &&
        o.local == local &&
        listEquals(o.profile, profile) &&
        o.id == id &&
        o.method == method &&
        o.createdAt == createdAt &&
        o.updatedAt == updatedAt &&
        o.v == v;
  }

  @override
  int get hashCode {
    return local.hashCode ^
        profile.hashCode ^
        id.hashCode ^
        method.hashCode ^
        createdAt.hashCode ^
        updatedAt.hashCode ^
        v.hashCode;
  }
}

class Local {
  final String email;
  final String password;
  Local({
    this.email,
    this.password,
  });

  Local copyWith({
    String email,
    String password,
  }) {
    return Local(
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

  static Local fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return Local(
      email: map['email'],
      password: map['password'],
    );
  }

  String toJson() => json.encode(toMap());

  static Local fromJson(String source) => fromMap(json.decode(source));

  @override
  String toString() => 'Local(email: $email, password: $password)';

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is Local && o.email == email && o.password == password;
  }

  @override
  int get hashCode => email.hashCode ^ password.hashCode;
}
