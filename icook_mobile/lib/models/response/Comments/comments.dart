import 'dart:convert';
import 'package:collection/collection.dart';

class CommentsResponse {
  final String status;
  final int count;
  final List<Comment> comments;
  final String error;
  CommentsResponse({
    this.status,
    this.count,
    this.comments,
    this.error,
  });

  CommentsResponse copyWith({
    String status,
    int count,
    List<Comment> comments,
    String error,
  }) {
    return CommentsResponse(
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
      'comments': comments?.map((x) => x?.toMap())?.toList(),
      'error': error,
    };
  }

  static CommentsResponse fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return CommentsResponse(
      status: map['status'],
      count: map['count']?.toInt(),
      comments:
          List<Comment>.from(map['comments']?.map((x) => Comment.fromMap(x))),
      error: map['error'],
    );
  }

  String toJson() => json.encode(toMap());

  static CommentsResponse fromJson(String source) =>
      fromMap(json.decode(source));

  @override
  String toString() {
    return 'CommentsResponse(status: $status, count: $count, comments: $comments, error: $error)';
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;
    final listEquals = const DeepCollectionEquality().equals;

    return o is CommentsResponse &&
        o.status == status &&
        o.count == count &&
        listEquals(o.comments, comments) &&
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

class Comment {
  final String id;
  final String text;
  final String name;
  final String user;
  final String dish;
  final String createdAt;
  final String updatedAt;
  final int v;
  Comment({
    this.id,
    this.text,
    this.name,
    this.user,
    this.dish,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  Comment copyWith({
    String id,
    String text,
    String name,
    String user,
    String dish,
    String createdAt,
    String updatedAt,
    int v,
  }) {
    return Comment(
      id: id ?? this.id,
      text: text ?? this.text,
      name: name ?? this.name,
      user: user ?? this.user,
      dish: dish ?? this.dish,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      v: v ?? this.v,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      '_id': id,
      'text': text,
      'name': name,
      'user': user,
      'dish': dish,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
      '__v': v,
    };
  }

  static Comment fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return Comment(
      id: map['_id'],
      text: map['text'],
      name: map['name'],
      user: map['user'],
      dish: map['dish'],
      createdAt: map['createdAt'],
      updatedAt: map['updatedAt'],
      v: map['__v']?.toInt(),
    );
  }

  String toJson() => json.encode(toMap());

  static Comment fromJson(String source) => fromMap(json.decode(source));

  @override
  String toString() {
    return 'Comment(id: $id, text: $text, name: $name, user: $user, dish: $dish, createdAt: $createdAt, updatedAt: $updatedAt, v: $v)';
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is Comment &&
        o.id == id &&
        o.text == text &&
        o.name == name &&
        o.user == user &&
        o.dish == dish &&
        o.createdAt == createdAt &&
        o.updatedAt == updatedAt &&
        o.v == v;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        text.hashCode ^
        name.hashCode ^
        user.hashCode ^
        dish.hashCode ^
        createdAt.hashCode ^
        updatedAt.hashCode ^
        v.hashCode;
  }
}
