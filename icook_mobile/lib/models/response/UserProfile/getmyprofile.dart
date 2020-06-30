import 'dart:convert';

import 'package:collection/collection.dart';

class GetMyProfileResponse {
  final String status;
  final String error;
  final Data data;
  GetMyProfileResponse({
    this.status,
    this.error,
    this.data,
  });

  GetMyProfileResponse copyWith({
    String status,
    String error,
    Data data,
  }) {
    return GetMyProfileResponse(
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

  static GetMyProfileResponse fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return GetMyProfileResponse(
      status: map['status'],
      error: map['error'],
      data: Data.fromMap(map['data']),
    );
  }

  String toJson() => json.encode(toMap());

  static GetMyProfileResponse fromJson(String source) =>
      fromMap(json.decode(source));

  @override
  String toString() =>
      'GetMyProfileResponse(status: $status, error: $error, data: $data)';

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is GetMyProfileResponse &&
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
  final List<String> userId;
  final String gender;
  final List<dynamic> dishes;
  final String id;
  final String email;
  final String name;
  final String phoneNumber;
  final String createdAt;
  final String updatedAt;
  final int v;
  Me({
    this.userId,
    this.gender,
    this.dishes,
    this.id,
    this.email,
    this.name,
    this.phoneNumber,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  Me copyWith({
    List<String> userId,
    String gender,
    List<dynamic> dishes,
    String id,
    String email,
    String name,
    String phoneNumber,
    String createdAt,
    String updatedAt,
    int v,
  }) {
    return Me(
      userId: userId ?? this.userId,
      gender: gender ?? this.gender,
      dishes: dishes ?? this.dishes,
      id: id ?? this.id,
      email: email ?? this.email,
      name: name ?? this.name,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      v: v ?? this.v,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'userId': userId,
      'gender': gender,
      'dishes': dishes,
      'id': id,
      'email': email,
      'name': name,
      'phoneNumber': phoneNumber,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
      'v': v,
    };
  }

  static Me fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return Me(
      userId: List<String>.from(map['userId']),
      gender: map['gender'],
      dishes: List<dynamic>.from(map['dishes']),
      id: map['_id'],
      email: map['email'],
      name: map['name'],
      phoneNumber: map['phoneNumber'],
      createdAt: map['createdAt'],
      updatedAt: map['updatedAt'],
      v: map['__v']?.toInt(),
    );
  }

  String toJson() => json.encode(toMap());

  static Me fromJson(String source) => fromMap(json.decode(source));

  @override
  String toString() {
    return 'Me(userId: $userId, gender: $gender, dishes: $dishes, id: $id, email: $email, name: $name, phoneNumber: $phoneNumber, createdAt: $createdAt, updatedAt: $updatedAt, v: $v)';
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;
    final listEquals = const DeepCollectionEquality().equals;

    return o is Me &&
        listEquals(o.userId, userId) &&
        o.gender == gender &&
        listEquals(o.dishes, dishes) &&
        o.id == id &&
        o.email == email &&
        o.name == name &&
        o.phoneNumber == phoneNumber &&
        o.createdAt == createdAt &&
        o.updatedAt == updatedAt &&
        o.v == v;
  }

  @override
  int get hashCode {
    return userId.hashCode ^
        gender.hashCode ^
        dishes.hashCode ^
        id.hashCode ^
        email.hashCode ^
        name.hashCode ^
        phoneNumber.hashCode ^
        createdAt.hashCode ^
        updatedAt.hashCode ^
        v.hashCode;
  }
}
