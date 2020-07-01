import 'dart:convert';

class UpdatePasswordRequest {
  final String currentPassword;
  final String newPassword;
  UpdatePasswordRequest({
    this.currentPassword,
    this.newPassword,
  });

  UpdatePasswordRequest copyWith({
    String currentPassword,
    String newPassword,
  }) {
    return UpdatePasswordRequest(
      currentPassword: currentPassword ?? this.currentPassword,
      newPassword: newPassword ?? this.newPassword,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'currentPassword': currentPassword,
      'newPassword': newPassword,
    };
  }

  static UpdatePasswordRequest fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
  
    return UpdatePasswordRequest(
      currentPassword: map['currentPassword'],
      newPassword: map['newPassword'],
    );
  }

  String toJson() => json.encode(toMap());

  static UpdatePasswordRequest fromJson(String source) => fromMap(json.decode(source));

  @override
  String toString() => 'UpdatePasswordRequest(currentPassword: $currentPassword, newPassword: $newPassword)';

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;
  
    return o is UpdatePasswordRequest &&
      o.currentPassword == currentPassword &&
      o.newPassword == newPassword;
  }

  @override
  int get hashCode => currentPassword.hashCode ^ newPassword.hashCode;
}