class Dish {
  List<String> dishImages;
  List<String> recipe;
  List<String> ingredients;
  List<String> healthBenefits;
  String sId;
  String name;
  String chefId;
  String createdAt;
  String updatedAt;
  int iV;
  int commentsCount;
  int likesCount;
  bool isLiked;
  bool isFavourite;

  Dish(
      {this.dishImages,
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
        this.isLiked,
        this.isFavourite});

  Dish.fromJson(Map<String, dynamic> json) {
    dishImages = json['dishImages'].cast<String>();
    recipe = json['recipe'].cast<String>();
    ingredients = json['ingredients'].cast<String>();
    healthBenefits = json['healthBenefits'].cast<String>();
    sId = json['_id'];
    name = json['name'];
    chefId = json['chefId'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
    commentsCount = json['commentsCount'];
    likesCount = json['likesCount'];
    isLiked = json['isLiked'];
    isFavourite = json['isFavourite'];
  }

  static Dish fromMap (Map<String, dynamic> json) {

    return Dish(
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
    isFavourite : json['isFavourite']
    );

}

  Map<String, dynamic> toJson() {
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
    data['isFavourite'] = this.isFavourite;
    return data;
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
    data['isFavourite'] = this.isFavourite;
    return data;
  }
}