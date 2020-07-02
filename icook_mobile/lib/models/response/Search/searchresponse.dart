import 'dart:convert';

import 'package:collection/collection.dart';
import 'package:icook_mobile/models/response/Dish/dishitem.dart';

class SearchResponse {
  final String status;
  final String error;
  final Data data;
  SearchResponse({
    this.status,
    this.error,
    this.data,
  });

  SearchResponse copyWith({
    String status,
    String error,
    Data data,
  }) {
    return SearchResponse(
      status: status ?? this.status,
      error: error ?? this.error,
      data: data ?? this.data,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'status': status,
      'error': error,
      'data': data?.toMap(),
    };
  }

  static SearchResponse fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return SearchResponse(
      status: map['status'],
      error: map['error'],
      data: Data.fromMap(map['data']),
    );
  }

  String toJson() => json.encode(toMap());

  static SearchResponse fromJson(String source) => fromMap(json.decode(source));

  @override
  String toString() =>
      'SearchResponse(status: $status, error: $error, data: $data)';

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is SearchResponse &&
        o.status == status &&
        o.error == error &&
        o.data == data;
  }

  @override
  int get hashCode => status.hashCode ^ error.hashCode ^ data.hashCode;
}

class Data {
  final int total;
  final int count;
  final int after;
  final List<Dish> result;
  Data({
    this.total,
    this.count,
    this.after,
    this.result,
  });

  Data copyWith({
    int total,
    int count,
    int after,
    List<Dish> result,
  }) {
    return Data(
      total: total ?? this.total,
      count: count ?? this.count,
      after: after ?? this.after,
      result: result ?? this.result,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'total': total,
      'count': count,
      'after': after,
      'result': result?.map((x) => x?.toMap())?.toList(),
    };
  }

  static Data fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return Data(
      total: map['total']?.toInt(),
      count: map['count']?.toInt(),
      after: map['after']?.toInt(),
      result: List<Dish>.from(map['result']?.map((x) => Dish.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  static Data fromJson(String source) => fromMap(json.decode(source));

  @override
  String toString() {
    return 'Data(total: $total, count: $count, after: $after, result: $result)';
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;
    final listEquals = const DeepCollectionEquality().equals;

    return o is Data &&
        o.total == total &&
        o.count == count &&
        o.after == after &&
        listEquals(o.result, result);
  }

  @override
  int get hashCode {
    return total.hashCode ^ count.hashCode ^ after.hashCode ^ result.hashCode;
  }
}
