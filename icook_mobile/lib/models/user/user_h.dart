import 'dart:convert';

import 'package:hive/hive.dart';
import 'package:icook_mobile/models/user/user.dart';

part 'user_h.g.dart';

/// A Hive Database compatible LocalUser Model
///   - @HiveType(typeId: unique) is necessary for each HiveObject
///   - @HiveField(unique) is necessary if you need the object to persist
@HiveType(typeId: 0)
class LocalUser extends HiveObject {
  @HiveField(0)
  final String name;

  @HiveField(1)
  final String email;

  @HiveField(2)
  final String token;

  @HiveField(3)
  final String userID;

  @HiveField(4)
  final String profileID;
  LocalUser({
    this.name,
    this.email,
    this.token,
    this.userID,
    this.profileID,
  });

  factory LocalUser.fromUserData(UserData data) {
    return LocalUser(
      userID: data.userID,
      email: data.email,
      token: data.token,
      profileID: data.profileID,
      name: data.name,
    );
  }

  LocalUser copyWith({
    String name,
    String email,
    String token,
    String userID,
    String profileID,
  }) {
    return LocalUser(
      name: name ?? this.name,
      email: email ?? this.email,
      token: token ?? this.token,
      userID: userID ?? this.userID,
      profileID: profileID ?? this.profileID,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'email': email,
      'token': token,
      'userID': userID,
      'profileID': profileID,
    };
  }

  static LocalUser fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return LocalUser(
      name: map['name'],
      email: map['email'],
      token: map['token'],
      userID: map['userID'],
      profileID: map['profileID'],
    );
  }

  String toJson() => json.encode(toMap());

  static LocalUser fromJson(String source) => fromMap(json.decode(source));

  @override
  String toString() {
    return 'LocalUser(name: $name, email: $email, token: $token, userID: $userID, profileID: $profileID)';
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is LocalUser &&
        o.name == name &&
        o.email == email &&
        o.token == token &&
        o.userID == userID &&
        o.profileID == profileID;
  }

  @override
  int get hashCode {
    return name.hashCode ^
        email.hashCode ^
        token.hashCode ^
        userID.hashCode ^
        profileID.hashCode;
  }
}
