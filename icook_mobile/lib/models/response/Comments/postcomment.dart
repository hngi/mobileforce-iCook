import 'dart:convert';

import 'package:collection/collection.dart';

import 'package:icook_mobile/models/response/Comments/comments.dart';

class PostCommentResponse {
  final String status;
  final int count;
  final Comment comments;
  final String error;
  PostCommentResponse({
    this.status,
    this.count,
    this.comments,
    this.error,
  });

  PostCommentResponse copyWith({
    String status,
    int count,
    Comment comments,
    String error,
  }) {
    return PostCommentResponse(
      status: status ?? this.status,
      count: count ?? this.count,
      comments: comments ?? this.comments,
      error: error ?? this.error,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'status': status,
      'count': count,
      'data': comments?.toMap(),
      'error': error,
    };
  }

  static PostCommentResponse fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return PostCommentResponse(
      status: map['status'],
      count: map['count'],
      comments: Comment.fromMap(map['data']),
      error: map['error'],
    );
  }

  String toJson() => json.encode(toMap());

  static PostCommentResponse fromJson(String source) =>
      fromMap(json.decode(source));

  @override
  String toString() {
    return 'PostCommentResponse(status: $status, count: $count, comments: $comments, error: $error)';
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is PostCommentResponse &&
        o.status == status &&
        o.count == count &&
        o.comments == comments &&
        o.error == error;
  }

  @override
  int get hashCode {
    return status.hashCode ^
        count.hashCode ^
        comments.hashCode ^
        error.hashCode;
  }
}
