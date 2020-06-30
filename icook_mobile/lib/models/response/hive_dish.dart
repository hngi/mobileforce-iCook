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


}