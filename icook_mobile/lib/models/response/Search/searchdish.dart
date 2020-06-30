import 'dart:convert';

import 'package:collection/collection.dart';

class SearchDishResponse {
  final String status;
  final String error;
  final Data data;
  SearchDishResponse({
    this.status,
    this.error,
    this.data,
  });

  SearchDishResponse copyWith({
    String status,
    String error,
    Data data,
  }) {
    return SearchDishResponse(
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

  static SearchDishResponse fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return SearchDishResponse(
      status: map['status'],
      error: map['error'],
      data: Data.fromMap(map['data']),
    );
  }

  String toJson() => json.encode(toMap());

  static SearchDishResponse fromJson(String source) =>
      fromMap(json.decode(source));

  @override
  String toString() =>
      'SearchDishResponse(status: $status, error: $error, data: $data)';

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is SearchDishResponse &&
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
  final List<Result> result;
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
    List<Result> result,
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
      result: List<Result>.from(map['result']?.map((x) => Result.fromMap(x))),
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

class Result {
  final List<dynamic> dishImages;
  final List<String> recipe;
  final List<String> ingredients;
  final List<String> healthBenefits;
  final String id;
  final String name;
  final String chefId;
  final String createdAt;
  final String updatedAt;
  final int v;
  final int commentsCount;
  final int likesCount;
  final bool isLiked;
  Result({
    this.dishImages,
    this.recipe,
    this.ingredients,
    this.healthBenefits,
    this.id,
    this.name,
    this.chefId,
    this.createdAt,
    this.updatedAt,
    this.v,
    this.commentsCount,
    this.likesCount,
    this.isLiked,
  });

  Result copyWith({
    List<dynamic> dishImages,
    List<String> recipe,
    List<String> ingredients,
    List<String> healthBenefits,
    String id,
    String name,
    String chefId,
    String createdAt,
    String updatedAt,
    int v,
    int commentsCount,
    int likesCount,
    bool isLiked,
  }) {
    return Result(
      dishImages: dishImages ?? this.dishImages,
      recipe: recipe ?? this.recipe,
      ingredients: ingredients ?? this.ingredients,
      healthBenefits: healthBenefits ?? this.healthBenefits,
      id: id ?? this.id,
      name: name ?? this.name,
      chefId: chefId ?? this.chefId,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      v: v ?? this.v,
      commentsCount: commentsCount ?? this.commentsCount,
      likesCount: likesCount ?? this.likesCount,
      isLiked: isLiked ?? this.isLiked,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'dishImages': dishImages,
      'recipe': recipe,
      'ingredients': ingredients,
      'healthBenefits': healthBenefits,
      '_id': id,
      'name': name,
      'chefId': chefId,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
      '__v': v,
      'commentsCount': commentsCount,
      'likesCount': likesCount,
      'isLiked': isLiked,
    };
  }

  static Result fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return Result(
      dishImages: List<dynamic>.from(map['dishImages']),
      recipe: List<String>.from(map['recipe']),
      ingredients: List<String>.from(map['ingredients']),
      healthBenefits: List<String>.from(map['healthBenefits']),
      id: map['_id'],
      name: map['name'],
      chefId: map['chefId'],
      createdAt: map['createdAt'],
      updatedAt: map['updatedAt'],
      v: map['__v']?.toInt(),
      commentsCount: map['commentsCount']?.toInt(),
      likesCount: map['likesCount']?.toInt(),
      isLiked: map['isLiked'],
    );
  }

  String toJson() => json.encode(toMap());

  static Result fromJson(String source) => fromMap(json.decode(source));

  @override
  String toString() {
    return 'Result(dishImages: $dishImages, recipe: $recipe, ingredients: $ingredients, healthBenefits: $healthBenefits, id: $id, name: $name, chefId: $chefId, createdAt: $createdAt, updatedAt: $updatedAt, v: $v, commentsCount: $commentsCount, likesCount: $likesCount, isLiked: $isLiked)';
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;
    final listEquals = const DeepCollectionEquality().equals;

    return o is Result &&
        listEquals(o.dishImages, dishImages) &&
        listEquals(o.recipe, recipe) &&
        listEquals(o.ingredients, ingredients) &&
        listEquals(o.healthBenefits, healthBenefits) &&
        o.id == id &&
        o.name == name &&
        o.chefId == chefId &&
        o.createdAt == createdAt &&
        o.updatedAt == updatedAt &&
        o.v == v &&
        o.commentsCount == commentsCount &&
        o.likesCount == likesCount &&
        o.isLiked == isLiked;
  }

  @override
  int get hashCode {
    return dishImages.hashCode ^
        recipe.hashCode ^
        ingredients.hashCode ^
        healthBenefits.hashCode ^
        id.hashCode ^
        name.hashCode ^
        chefId.hashCode ^
        createdAt.hashCode ^
        updatedAt.hashCode ^
        v.hashCode ^
        commentsCount.hashCode ^
        likesCount.hashCode ^
        isLiked.hashCode;
  }
}
