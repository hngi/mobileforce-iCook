import 'package:flutter/material.dart';
import 'package:icook_mobile/core/constants/view_state.dart';
import 'package:icook_mobile/core/datasources/remotedata_source/Comments/commentsdatasource.dart';
import 'package:icook_mobile/core/services/key_storage/key_storage_service.dart';
import 'package:icook_mobile/locator.dart';
import 'package:icook_mobile/models/response/Comments/comments.dart';
import 'package:icook_mobile/models/response/Comments/postcomment.dart';
import 'package:icook_mobile/ui/base_view_model.dart';

class CommentsModel extends BaseNotifier {
  final data = locator<CommentsDataSource>();
  final key = locator<KeyStorageService>();
  //scaffoldkey
  final scaffoldKey = new GlobalKey<ScaffoldState>();

  final commentText = TextEditingController();

  String _id = "";
  String get id => _id;

  String _message = "";

  List<Comment> _comments = [];
  List<Comment> get comments => _comments;

  Future<void> getComments() async {
    setState(ViewState.Busy);

    try {
      var response = await data.getComments(id) as CommentsResponse;
      print(response);
      _comments.clear();
      _comments = response.comments;
      _checkIfAvailableData();
    } catch (e) {
      setState(ViewState.Idle);

      print('homescreen model exception $e');
      final snackbar = SnackBar(content: Text(e.toString()));
      scaffoldKey.currentState.showSnackBar(snackbar);
    }
  }

  void _checkIfAvailableData() {
    (_comments.isEmpty)
        ? setState(ViewState.NoDataAvailable)
        : setState(ViewState.DataFetched);
  }

  ///on initState
  Future<void> init(String id) async {
    _id = id;
    print(_id);
    setState(ViewState.Busy);
    await getComments();
  }

  Future<void> sendComment() async {
    if (commentText.text.isEmpty || commentText.text == null) return;
    final submit = Comment(
        name: key.name,
        user: key.id,
        text: commentText.text,
        createdAt: "sending......",
        v: 1);

    _comments.insert(0, submit);
    _message = commentText.text;
    commentText.clear();
    notifyListeners();
    try {
      var response =
          await data.postComment(_message, id) as PostCommentResponse;

      print(response);
      if (response.status == "success") {
        _comments.remove(submit);
        _comments.insert(0, response.comments);
        notifyListeners();
      }
    } catch (e) {
      setState(ViewState.Idle);
      print('homescreen model exception $e');
      final snackbar = SnackBar(content: Text(e.toString()));
      scaffoldKey.currentState.showSnackBar(snackbar);
    }
  }

  void deleteComment() {

  }
}
