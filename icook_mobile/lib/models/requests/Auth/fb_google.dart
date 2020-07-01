import 'dart:convert';

class FbGoogleRequest {
  final String access_token;
  FbGoogleRequest({
    this.access_token,
  });

  FbGoogleRequest copyWith({
    String access_token,
  }) {
    return FbGoogleRequest(
      access_token: access_token ?? this.access_token,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'access_token': access_token,
    };
  }

  static FbGoogleRequest fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
  
    return FbGoogleRequest(
      access_token: map['access_token'],
    );
  }

  String toJson() => json.encode(toMap());

  static FbGoogleRequest fromJson(String source) => fromMap(json.decode(source));

  @override
  String toString() => 'FbGoogleRequest(access_token: $access_token)';

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;
  
    return o is FbGoogleRequest &&
      o.access_token == access_token;
  }

  @override
  int get hashCode => access_token.hashCode;
}