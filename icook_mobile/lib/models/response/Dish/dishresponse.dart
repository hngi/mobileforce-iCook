import 'dart:convert';

import 'package:collection/collection.dart';
import 'package:icook_mobile/models/response/Dish/dishitem.dart';

class DishResponse {
  final String status;
  final String error;
  final int result;
  final Data data;
  DishResponse({
    this.status,
    this.error,
    this.result,
    this.data,
  });

  DishResponse copyWith({
    String status,
    String error,
    int result,
    Data data,
  }) {
    return DishResponse(
      status: status ?? this.status,
      error: error ?? this.error,
      result: result ?? this.result,
      data: data ?? this.data,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'status': status,
      'error': error,
      'result': result,
      'data': data?.toMap(),
    };
  }

  static DishResponse fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return DishResponse(
      status: map['status'],
      error: map['error'],
      result: map['result']?.toInt(),
      data: Data.fromMap(map['data']),
    );
  }

  String toJson() => json.encode(toMap());

  static DishResponse fromJson(String source) => fromMap(json.decode(source));

  @override
  String toString() {
    return 'DishResponse(status: $status, error: $error, result: $result, data: $data)';
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is DishResponse &&
        o.status == status &&
        o.error == error &&
        o.result == result &&
        o.data == data;
  }

  @override
  int get hashCode {
    return status.hashCode ^ error.hashCode ^ result.hashCode ^ data.hashCode;
  }
}

class Data {
  final List<Dish> dishes;
  Data({
    this.dishes,
  });

  Data copyWith({
    List<Dish> dishes,
  }) {
    return Data(
      dishes: dishes ?? this.dishes,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'dishes': dishes?.map((x) => x?.toMap())?.toList(),
    };
  }

  static Data fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return Data(
      dishes: List<Dish>.from(map['dishes']?.map((x) => Dish.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  static Data fromJson(String source) => fromMap(json.decode(source));

  @override
  String toString() => 'Data(dishes: $dishes)';

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;
    final listEquals = const DeepCollectionEquality().equals;

    return o is Data && listEquals(o.dishes, dishes);
  }

  @override
  int get hashCode => dishes.hashCode;
}


