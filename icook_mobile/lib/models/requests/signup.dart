import 'dart:convert';

class SignUpRequest {
  String name;
  String email;
  String gender;
  String phone;
  String password;
  SignUpRequest({
    this.name,
    this.email,
    this.gender,
    this.phone,
    this.password,
  });

  SignUpRequest copyWith({
    String name,
    String email,
    String gender,
    String phone,
    String password,
  }) {
    return SignUpRequest(
      name: name ?? this.name,
      email: email ?? this.email,
      gender: gender ?? this.gender,
      phone: phone ?? this.phone,
      password: password ?? this.password,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'email': email,
      'gender': gender,
      'phone': phone,
      'password': password,
    };
  }

  static SignUpRequest fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
  
    return SignUpRequest(
      name: map['name'],
      email: map['email'],
      gender: map['gender'],
      phone: map['phone'],
      password: map['password'],
    );
  }

  String toJson() => json.encode(toMap());

  static SignUpRequest fromJson(String source) => fromMap(json.decode(source));

  @override
  String toString() {
    return 'SignUpRequest(name: $name, email: $email, gender: $gender, phone: $phone, password: $password)';
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;
  
    return o is SignUpRequest &&
      o.name == name &&
      o.email == email &&
      o.gender == gender &&
      o.phone == phone &&
      o.password == password;
  }

  @override
  int get hashCode {
    return name.hashCode ^
      email.hashCode ^
      gender.hashCode ^
      phone.hashCode ^
      password.hashCode;
  }
}
