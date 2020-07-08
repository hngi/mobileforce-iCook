import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:icook_mobile/ui/profile_screen/constant.dart';

import '../ui_helper.dart';

class CommentScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context,
        height: double.infinity, width: 375, allowFontScaling: true);

    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.arrow_back_ios),
        title: Text(
          "Comment",
          style: GoogleFonts.poppins(
              fontWeight: FontWeight.w500,
              fontSize: 20,
              fontStyle: FontStyle.normal),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.only(
          left: 20,
          right: 20,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Expanded(
              child: ListView(
                children: <Widget>[
                  _buildComment(
                      name: "Scott Martial",
                      comment: "This really helped me alot thank you",
                      image: "assets/images/chef_emma.jpg"),
                  _buildComment(
                      name: "Scott Martial",
                      comment: "This really helped me alot thank you",
                      image: "assets/images/chef_emma.jpg"),
                  _buildComment(
                      name: "Scott Martial",
                      comment: "This really helped me alot thank you",
                      image: "assets/images/chef_emma.jpg"),
                  _buildComment(
                      name: "Scott Martial",
                      comment: "This really helped me alot thank you",
                      image: "assets/images/chef_emma.jpg"),
                  _buildComment(
                      name: "Scott Martial",
                      comment: "This really helped me alot thank you",
                      image: "assets/images/chef_emma.jpg"),
                  _buildComment(
                      name: "Scott Martial",
                      comment: "This really helped me alot thank you",
                      image: "assets/images/chef_emma.jpg"),
                  _buildComment(
                      name: "Scott Martial",
                      comment: "This really helped me alot thank you",
                      image: "assets/images/chef_emma.jpg"),
                  _buildComment(
                      name: "Scott Martial",
                      comment: "This really helped me alot thank you",
                      image: "assets/images/chef_emma.jpg"),
                  _buildComment(
                      name: "Scott Martial",
                      comment: "This really helped me alot thank you",
                      image: "assets/images/chef_emma.jpg"),
                  _buildComment(
                      name: "Scott Martial",
                      comment: "This really helped me alot thank you",
                      image: "assets/images/chef_emma.jpg"),
                  _buildComment(
                      name: "Scott Martial",
                      comment: "This really helped me alot thank you",
                      image: "assets/images/chef_emma.jpg"),
                  _buildComment(
                      name: "Scott Martial",
                      comment: "This really helped me alot thank you",
                      image: "assets/images/chef_emma.jpg"),
                  _buildComment(
                      name: "Scott Martial",
                      comment: "This really helped me alot thank you",
                      image: "assets/images/chef_emma.jpg"),
                ],
              ),
            ),
            SizedBox(
              height: 54,
            ),
            TextField(
              decoration: InputDecoration(
                  hintText: 'Enter email',
                  border: OutlineInputBorder(
                      borderSide:
                          BorderSide(width: 0.0, style: BorderStyle.none),
                      borderRadius: BorderRadius.circular(4)),
                  suffixIcon:
                      IconButton(icon: Icon(Icons.send, color: Constants.kbuttonColor1,), onPressed: () {})),
            ),
            SizedBox(
              height: 30,
            ),
          ],
        ),
      ),
    );
  }

  _buildComment({String name, String comment, String image}) {
    return ListTile(
      contentPadding: EdgeInsets.all(0),
      leading: Container(
        height: kSpacingUnit.w * 4,
        width: kSpacingUnit.w * 4,
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            image:
                DecorationImage(fit: BoxFit.cover, image: AssetImage(image))),
      ),
      title: Text(
        name,
        style: GoogleFonts.poppins(
          fontWeight: FontWeight.normal,
          fontSize: 14,
          fontStyle: FontStyle.normal,
        ),
      ),
      subtitle: Text(
        comment,
        style: GoogleFonts.poppins(
          fontWeight: FontWeight.normal,
          fontSize: 14,
          fontStyle: FontStyle.normal,
        ),
      ),
    );
  }
}
