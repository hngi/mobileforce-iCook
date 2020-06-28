import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

import '../serializers.dart';

part 'user.g.dart';

abstract class User implements Built<User, UserBuilder> {
  @nullable
  String get status;
  @nullable
  String get error;
  @nullable
  String get message;
  @nullable
  UserData get data;

  User._();
  factory User([void Function(UserBuilder) updates]) = _$User;

  Map<String, dynamic> toJson() {
    return serializers.serializeWith(User.serializer, this);
  }

  static User fromJson(Map<String, dynamic> json) {
    return serializers.deserializeWith(User.serializer, json);
  }

  static Serializer<User> get serializer => _$userSerializer;
}

abstract class UserData implements Built<UserData, UserDataBuilder> {
  String get token;

  String get userID;

  String get profileID;

  String get email;

  String get name;

  UserData._();
  factory UserData([void Function(UserDataBuilder) updates]) = _$UserData;

  Map<String, dynamic> toJson() {
    return serializers.serializeWith(UserData.serializer, this);
  }

  static UserData fromJson(Map<String, dynamic> json) {
    return serializers.deserializeWith(UserData.serializer, json);
  }

  static Serializer<UserData> get serializer => _$userDataSerializer;
}
