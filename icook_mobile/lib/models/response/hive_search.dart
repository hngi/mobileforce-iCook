
import 'package:hive/hive.dart';

part 'hive_search.g.dart';


@HiveType(typeId: 2)

class SearchItem extends HiveObject{

  @HiveField(0)
  int total;

  @HiveField(1)
  int count;

  @HiveField(2)
  int after;



}