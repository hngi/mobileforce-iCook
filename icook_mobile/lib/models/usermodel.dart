import 'dart:convert';

import 'package:collection/collection.dart';

class UserProfile {
  final String email;
  final String id;
  final String photoUrl;
  final String username;
  final String displayName;
  final String bio;
  final Map followers;
  final Map following;
  UserProfile({
    this.email,
    this.id,
    this.photoUrl,
    this.username,
    this.displayName,
    this.bio,
    this.followers,
    this.following,
  });



  UserProfile copyWith({
    String email,
    String id,
    String photoUrl,
    String username,
    String displayName,
    String bio,
    Map followers,
    Map following,
  }) {
    return UserProfile(
      email: email ?? this.email,
      id: id ?? this.id,
      photoUrl: photoUrl ?? this.photoUrl,
      username: username ?? this.username,
      displayName: displayName ?? this.displayName,
      bio: bio ?? this.bio,
      followers: followers ?? this.followers,
      following: following ?? this.following,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'email': email,
      'id': id,
      'photoUrl': photoUrl,
      'username': username,
      'displayName': displayName,
      'bio': bio,
      'followers': followers,
      'following': following,
    };
  }

  static UserProfile fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
  
    return UserProfile(
      email: map['email'],
      id: map['id'],
      photoUrl: map['photoUrl'],
      username: map['username'],
      displayName: map['displayName'],
      bio: map['bio'],
      followers: Map.from(map['followers']),
      following: Map.from(map['following']),
    );
  }

  String toJson() => json.encode(toMap());

  static UserProfile fromJson(String source) => fromMap(json.decode(source));

  @override
  String toString() {
    return 'UserProfile(email: $email, id: $id, photoUrl: $photoUrl, username: $username, displayName: $displayName, bio: $bio, followers: $followers, following: $following)';
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;
    final mapEquals = const DeepCollectionEquality().equals;
  
    return o is UserProfile &&
      o.email == email &&
      o.id == id &&
      o.photoUrl == photoUrl &&
      o.username == username &&
      o.displayName == displayName &&
      o.bio == bio &&
      mapEquals(o.followers, followers) &&
      mapEquals(o.following, following);
  }

  @override
  int get hashCode {
    return email.hashCode ^
      id.hashCode ^
      photoUrl.hashCode ^
      username.hashCode ^
      displayName.hashCode ^
      bio.hashCode ^
      followers.hashCode ^
      following.hashCode;
  }
}
