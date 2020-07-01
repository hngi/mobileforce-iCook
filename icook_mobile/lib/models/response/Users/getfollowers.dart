import 'dart:convert';

import 'package:collection/collection.dart';

class GetFollowersResponse {
  final String status;
  final int count;
  final List<String> data;
  final String error;
  GetFollowersResponse({
    this.status,
    this.count,
    this.data,
    this.error,
  });

  GetFollowersResponse copyWith({
    String status,
    int count,
    List<String> data,
    String error,
  }) {
    return GetFollowersResponse(
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

  static GetFollowersResponse fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
  
    return GetFollowersResponse(
      status: map['status'],
      count: map['count']?.toInt(),
      data: List<String>.from(map['data']),
      error: map['error'],
    );
  }

  String toJson() => json.encode(toMap());

  static GetFollowersResponse fromJson(String source) => fromMap(json.decode(source));

  @override
  String toString() {
    return 'GetFollowersResponse(status: $status, count: $count, data: $data, error: $error)';
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;
    final listEquals = const DeepCollectionEquality().equals;
  
    return o is GetFollowersResponse &&
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