import 'dart:convert';

import 'package:icook_mobile/models/response/Dish/dishitem.dart';

import 'package:collection/collection.dart';

class UserResponse {
  final String status;
  final String error;
  final Data data;
  UserResponse({
    this.status,
    this.error,
    this.data,
  });

  UserResponse copyWith({
    String status,
    String error,
    Data data,
  }) {
    return UserResponse(
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

  static UserResponse fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return UserResponse(
      status: map['status'],
      error: map['error'],
      data: Data.fromMap(map['data']),
    );
  }

  String toJson() => json.encode(toMap());

  static UserResponse fromJson(String source) => fromMap(json.decode(source));

  @override
  String toString() =>
      'UserResponse(status: $status, error: $error, data: $data)';

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is UserResponse &&
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
  final String userImage;
  final List<Dish> dishes;
  final List<dynamic> followers;
  final List<dynamic> following;
  final String id;
  final String email;
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
    this.userImage,
    this.dishes,
    this.followers,
    this.following,
    this.id,
    this.email,
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
    String userImage,
    List<Dish> dishes,
    List<dynamic> followers,
    List<dynamic> following,
    String id,
    String email,
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
      userImage: userImage ?? this.userImage,
      dishes: dishes ?? this.dishes,
      followers: followers ?? this.followers,
      following: following ?? this.following,
      id: id ?? this.id,
      email: email ?? this.email,
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
      'userImage': userImage,
      'dishes': dishes?.map((x) => x?.toMap())?.toList(),
      'followers': followers,
      'following': following,
      '_id': id,
      'email': email,
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
      userImage: map['userImage'],
      dishes: map['dishes'] == null ? null : List<Dish>.from(map['dishes']?.map((x) => Dish.fromMap(x))),
      followers: map['followers'] == null ? null :List<dynamic>.from(map['followers']),
      following: map['following'] == null ? null: List<dynamic>.from(map['following']),
      id: map['_id'],
      email: map['email'],
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
    return 'User(userId: $userId, gender: $gender, userImage: $userImage, dishes: $dishes, followers: $followers, following: $following, id: $id, email: $email, name: $name, phoneNumber: $phoneNumber, createdAt: $createdAt, updatedAt: $updatedAt, v: $v, followersCount: $followersCount, followingCount: $followingCount, dishesCount: $dishesCount, isFollowing: $isFollowing, me: $me)';
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;
    final listEquals = const DeepCollectionEquality().equals;

    return o is User &&
        listEquals(o.userId, userId) &&
        o.gender == gender &&
        o.userImage == userImage &&
        listEquals(o.dishes, dishes) &&
        listEquals(o.followers, followers) &&
        listEquals(o.following, following) &&
        o.id == id &&
        o.email == email &&
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
        userImage.hashCode ^
        dishes.hashCode ^
        followers.hashCode ^
        following.hashCode ^
        id.hashCode ^
        email.hashCode ^
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
