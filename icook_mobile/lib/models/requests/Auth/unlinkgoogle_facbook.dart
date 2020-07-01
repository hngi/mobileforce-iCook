import 'dart:convert';

class UnlinkRequest {
  final String setPassword;
  UnlinkRequest({
    this.setPassword,
  });

  UnlinkRequest copyWith({
    String setPassword,
  }) {
    return UnlinkRequest(
      setPassword: setPassword ?? this.setPassword,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'setPassword': setPassword,
    };
  }

  static UnlinkRequest fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
  
    return UnlinkRequest(
      setPassword: map['setPassword'],
    );
  }

  String toJson() => json.encode(toMap());

  static UnlinkRequest fromJson(String source) => fromMap(json.decode(source));

  @override
  String toString() => 'UnlinkRequest(setPassword: $setPassword)';

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;
  
    return o is UnlinkRequest &&
      o.setPassword == setPassword;
  }

  @override
  int get hashCode => setPassword.hashCode;
}