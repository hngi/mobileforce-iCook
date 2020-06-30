import 'dart:convert';

class UpdateProfileRequest {
  final String name;
  final String phone;
  final String gender;
  final String country;
  final String bio;
  UpdateProfileRequest({
    this.name,
    this.phone,
    this.gender,
    this.country,
    this.bio,
  });

  UpdateProfileRequest copyWith({
    String name,
    String phone,
    String gender,
    String country,
    String bio,
  }) {
    return UpdateProfileRequest(
      name: name ?? this.name,
      phone: phone ?? this.phone,
      gender: gender ?? this.gender,
      country: country ?? this.country,
      bio: bio ?? this.bio,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'phone': phone,
      'gender': gender,
      'country': country,
      'bio': bio,
    };
  }

  static UpdateProfileRequest fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
  
    return UpdateProfileRequest(
      name: map['name'],
      phone: map['phone'],
      gender: map['gender'],
      country: map['country'],
      bio: map['bio'],
    );
  }

  String toJson() => json.encode(toMap());

  static UpdateProfileRequest fromJson(String source) => fromMap(json.decode(source));

  @override
  String toString() {
    return 'UpdateProfileRequest(name: $name, phone: $phone, gender: $gender, country: $country, bio: $bio)';
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;
  
    return o is UpdateProfileRequest &&
      o.name == name &&
      o.phone == phone &&
      o.gender == gender &&
      o.country == country &&
      o.bio == bio;
  }

  @override
  int get hashCode {
    return name.hashCode ^
      phone.hashCode ^
      gender.hashCode ^
      country.hashCode ^
      bio.hashCode;
  }
}