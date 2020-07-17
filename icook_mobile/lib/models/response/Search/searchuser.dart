import 'dart:convert';

import 'package:collection/collection.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

class SearchUserResponse {
  final String status;
  final String error;
  final Data data;
  SearchUserResponse({
    this.status,
    this.error,
    this.data,
  });

  SearchUserResponse copyWith({
    String status,
    String error,
    Data data,
  }) {
    return SearchUserResponse(
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

  static SearchUserResponse fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
  
    return SearchUserResponse(
      status: map['status'],
      error: map['error'],
      data: Data.fromMap(map['data']),
    );
  }

  String toJson() => json.encode(toMap());

  static SearchUserResponse fromJson(String source) => fromMap(json.decode(source));

  @override
  String toString() => 'SearchUserResponse(status: $status, error: $error, data: $data)';

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;
  
    return o is SearchUserResponse &&
      o.status == status &&
      o.error == error &&
      o.data == data;
  }

  @override
  int get hashCode => status.hashCode ^ error.hashCode ^ data.hashCode;
}

class Data {
  final int total;
  final int count;
  final int after;
  final List<Result> result;
  Data({
    this.total,
    this.count,
    this.after,
    this.result,
  });

  Data copyWith({
    int total,
    int count,
    int after,
    List<Result> result,
  }) {
    return Data(
      total: total ?? this.total,
      count: count ?? this.count,
      after: after ?? this.after,
      result: result ?? this.result,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'total': total,
      'count': count,
      'after': after,
      'result': result?.map((x) => x?.toMap())?.toList(),
    };
  }

  static Data fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
  
    return Data(
      total: map['total']?.toInt(),
      count: map['count']?.toInt(),
      after: map['after']?.toInt(),
      result: List<Result>.from(map['result']?.map((x) => Result.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  static Data fromJson(String source) => fromMap(json.decode(source));

  @override
  String toString() {
    return 'Data(total: $total, count: $count, after: $after, result: $result)';
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;
    final listEquals = const DeepCollectionEquality().equals;
  
    return o is Data &&
      o.total == total &&
      o.count == count &&
      o.after == after &&
      listEquals(o.result, result);
  }

  @override
  int get hashCode {
    return total.hashCode ^
      count.hashCode ^
      after.hashCode ^
      result.hashCode;
  }
}

class Result {
  final List<String> userId;
  final String gender;
  final String id;
  final String email;
  final String name;
  final String createdAt;
  final String updatedAt;
  final int v;
  final String phoneNumber;
  final String userImage;
  final int followersCount;
  final int followingCount;
  final int dishesCount;
  final bool isFollowing;
  final bool me;
  Result({
    this.userId,
    this.gender,
    this.id,
    this.email,
    this.name,
    this.createdAt,
    this.updatedAt,
    this.v,
    this.phoneNumber,
    this.followersCount,
    this.followingCount,
    this.dishesCount,
    this.isFollowing,
     this.userImage,
    this.me,
  });

  Result copyWith({
    List<String> userId,
    String gender,
    String id,
    String email,
    String name,
    String createdAt,
    String updatedAt,
    int v,
    String userImage,
    String phoneNumber,
    int followersCount,
    int followingCount,
    int dishesCount,
    bool isFollowing,
    bool me,
  }) {
    return Result(
      userId: userId ?? this.userId,
      gender: gender ?? this.gender,
      id: id ?? this.id,
      email: email ?? this.email,
      name: name ?? this.name,
      userImage: userImage ?? this.userImage,
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
      'email': email,
      'name': name,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
      '__v': v,
      'phoneNumber': phoneNumber,
      'followersCount': followersCount,
    "userImage" : userImage,
      'followingCount': followingCount,
      'dishesCount': dishesCount,
      'isFollowing': isFollowing,
      'me': me,
    };
  }

  static Result fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
  
    return Result(
      userId: List<String>.from(map['userId']),
      gender: map['gender'],
      id: map['_id'],
      email: map['email'],
      name: map['name'],
      userImage: map['userImage'],
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

  static Result fromJson(String source) => fromMap(json.decode(source));

  @override
  String toString() {
    return 'Result(userId: $userId, gender: $gender, id: $id, email: $email, name: $name, createdAt: $createdAt, updatedAt: $updatedAt, v: $v, phoneNumber: $phoneNumber, followersCount: $followersCount, followingCount: $followingCount, dishesCount: $dishesCount, isFollowing: $isFollowing, me: $me)';
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;
    final listEquals = const DeepCollectionEquality().equals;
  
    return o is Result &&
      listEquals(o.userId, userId) &&
      o.gender == gender &&
      o.id == id &&
      o.email == email &&
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
      email.hashCode ^
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