import 'dart:convert';

import 'package:collection/collection.dart';

class GetAUserResponse {
  final String status;
  final String error;
  final Data data;
  GetAUserResponse({
    this.status,
    this.error,
    this.data,
  });

  GetAUserResponse copyWith({
    String status,
    String error,
    Data data,
  }) {
    return GetAUserResponse(
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

  static GetAUserResponse fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return GetAUserResponse(
      status: map['status'],
      error: map['error'],
      data: Data.fromMap(map['data']),
    );
  }

  String toJson() => json.encode(toMap());

  static GetAUserResponse fromJson(String source) => fromMap(json.decode(source));

  @override
  String toString() => 'GetAUserResponse(status: $status, error: $error, data: $data)';

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is GetAUserResponse &&
        o.status == status &&
        o.error == error &&
        o.data == data;
  }

  @override
  int get hashCode => status.hashCode ^ error.hashCode ^ data.hashCode;
}

class Data {
  final User user;
  Data({
    this.user,
  });

  Data copyWith({
    User user,
  }) {
    return Data(
      user: user ?? this.user,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'user': user?.toMap(),
    };
  }

  static Data fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return Data(
      user: User.fromMap(map['user']),
    );
  }

  String toJson() => json.encode(toMap());

  static Data fromJson(String source) => fromMap(json.decode(source));

  @override
  String toString() => 'Data(user: $user)';

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is Data && o.user == user;
  }

  @override
  int get hashCode => user.hashCode;
}

class User {
  final List<String> userId;
  final String gender;
  final String id;
  final String name;
  final String createdAt;
  final String updatedAt;
  final int v;
  final String phoneNumber;
  final int followersCount;
  final int followingCount;
  final int dishesCount;
  final bool isFollowing;
  final bool me;
  User({
    this.userId,
    this.gender,
    this.id,
    this.name,
    this.createdAt,
    this.updatedAt,
    this.v,
    this.phoneNumber,
    this.followersCount,
    this.followingCount,
    this.dishesCount,
    this.isFollowing,
    this.me,
  });

  User copyWith({
    List<String> userId,
    String gender,
    String id,
    String name,
    String createdAt,
    String updatedAt,
    int v,
    String phoneNumber,
    int followersCount,
    int followingCount,
    int dishesCount,
    bool isFollowing,
    bool me,
  }) {
    return User(
      userId: userId ?? this.userId,
      gender: gender ?? this.gender,
      id: id ?? this.id,
      name: name ?? this.name,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      v: v ?? this.v,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      followersCount: followersCount ?? this.followersCount,
      followingCount: followingCount ?? this.followingCount,
      dishesCount: dishesCount ?? this.dishesCount,
      isFollowing: isFollowing ?? this.isFollowing,
      me: me ?? this.me,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'userId': userId,
      'gender': gender,
      '_id': id,
      'name': name,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
      '__v': v,
      'phoneNumber': phoneNumber,
      'followersCount': followersCount,
      'followingCount': followingCount,
      'dishesCount': dishesCount,
      'isFollowing': isFollowing,
      'me': me,
    };
  }

  static User fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return User(
      userId: List<String>.from(map['userId']),
      gender: map['gender'],
      id: map['_id'],
      name: map['name'],
      createdAt: map['createdAt'],
      updatedAt: map['updatedAt'],
      v: map['__v']?.toInt(),
      phoneNumber: map['phoneNumber'],
      followersCount: map['followersCount']?.toInt(),
      followingCount: map['followingCount']?.toInt(),
      dishesCount: map['dishesCount']?.toInt(),
      isFollowing: map['isFollowing'],
      me: map['me'],
    );
  }

  String toJson() => json.encode(toMap());

  static User fromJson(String source) => fromMap(json.decode(source));

  @override
  String toString() {
    return 'User(userId: $userId, gender: $gender, id: $id, name: $name, createdAt: $createdAt, updatedAt: $updatedAt, v: $v, phoneNumber: $phoneNumber, followersCount: $followersCount, followingCount: $followingCount, dishesCount: $dishesCount, isFollowing: $isFollowing, me: $me)';
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;
    final listEquals = const DeepCollectionEquality().equals;

    return o is User &&
        listEquals(o.userId, userId) &&
        o.gender == gender &&
        o.id == id &&
        o.name == name &&
        o.createdAt == createdAt &&
        o.updatedAt == updatedAt &&
        o.v == v &&
        o.phoneNumber == phoneNumber &&
        o.followersCount == followersCount &&
        o.followingCount == followingCount &&
        o.dishesCount == dishesCount &&
        o.isFollowing == isFollowing &&
        o.me == me;
  }

  @override
  int get hashCode {
    return userId.hashCode ^
        gender.hashCode ^
        id.hashCode ^
        name.hashCode ^
        createdAt.hashCode ^
        updatedAt.hashCode ^
        v.hashCode ^
        phoneNumber.hashCode ^
        followersCount.hashCode ^
        followingCount.hashCode ^
        dishesCount.hashCode ^
        isFollowing.hashCode ^
        me.hashCode;
  }
}
