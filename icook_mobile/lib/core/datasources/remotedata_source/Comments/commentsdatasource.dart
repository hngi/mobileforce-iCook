import 'dart:convert';

import 'package:icook_mobile/core/constants/api_routes.dart';
import 'package:icook_mobile/core/services/Api/ApiService.dart';
import 'package:icook_mobile/core/services/key_storage/key_storage_service.dart';
import 'package:icook_mobile/models/response/Comments/comments.dart';
import 'package:icook_mobile/models/response/Comments/postcomment.dart';

import '../../../../locator.dart';

abstract class CommentsDataSource {
  Future<dynamic> getComments(String id);

  Future<dynamic> postComment(String text, String id);

  Future<dynamic> deleteComment(String id);
}

class CommentsDataSourceImpl extends CommentsDataSource {
  final api = locator<ApiService>();
  final key = locator<KeyStorageService>();
  @override
  Future deleteComment(String id) async {
    String token = key.token ?? "";
    final headers = <String, String>{
      "Accept": "application/json",
      "Content-Type": "application/x-www-form-urlencoded",
      "Authorization": "$token"
    };

    final route = '${ApiRoutes.comments}/$id';
    try {
      final response = await api.delete(route, headers);
      print('delete dish response $response');

      return response;
    } catch (e) {
      print('exception $e');
      throw (e);
    }
  }

  @override
  Future<dynamic> getComments(String id) async {
    String token = key.token ?? "";
    final headers = <String, String>{
      "Accept": "application/json",
      "Content-Type": "application/x-www-form-urlencoded",
      "Authorization": "$token"
    };

    final route = '${ApiRoutes.comments}/$id';
    try {
      final response = await api.gett(route, headers);
      print('get dish by $id response $response');
      CommentsResponse result = CommentsResponse.fromJson(response);
      return result;
    } catch (e) {
      print('exception $e');
      throw (e);
    }
  }

  @override
  Future<dynamic> postComment(String text, String id) async {
    String token = key.token ?? "";
    final headers = <String, String>{
      "Content-Type": "application/json",
      "Authorization": "$token"
    };

    final body = <String, dynamic>{"text": "$text"};
    print(body);
    final route = '${ApiRoutes.comments}/$id';
    
    try {
      final response = await api.post(route, headers, jsonEncode(body));
      print('post response $response');
      PostCommentResponse result = PostCommentResponse.fromJson(response);
      return result;
    } catch (e) {
      print('exception $e');
      throw (e);
    }
  }
}
