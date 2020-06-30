import 'dart:convert';

class UnFollowUserResponse {
  final bool success;
  final String message;
  final String error;
  UnFollowUserResponse({
    this.success,
    this.message,
    this.error,
  });

  UnFollowUserResponse copyWith({
    bool success,
    String message,
    String error,
  }) {
    return UnFollowUserResponse(
      success: success ?? this.success,
      message: message ?? this.message,
      error: error ?? this.error,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'success': success,
      'message': message,
      'error': error,
    };
  }

  static UnFollowUserResponse fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
  
    return UnFollowUserResponse(
      success: map['success'],
      message: map['message'],
      error: map['error'],
    );
  }

  String toJson() => json.encode(toMap());

  static UnFollowUserResponse fromJson(String source) => fromMap(json.decode(source));

  @override
  String toString() => 'UnFollowUserResponse(success: $success, message: $message, error: $error)';

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;
  
    return o is UnFollowUserResponse &&
      o.success == success &&
      o.message == message &&
      o.error == error;
  }

  @override
  int get hashCode => success.hashCode ^ message.hashCode ^ error.hashCode;
}