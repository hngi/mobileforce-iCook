import 'package:icook_mobile/models/response/Search/searchdish.dart';
import 'package:icook_mobile/models/response/Search/searchuser.dart';

abstract class SearchDataSource {
  Future<SearchUserResponse> searchForUser(String name);

  Future<SearchDishResponse> searchForDish(String name);
  
}
