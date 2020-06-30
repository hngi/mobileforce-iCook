import 'dart:convert';

import 'package:collection/collection.dart';

class EditDishResponse {
  final String status;
  final String error;
  final Data data;
  EditDishResponse({
    this.status,
    this.error,
    this.data,
  });

  EditDishResponse copyWith({
    String status,
    String error,
    Data data,
  }) {
    return EditDishResponse(
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

  static EditDishResponse fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return EditDishResponse(
      status: map['status'],
      error: map['error'],
      data: Data.fromMap(map['data']),
    );
  }

  String toJson() => json.encode(toMap());

  static EditDishResponse fromJson(String source) =>
      fromMap(json.decode(source));

  @override
  String toString() =>
      'EditDishResponse(status: $status, error: $error, data: $data)';

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is EditDishResponse &&
        o.status == status &&
        o.error == error &&
        o.data == data;
  }

  @override
  int get hashCode => status.hashCode ^ error.hashCode ^ data.hashCode;
}

class Data {
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
  Data({
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

  Data copyWith({
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
    return Data(
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

  static Data fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return Data(
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

  static Data fromJson(String source) => fromMap(json.decode(source));

  @override
  String toString() {
    return 'Data(dishImages: $dishImages, recipe: $recipe, likes: $likes, ingredients: $ingredients, healthBenefits: $healthBenefits, id: $id, name: $name, chefId: $chefId, comments: $comments, createdAt: $createdAt, updatedAt: $updatedAt, v: $v)';
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;
    final listEquals = const DeepCollectionEquality().equals;

    return o is Data &&
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
