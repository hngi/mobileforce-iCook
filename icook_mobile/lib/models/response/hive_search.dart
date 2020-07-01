
import 'package:hive/hive.dart';
import 'package:icook_mobile/models/response/dish.dart';

part 'hive_search.g.dart';


@HiveType(typeId: 2)

class SearchItem extends HiveObject{

  @HiveField(0)
  int total;

  @HiveField(1)
  int count;

  @HiveField(2)
  int after;

  @HiveField(3)
  List<Dish> dishes;


  SearchItem({this.total, this.count, this.after, this.dishes});

  Map<String, dynamic> toMap(){


    return {
      'total' : total,
      'count' : count,
      'after' : after,
      "dishes" : dishes.map((e) => e.toMap()).toList(),
    };
  }

  static SearchItem fromMap(Map<String, dynamic> map){

    return SearchItem(
      total: map['total'],
      count: map['count'],
      after: map['after'],
      dishes: map['dishes'].map((e) => e.fromMap()).toList()
    );
  }


}