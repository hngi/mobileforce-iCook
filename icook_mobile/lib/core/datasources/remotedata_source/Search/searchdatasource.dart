import 'package:icook_mobile/models/response/Search/searchdish.dart';
import 'package:icook_mobile/models/response/Search/searchuser.dart';

abstract class SearchDataSource {
  Future<dynamic> searchForUser(String name);

  Future<dynamic> searchForDish(String name);
  
}
