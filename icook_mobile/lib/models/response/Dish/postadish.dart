import 'dart:convert';

import 'package:collection/collection.dart';

class PostDishResponse {
  final String status;
  final String error;
  final String message;
  final Data data;
  PostDishResponse({
    this.status,
    this.error,
    this.message,
    this.data,
  });

  PostDishResponse copyWith({
    String status,
    String error,
    String message,
    Data data,
  }) {
    return PostDishResponse(
      status: status ?? this.status,
      error: error ?? this.error,
      message: message ?? this.message,
      data: data ?? this.data,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'status': status,
      'error': error,
      'message': message,
      'data': data?.toMap(),
    };
  }

  static PostDishResponse fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return PostDishResponse(
      status: map['status'],
      error: map['error'],
      message: map['message'],
      data: Data.fromMap(map['data']),
    );
  }

  String toJson() => json.encode(toMap());

  static PostDishResponse fromJson(String source) =>
      fromMap(json.decode(source));

  @override
  String toString() {
    return 'PostDishResponse(status: $status, error: $error, message: $message, data: $data)';
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is PostDishResponse &&
        o.status == status &&
        o.error == error &&
        o.message == message &&
        o.data == data;
  }

  @override
  int get hashCode {
    return status.hashCode ^ error.hashCode ^ message.hashCode ^ data.hashCode;
  }
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
  final List<dynamic> likes;
  final List<String> ingredients;
  final List<String> healthBenefits;
  final String id;
  final String name;
  final String chefId;
  final List<dynamic> comments;
  final String createdAt;
  final String updatedAt;
  final int v;
  Dish({
    this.dishImages,
    this.recipe,
    this.likes,
    this.ingredients,
    this.healthBenefits,
    this.id,
    this.name,
    this.chefId,
    this.comments,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  Dish copyWith({
    List<dynamic> dishImages,
    List<String> recipe,
    List<dynamic> likes,
    List<String> ingredients,
    List<String> healthBenefits,
    String id,
    String name,
    String chefId,
    List<dynamic> comments,
    String createdAt,
    String updatedAt,
    int v,
  }) {
    return Dish(
      dishImages: dishImages ?? this.dishImages,
      recipe: recipe ?? this.recipe,
      likes: likes ?? this.likes,
      ingredients: ingredients ?? this.ingredients,
      healthBenefits: healthBenefits ?? this.healthBenefits,
      id: id ?? this.id,
      name: name ?? this.name,
      chefId: chefId ?? this.chefId,
      comments: comments ?? this.comments,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      v: v ?? this.v,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'dishImages': dishImages,
      'recipe': recipe,
      'likes': likes,
      'ingredients': ingredients,
      'healthBenefits': healthBenefits,
      '_id': id,
      'name': name,
      'chefId': chefId,
      'comments': comments,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
      '__v': v,
    };
  }

  static Dish fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return Dish(
      dishImages: List<dynamic>.from(map['dishImages']),
      recipe: List<String>.from(map['recipe']),
      likes: List<dynamic>.from(map['likes']),
      ingredients: List<String>.from(map['ingredients']),
      healthBenefits: List<String>.from(map['healthBenefits']),
      id: map['_id'],
      name: map['name'],
      chefId: map['chefId'],
      comments: List<dynamic>.from(map['comments']),
      createdAt: map['createdAt'],
      updatedAt: map['updatedAt'],
      v: map['__v']?.toInt(),
    );
  }

  String toJson() => json.encode(toMap());

  static Dish fromJson(String source) => fromMap(json.decode(source));

  @override
  String toString() {
    return 'Dish(dishImages: $dishImages, recipe: $recipe, likes: $likes, ingredients: $ingredients, healthBenefits: $healthBenefits, id: $id, name: $name, chefId: $chefId, comments: $comments, createdAt: $createdAt, updatedAt: $updatedAt, v: $v)';
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;
    final listEquals = const DeepCollectionEquality().equals;

    return o is Dish &&
        listEquals(o.dishImages, dishImages) &&
        listEquals(o.recipe, recipe) &&
        listEquals(o.likes, likes) &&
        listEquals(o.ingredients, ingredients) &&
        listEquals(o.healthBenefits, healthBenefits) &&
        o.id == id &&
        o.name == name &&
        o.chefId == chefId &&
        listEquals(o.comments, comments) &&
        o.createdAt == createdAt &&
        o.updatedAt == updatedAt &&
        o.v == v;
  }

  @override
  int get hashCode {
    return dishImages.hashCode ^
        recipe.hashCode ^
        likes.hashCode ^
        ingredients.hashCode ^
        healthBenefits.hashCode ^
        id.hashCode ^
        name.hashCode ^
        chefId.hashCode ^
        comments.hashCode ^
        createdAt.hashCode ^
        updatedAt.hashCode ^
        v.hashCode;
  }
}
