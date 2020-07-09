import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:icook_mobile/models/response/Dish/dishitem.dart';

class FavouriteResponse {
  final String status;
  final String error;
  final Data data;
  FavouriteResponse({
    this.status,
    this.error,
    this.data,
  });

  FavouriteResponse copyWith({
    String status,
    String error,
    Data data,
  }) {
    return FavouriteResponse(
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

  static FavouriteResponse fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return FavouriteResponse(
      status: map['status'],
      error: map['error'],
      data: Data.fromMap(map['data']),
    );
  }

  String toJson() => json.encode(toMap());

  static FavouriteResponse fromJson(String source) =>
      fromMap(json.decode(source));

  @override
  String toString() =>
      'FavouriteResponse(status: $status, error: $error, data: $data)';

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is FavouriteResponse &&
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
  final List<Dish> dishes;
  final String after;
  Data({
    this.total,
    this.count,
    this.dishes,
    this.after,
  });

  Data copyWith({
    int total,
    int count,
    List<Dish> dishes,
    String after,
  }) {
    return Data(
      total: total ?? this.total,
      count: count ?? this.count,
      dishes: dishes ?? this.dishes,
      after: after ?? this.after,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'total': total,
      'count': count,
      'dishes': dishes?.map((x) => x?.toMap())?.toList(),
      'after': after,
    };
  }

  static Data fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return Data(
      total: map['total']?.toInt(),
      count: map['count']?.toInt(),
      dishes: List<Dish>.from(map['dishes']?.map((x) => Dish.fromMap(x))),
      after: map['after'],
    );
  }

  String toJson() => json.encode(toMap());

  static Data fromJson(String source) => fromMap(json.decode(source));

  @override
  String toString() {
    return 'Data(total: $total, count: $count, dishes: $dishes, after: $after)';
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is Data &&
        o.total == total &&
        o.count == count &&
        listEquals(o.dishes, dishes) &&
        o.after == after;
  }

  @override
  int get hashCode {
    return total.hashCode ^ count.hashCode ^ dishes.hashCode ^ after.hashCode;
  }
}
