import 'dart:convert';

import 'package:collection/collection.dart';

class UpdateProfileResponse {
  final String status;
  final Data data;
  final String error;
  UpdateProfileResponse({
    this.status,
    this.data,
    this.error,
  });

  UpdateProfileResponse copyWith({
    String status,
    Data data,
    Error error,
  }) {
    return UpdateProfileResponse(
      status: status ?? this.status,
      data: data ?? this.data,
      error: error ?? this.error,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'status': status,
      'data': data?.toMap(),
      'error': error,
    };
  }

  static UpdateProfileResponse fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return UpdateProfileResponse(
      status: map['status'],
      data: Data.fromMap(map['data']),
      error: map['error'],
    );
  }

  String toJson() => json.encode(toMap());

  static UpdateProfileResponse fromJson(String source) =>
      fromMap(json.decode(source));

  @override
  String toString() =>
      'UpdateProfileResponse(status: $status, data: $data, error: $error)';

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is UpdateProfileResponse &&
        o.status == status &&
        o.data == data &&
        o.error == error;
  }

  @override
  int get hashCode => status.hashCode ^ data.hashCode ^ error.hashCode;
}

class Data {
  final List<String> userId;
  final String gender;
  final List<dynamic> dishes;
  final List<dynamic> favourites;
  final List<dynamic> followers;
  final List<dynamic> following;
  final String id;
  final String email;
  final String name;
  final String phoneNumber;
  final String createdAt;
  final String updatedAt;
  final int v;
  final String bio;
  final String country;
  Data({
    this.userId,
    this.gender,
    this.dishes,
    this.favourites,
    this.followers,
    this.following,
    this.id,
    this.email,
    this.name,
    this.phoneNumber,
    this.createdAt,
    this.updatedAt,
    this.v,
    this.bio,
    this.country,
  });

  Data copyWith({
    List<String> userId,
    String gender,
    List<dynamic> dishes,
    List<dynamic> favourites,
    List<dynamic> followers,
    List<dynamic> following,
    String id,
    String email,
    String name,
    String phoneNumber,
    String createdAt,
    String updatedAt,
    int v,
    String bio,
    String country,
  }) {
    return Data(
      userId: userId ?? this.userId,
      gender: gender ?? this.gender,
      dishes: dishes ?? this.dishes,
      favourites: favourites ?? this.favourites,
      followers: followers ?? this.followers,
      following: following ?? this.following,
      id: id ?? this.id,
      email: email ?? this.email,
      name: name ?? this.name,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      v: v ?? this.v,
      bio: bio ?? this.bio,
      country: country ?? this.country,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'userId': userId,
      'gender': gender,
      'dishes': dishes,
      'favourites': favourites,
      'followers': followers,
      'following': following,
      '_id': id,
      'email': email,
      'name': name,
      'phoneNumber': phoneNumber,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
      '__v': v,
      'bio': bio,
      'country': country,
    };
  }

  static Data fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return Data(
      userId: List<String>.from(map['userId']),
      gender: map['gender'],
      dishes: List<dynamic>.from(map['dishes']),
      favourites: List<dynamic>.from(map['favourites']),
      followers: List<dynamic>.from(map['followers']),
      following: List<dynamic>.from(map['following']),
      id: map['_id'],
      email: map['email'],
      name: map['name'],
      phoneNumber: map['phoneNumber'],
      createdAt: map['createdAt'],
      updatedAt: map['updatedAt'],
      v: map['__v']?.toInt(),
      bio: map['bio'],
      country: map['country'],
    );
  }

  String toJson() => json.encode(toMap());

  static Data fromJson(String source) => fromMap(json.decode(source));

  @override
  String toString() {
    return 'Data(userId: $userId, gender: $gender, dishes: $dishes, favourites: $favourites, followers: $followers, following: $following, id: $id, email: $email, name: $name, phoneNumber: $phoneNumber, createdAt: $createdAt, updatedAt: $updatedAt, v: $v, bio: $bio, country: $country)';
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;
    final listEquals = const DeepCollectionEquality().equals;

    return o is Data &&
        listEquals(o.userId, userId) &&
        o.gender == gender &&
        listEquals(o.dishes, dishes) &&
        listEquals(o.favourites, favourites) &&
        listEquals(o.followers, followers) &&
        listEquals(o.following, following) &&
        o.id == id &&
        o.email == email &&
        o.name == name &&
        o.phoneNumber == phoneNumber &&
        o.createdAt == createdAt &&
        o.updatedAt == updatedAt &&
        o.v == v &&
        o.bio == bio &&
        o.country == country;
  }

  @override
  int get hashCode {
    return userId.hashCode ^
        gender.hashCode ^
        dishes.hashCode ^
        favourites.hashCode ^
        followers.hashCode ^
        following.hashCode ^
        id.hashCode ^
        email.hashCode ^
        name.hashCode ^
        phoneNumber.hashCode ^
        createdAt.hashCode ^
        updatedAt.hashCode ^
        v.hashCode ^
        bio.hashCode ^
        country.hashCode;
  }
}
