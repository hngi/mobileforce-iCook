import 'dart:convert';

import 'package:collection/collection.dart';

class Dish {
  final List<ChefId> chefId;
  final List<dynamic> dishImages;
  final List<String> recipe;
  final List<String> ingredients;
  final List<String> healthBenefits;
  final String id;
  final String name;
  final String createdAt;
  final String updatedAt;
  final int v;
  final int commentsCount;
  final int likesCount;
  final bool isLiked;
  Dish({
    this.chefId,
    this.dishImages,
    this.recipe,
    this.ingredients,
    this.healthBenefits,
    this.id,
    this.name,
    this.createdAt,
    this.updatedAt,
    this.v,
    this.commentsCount,
    this.likesCount,
    this.isLiked,
  });

  Dish copyWith({
    List<ChefId> chefId,
    List<dynamic> dishImages,
    List<String> recipe,
    List<String> ingredients,
    List<String> healthBenefits,
    String id,
    String name,
    String createdAt,
    String updatedAt,
    int v,
    int commentsCount,
    int likesCount,
    bool isLiked,
  }) {
    return Dish(
      chefId: chefId ?? this.chefId,
      dishImages: dishImages ?? this.dishImages,
      recipe: recipe ?? this.recipe,
      ingredients: ingredients ?? this.ingredients,
      healthBenefits: healthBenefits ?? this.healthBenefits,
      id: id ?? this.id,
      name: name ?? this.name,
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
      'chefId': chefId?.map((x) => x?.toMap())?.toList(),
      'dishImages': dishImages,
      'recipe': recipe,
      'ingredients': ingredients,
      'healthBenefits': healthBenefits,
      '_id': id,
      'name': name,
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
      chefId: List<ChefId>.from(map['chefId']?.map((x) => ChefId.fromMap(x))),
      dishImages: List<dynamic>.from(map['dishImages']),
      recipe: List<String>.from(map['recipe']),
      ingredients: List<String>.from(map['ingredients']),
      healthBenefits: List<String>.from(map['healthBenefits']),
      id: map['_id'],
      name: map['name'],
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
    return 'Dish(chefId: $chefId, dishImages: $dishImages, recipe: $recipe, ingredients: $ingredients, healthBenefits: $healthBenefits, id: $id, name: $name, createdAt: $createdAt, updatedAt: $updatedAt, v: $v, commentsCount: $commentsCount, likesCount: $likesCount, isLiked: $isLiked)';
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;
    final listEquals = const DeepCollectionEquality().equals;

    return o is Dish &&
        listEquals(o.chefId, chefId) &&
        listEquals(o.dishImages, dishImages) &&
        listEquals(o.recipe, recipe) &&
        listEquals(o.ingredients, ingredients) &&
        listEquals(o.healthBenefits, healthBenefits) &&
        o.id == id &&
        o.name == name &&
        o.createdAt == createdAt &&
        o.updatedAt == updatedAt &&
        o.v == v &&
        o.commentsCount == commentsCount &&
        o.likesCount == likesCount &&
        o.isLiked == isLiked;
  }

  @override
  int get hashCode {
    return chefId.hashCode ^
        dishImages.hashCode ^
        recipe.hashCode ^
        ingredients.hashCode ^
        healthBenefits.hashCode ^
        id.hashCode ^
        name.hashCode ^
        createdAt.hashCode ^
        updatedAt.hashCode ^
        v.hashCode ^
        commentsCount.hashCode ^
        likesCount.hashCode ^
        isLiked.hashCode;
  }
}

class ChefId {
  final String userImage;
  final String id;
  final String name;
  ChefId({
    this.userImage,
    this.id,
    this.name,
  });

  ChefId copyWith({
    String userImage,
    String id,
    String name,
  }) {
    return ChefId(
      userImage: userImage ?? this.userImage,
      id: id ?? this.id,
      name: name ?? this.name,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'userImage': userImage,
      'id': id,
      'name': name,
    };
  }

  static ChefId fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return ChefId(
      userImage: map['userImage'],
      id: map['id'],
      name: map['name'],
    );
  }

  String toJson() => json.encode(toMap());

  static ChefId fromJson(String source) => fromMap(json.decode(source));

  @override
  String toString() => 'ChefId(userImage: $userImage, id: $id, name: $name)';

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is ChefId &&
        o.userImage == userImage &&
        o.id == id &&
        o.name == name;
  }

  @override
  int get hashCode => userImage.hashCode ^ id.hashCode ^ name.hashCode;
}
