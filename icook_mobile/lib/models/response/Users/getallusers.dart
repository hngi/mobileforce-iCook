import 'dart:convert';

import 'package:collection/collection.dart';

class GetAllUsersResponse {
  final String status;
  final String error;
  final int results;
  final Data data;
  GetAllUsersResponse({
    this.status,
    this.error,
    this.results,
    this.data,
  });

  GetAllUsersResponse copyWith({
    String status,
    String error,
    int results,
    Data data,
  }) {
    return GetAllUsersResponse(
      status: status ?? this.status,
      error: error ?? this.error,
      results: results ?? this.results,
      data: data ?? this.data,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'status': status,
      'error': error,
      'results': results,
      'data': data?.toMap(),
    };
  }

  static GetAllUsersResponse fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return GetAllUsersResponse(
      status: map['status'],
      error: map['error'],
      results: map['results']?.toInt(),
      data: Data.fromMap(map['data']),
    );
  }

  String toJson() => json.encode(toMap());

  static GetAllUsersResponse fromJson(String source) => fromMap(json.decode(source));

  @override
  String toString() {
    return 'GetAllUsersResponse(status: $status, error: $error, results: $results, data: $data)';
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is GetAllUsersResponse &&
        o.status == status &&
        o.error == error &&
        o.results == results &&
        o.data == data;
  }

  @override
  int get hashCode {
    return status.hashCode ^ error.hashCode ^ results.hashCode ^ data.hashCode;
  }
}

class Data {
  final List<User> users;
  Data({
    this.users,
  });

  Data copyWith({
    List<User> users,
  }) {
    return Data(
      users: users ?? this.users,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'users': users?.map((x) => x?.toMap())?.toList(),
    };
  }

  static Data fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return Data(
      users: List<User>.from(map['users']?.map((x) => User.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  static Data fromJson(String source) => fromMap(json.decode(source));

  @override
  String toString() => 'Data(users: $users)';

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;
    final listEquals = const DeepCollectionEquality().equals;

    return o is Data && listEquals(o.users, users);
  }

  @override
  int get hashCode => users.hashCode;
}

class User {
  final List<String> userId;
  final String gender;
  final String id;
  final String name;
  final String phoneNumber;
  final String createdAt;
  final String updatedAt;
  final int v;
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
    this.phoneNumber,
    this.createdAt,
    this.updatedAt,
    this.v,
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
    String phoneNumber,
    String createdAt,
    String updatedAt,
    int v,
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
      phoneNumber: phoneNumber ?? this.phoneNumber,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      v: v ?? this.v,
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
      'phoneNumber': phoneNumber,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
      '__v': v,
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
      phoneNumber: map['phoneNumber'],
      createdAt: map['createdAt'],
      updatedAt: map['updatedAt'],
      v: map['__v']?.toInt(),
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
    return 'User(userId: $userId, gender: $gender, id: $id, name: $name, phoneNumber: $phoneNumber, createdAt: $createdAt, updatedAt: $updatedAt, v: $v, followersCount: $followersCount, followingCount: $followingCount, dishesCount: $dishesCount, isFollowing: $isFollowing, me: $me)';
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
        o.phoneNumber == phoneNumber &&
        o.createdAt == createdAt &&
        o.updatedAt == updatedAt &&
        o.v == v &&
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
        phoneNumber.hashCode ^
        createdAt.hashCode ^
        updatedAt.hashCode ^
        v.hashCode ^
        followersCount.hashCode ^
        followingCount.hashCode ^
        dishesCount.hashCode ^
        isFollowing.hashCode ^
        me.hashCode;
  }
}
