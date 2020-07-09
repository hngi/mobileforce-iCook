import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:icook_mobile/core/constants/view_state.dart';
import 'package:icook_mobile/core/services/key_storage/key_storage_service.dart';
import 'package:icook_mobile/locator.dart';
import 'package:icook_mobile/models/response/Comments/comments.dart';
import 'package:icook_mobile/ui/comment_screen/commentsmodel.dart';
import 'package:icook_mobile/ui/profile_screen/constant.dart';
import 'package:icook_mobile/ui/shared/state_responsive.dart';
import 'package:shimmer/shimmer.dart';
import 'package:stacked/stacked.dart';
import 'package:timeago/timeago.dart' as timeago;

import '../ui_helper.dart';

class CommentScreen extends StatelessWidget {
  final String dishId;
  const CommentScreen({Key key, this.dishId }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<CommentsModel>.reactive(
      viewModelBuilder: () => CommentsModel(),
      onModelReady: (model) => model.init(dishId),
      builder: (context, model, child) => Scaffold(
        key: model.scaffoldKey,
        appBar: AppBar(
          
          title: Text(
            "Comments",
          ),
        ),
        body: Stack(
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(bottom: 70),
              child: StateResponsive(
                  state: model.state,
                  busyWidget: Shimmer.fromColors(
                      child: ListView.builder(
                          itemBuilder: (context, index) => CommentShim()),
                      baseColor: Colors.grey,
                      highlightColor: Colors.white),
                  idleWidget: Center(
                    child: Text('No Comments'),
                  ),
                  dataFetchedWidget: ListView.builder(
                    reverse: true,
                    itemCount: model.comments.length,
                    itemBuilder: (context, index) =>
                        CommentItem(comment: model.comments[index]),
                  )),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: model.commentText,
                  decoration: InputDecoration(
                      hintText: 'Enter Comment',
                      border: OutlineInputBorder(
                          borderSide:
                              BorderSide(width: 0.0, style: BorderStyle.none),
                          borderRadius: BorderRadius.circular(4)),
                      suffixIcon: IconButton(
                          icon: Icon(
                            Icons.send,
                            color: Constants.kbuttonColor1,
                          ),
                          onPressed: () {
                            model.sendComment();
                            FocusScope.of(context).unfocus();
                          })),
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
          ],
        ),
      ),
    );
  }
}

class CommentItem extends StatelessWidget {
  final storage = locator<KeyStorageService>();
  final Comment comment;

  CommentItem({Key key, this.comment}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final time =
        comment.v == 0 ? DateTime.parse(comment.createdAt) : DateTime.now();
    var date = timeago.format(time);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Container(
        decoration: BoxDecoration(
            border: Border.all(
                color: comment.user == storage.id
                    ? Constants.kbuttonColor1
                    : Constants.kbuttonColor2,
                width: 2),
            borderRadius: BorderRadius.circular(10)),
        padding: EdgeInsets.all(10.0),
        margin: EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: comment.user == storage.id
              ? CrossAxisAlignment.end
              : CrossAxisAlignment.start,
          children: [
            Text(
              comment.user == storage.id ? "You" : comment.name,
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.w600,
                fontSize: 16,
                fontStyle: FontStyle.normal,
              ),
            ),
            Text(
              comment.text,
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.normal,
                fontSize: 14,
                fontStyle: FontStyle.normal,
              ),
            ),
            Text(
              comment.v == 0 ? date : comment.createdAt,
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.normal,
                fontSize: 10,
                color: Colors.red,
                fontStyle: FontStyle.normal,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CommentShim extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Container(
        decoration: BoxDecoration(
            border: Border.all(color: Constants.kbuttonColor2, width: 2),
            borderRadius: BorderRadius.circular(10)),
        padding: EdgeInsets.all(8.0),
        margin: EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: GestureDetector(
                  child: Container(
                height: 8,
                width: 70.0,
                color: Colors.black,
              )),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: GestureDetector(
                  child: Container(
                height: 8,
                width: 150.0,
                color: Colors.black,
              )),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: GestureDetector(
                  child: Container(
                height: 8,
                width: 150.0,
                color: Colors.black,
              )),
            ),
          ],
        ),
      ),
    );
  }
}
