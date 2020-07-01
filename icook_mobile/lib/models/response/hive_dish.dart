import 'package:hive/hive.dart';

part 'hive_dish.g.dart';


@HiveType(typeId: 3)
class HiveDishes extends HiveObject {

  @HiveField(0)
  List<String> dishImages;

  @HiveField(1)
  List<String> recipe;

  @HiveField(2)
  List<String> ingredients;

  @HiveField(3)
  List<String> healthBenefits;

  @HiveField(4)
  String sId;

  @HiveField(5)
  String name;

  @HiveField(6)
  String chefId;

  @HiveField(7)
  String createdAt;

  @HiveField(8)
  String updatedAt;

  @HiveField(9)
  int iV;

  @HiveField(10)
  int commentsCount;

  @HiveField(11)
  int likesCount;

  @HiveField(12)
  bool isLiked;

  HiveDishes({
      this.dishImages,
      this.recipe,
      this.ingredients,
      this.healthBenefits,
      this.sId,
      this.name,
      this.chefId,
      this.createdAt,
      this.updatedAt,
      this.iV,
      this.commentsCount,
      this.likesCount,
      this.isLiked
  });


  static HiveDishes fromMap (Map<String, dynamic> json) {

    return HiveDishes(
        dishImages : json['dishImages'].cast<String>(),
        recipe : json['recipe'].cast<String>(),
        ingredients : json['ingredients'].cast<String>(),
        healthBenefits : json['healthBenefits'].cast<String>(),
        sId : json['_id'],
        name : json['name'],
        chefId : json['chefId'],
        createdAt : json['createdAt'],
        updatedAt : json['updatedAt'],
        iV : json['__v'],
        commentsCount : json['commentsCount'],
        likesCount : json['likesCount'],
        isLiked : json['isLiked'],
    );

  }

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['dishImages'] = this.dishImages;
    data['recipe'] = this.recipe;
    data['ingredients'] = this.ingredients;
    data['healthBenefits'] = this.healthBenefits;
    data['_id'] = this.sId;
    data['name'] = this.name;
    data['chefId'] = this.chefId;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    data['commentsCount'] = this.commentsCount;
    data['likesCount'] = this.likesCount;
    data['isLiked'] = this.isLiked;

    return data;
  }

}