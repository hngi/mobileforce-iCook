import 'dart:convert';

import 'package:collection/collection.dart';

class PostDIshBody {
  final String name;
  final List<String> ingredients;
  final List<String> recipe;
  final String healthBenefits;
  PostDIshBody({
    this.name,
    this.ingredients,
    this.recipe,
    this.healthBenefits,
  });

  PostDIshBody copyWith({
    String name,
    List<String> ingredients,
    List<String> recipe,
    String healthBenefits,
  }) {
    return PostDIshBody(
      name: name ?? this.name,
      ingredients: ingredients ?? this.ingredients,
      recipe: recipe ?? this.recipe,
      healthBenefits: healthBenefits ?? this.healthBenefits,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'ingredients': ingredients,
      'recipe': recipe,
      'healthBenefits': healthBenefits,
    };
  }

  static PostDIshBody fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
  
    return PostDIshBody(
      name: map['name'],
      ingredients: List<String>.from(map['ingredients']),
      recipe: List<String>.from(map['recipe']),
      healthBenefits: map['healthBenefits'],
    );
  }

  String toJson() => json.encode(toMap());

  static PostDIshBody fromJson(String source) => fromMap(json.decode(source));

  @override
  String toString() {
    return 'PostDIshBody(name: $name, ingredients: $ingredients, recipe: $recipe, healthBenefits: $healthBenefits)';
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;
    final listEquals = const DeepCollectionEquality().equals;
  
    return o is PostDIshBody &&
      o.name == name &&
      listEquals(o.ingredients, ingredients) &&
      listEquals(o.recipe, recipe) &&
      o.healthBenefits == healthBenefits;
  }

  @override
  int get hashCode {
    return name.hashCode ^
      ingredients.hashCode ^
      recipe.hashCode ^
      healthBenefits.hashCode;
  }
}