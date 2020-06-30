import 'dart:convert';

import 'package:collection/collection.dart';

class LikeDIshResponse {
  final String status;
  final String error;
  final Data data;
  LikeDIshResponse({
    this.status,
    this.error,
    this.data,
  });

  LikeDIshResponse copyWith({
    String status,
    String error,
    Data data,
  }) {
    return LikeDIshResponse(
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

  static LikeDIshResponse fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return LikeDIshResponse(
      status: map['status'],
      error: map['error'],
      data: Data.fromMap(map['data']),
    );
  }

  String toJson() => json.encode(toMap());

  static LikeDIshResponse fromJson(String source) =>
      fromMap(json.decode(source));

  @override
  String toString() =>
      'LikeDIshResponse(status: $status, error: $error, data: $data)';

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is LikeDIshResponse &&
        o.status == status &&
        o.error == error &&
        o.data == data;
  }

  @override
  int get hashCode => status.hashCode ^ error.hashCode ^ data.hashCode;
}

class Data {
  final Dish dish;
  Data({
    this.dish,
  });

  Data copyWith({
    Dish dish,
  }) {
    return Data(
      dish: dish ?? this.dish,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'dish': dish?.toMap(),
    };
  }

  static Data fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return Data(
      dish: Dish.fromMap(map['dish']),
    );
  }

  String toJson() => json.encode(toMap());

  static Data fromJson(String source) => fromMap(json.decode(source));

  @override
  String toString() => 'Data(dish: $dish)';

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is Data && o.dish == dish;
  }

  @override
  int get hashCode => dish.hashCode;
}

class Dish {
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
  Dish({
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

  Dish copyWith({
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
    return Dish(
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

  static Dish fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return Dish(
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

  static Dish fromJson(String source) => fromMap(json.decode(source));

  @override
  String toString() {
    return 'Dish(dishImages: $dishImages, recipe: $recipe, ingredients: $ingredients, healthBenefits: $healthBenefits, id: $id, name: $name, chefId: $chefId, createdAt: $createdAt, updatedAt: $updatedAt, v: $v, commentsCount: $commentsCount, likesCount: $likesCount, isLiked: $isLiked)';
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;
    final listEquals = const DeepCollectionEquality().equals;

    return o is Dish &&
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
