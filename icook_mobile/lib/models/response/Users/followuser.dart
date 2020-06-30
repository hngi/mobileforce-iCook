import 'dart:convert';

class FollowUserResponse {
  final String status;
  final String message;
  final String error;
  FollowUserResponse({
    this.status,
    this.message,
    this.error,
  });

  FollowUserResponse copyWith({
    String status,
    String message,
    String error,
  }) {
    return FollowUserResponse(
      status: status ?? this.status,
      message: message ?? this.message,
      error: error ?? this.error,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'status': status,
      'message': message,
      'error': error,
    };
  }

  static FollowUserResponse fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
  
    return FollowUserResponse(
      status: map['status'],
      message: map['message'],
      error: map['error'],
    );
  }

  String toJson() => json.encode(toMap());

  static FollowUserResponse fromJson(String source) => fromMap(json.decode(source));

  @override
  String toString() => 'FollowUserResponse(status: $status, message: $message, error: $error)';

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;
  
    return o is FollowUserResponse &&
      o.status == status &&
      o.message == message &&
      o.error == error;
  }

  @override
  int get hashCode => status.hashCode ^ message.hashCode ^ error.hashCode;
}