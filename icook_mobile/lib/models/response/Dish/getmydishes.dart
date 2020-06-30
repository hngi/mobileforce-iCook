import 'dart:convert';

import 'package:collection/collection.dart';

class GetMyDishesResponse {
  final String status;
  final String error;
  final int results;
  final Data data;
  GetMyDishesResponse({
    this.status,
    this.error,
    this.results,
    this.data,
  });

  GetMyDishesResponse copyWith({
    String status,
    String error,
    int results,
    Data data,
  }) {
    return GetMyDishesResponse(
      status: status ?? this.status,
      error: error ?? this.error,
      results: results ?? this.results,
      data: data ?? this.data,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'status': status,
      'error': error,
      'results': results,
      'data': data?.toMap(),
    };
  }

  static GetMyDishesResponse fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return GetMyDishesResponse(
      status: map['status'],
      error: map['error'],
      results: map['results']?.toInt(),
      data: Data.fromMap(map['data']),
    );
  }

  String toJson() => json.encode(toMap());

  static GetMyDishesResponse fromJson(String source) =>
      fromMap(json.decode(source));

  @override
  String toString() {
    return 'GetMyDishesResponse(status: $status, error: $error, results: $results, data: $data)';
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is GetMyDishesResponse &&
        o.status == status &&
        o.error == error &&
        o.results == results &&
        o.data == data;
  }

  @override
  int get hashCode {
    return status.hashCode ^ error.hashCode ^ results.hashCode ^ data.hashCode;
  }
}

class Data {
  final int total;
  final int count;
  final List<Dishe> dishes;
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
    List<Dishe> dishes,
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
      dishes: List<Dishe>.from(map['dishes']?.map((x) => Dishe.fromMap(x))),
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
    final listEquals = const DeepCollectionEquality().equals;

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

class Dishe {
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
  final bool isFavourite;
  Dishe({
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
    this.isFavourite,
  });

  Dishe copyWith({
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
    bool isFavourite,
  }) {
    return Dishe(
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
      isFavourite: isFavourite ?? this.isFavourite,
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
      'isFavourite': isFavourite,
    };
  }

  static Dishe fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return Dishe(
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
      isFavourite: map['isFavourite'],
    );
  }

  String toJson() => json.encode(toMap());

  static Dishe fromJson(String source) => fromMap(json.decode(source));

  @override
  String toString() {
    return 'Dishe(dishImages: $dishImages, recipe: $recipe, ingredients: $ingredients, healthBenefits: $healthBenefits, id: $id, name: $name, chefId: $chefId, createdAt: $createdAt, updatedAt: $updatedAt, v: $v, commentsCount: $commentsCount, likesCount: $likesCount, isLiked: $isLiked, isFavourite: $isFavourite)';
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;
    final listEquals = const DeepCollectionEquality().equals;

    return o is Dishe &&
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
        o.isLiked == isLiked &&
        o.isFavourite == isFavourite;
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
        isLiked.hashCode ^
        isFavourite.hashCode;
  }
}
