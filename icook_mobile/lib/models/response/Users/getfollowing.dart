import 'dart:convert';

import 'package:collection/collection.dart';

class GetFollowingResponse {
  final String status;
  final int count;
  final List<String> data;
  final String error;
  GetFollowingResponse({
    this.status,
    this.count,
    this.data,
    this.error,
  });

  GetFollowingResponse copyWith({
    String status,
    int count,
    List<String> data,
    String error,
  }) {
    return GetFollowingResponse(
      status: status ?? this.status,
      count: count ?? this.count,
      data: data ?? this.data,
      error: error ?? this.error,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'status': status,
      'count': count,
      'data': data,
      'error': error,
    };
  }

  static GetFollowingResponse fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
  
    return GetFollowingResponse(
      status: map['status'],
      count: map['count']?.toInt(),
      data: List<String>.from(map['data']),
      error: map['error'],
    );
  }

  String toJson() => json.encode(toMap());

  static GetFollowingResponse fromJson(String source) => fromMap(json.decode(source));

  @override
  String toString() {
    return 'GetFollowingResponse(status: $status, count: $count, data: $data, error: $error)';
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;
    final listEquals = const DeepCollectionEquality().equals;
  
    return o is GetFollowingResponse &&
      o.status == status &&
      o.count == count &&
      listEquals(o.data, data) &&
      o.error == error;
  }

  @override
  int get hashCode {
    return status.hashCode ^
      count.hashCode ^
      data.hashCode ^
      error.hashCode;
  }
}