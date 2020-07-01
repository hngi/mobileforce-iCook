class FavoriteDish {
  String status;
  String error;
  Data data;

  FavoriteDish({this.status, this.error, this.data});

  FavoriteDish.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    error = json['error'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['error'] = this.error;
    if (this.data != null) {
      data['data'] = this.data.toJson();
    }
    return data;
  }
}

class Data {
  int total;
  int count;
  List<Dishes> dishes;
  String after;

  Data({this.total, this.count, this.dishes, this.after});

  Data.fromJson(Map<String, dynamic> json) {
    total = json['total'];
    count = json['count'];
    if (json['dishes'] != null) {
      dishes = new List<Dishes>();
      json['dishes'].forEach((v) {
        dishes.add(new Dishes.fromJson(v));
      });
    }
    after = json['after'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['total'] = this.total;
    data['count'] = this.count;
    if (this.dishes != null) {
      data['dishes'] = this.dishes.map((v) => v.toJson()).toList();
    }
    data['after'] = this.after;
    return data;
  }
}

class Dishes {
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

  Dishes(
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
        this.isLiked});

  Dishes.fromJson(Map<String, dynamic> json) {
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
    return data;
  }
}
