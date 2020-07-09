import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:icook_mobile/ui/edit_profile_screen/edit_profilemodel.dart';
import 'package:icook_mobile/ui/profile_screen/constant.dart';
import 'package:icook_mobile/ui/shared/state_responsive.dart';
import 'package:icook_mobile/ui/signup_screen/signup_screen.dart';
import 'package:stacked/stacked.dart';

class EditProfile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<EditProfileModel>.reactive(
      viewModelBuilder: () => EditProfileModel(),
      onModelReady: (model) => model.init(),
      builder: (context, model, _) => Scaffold(
        key: model.scaffoldKey,
        appBar: AppBar(
            title: Text(
          'Edit Details',
          style: GoogleFonts.poppins(
              textStyle: TextStyle(color: Colors.black, fontSize: 24),
              fontWeight: FontWeight.w500),
        )),
        body: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
            new TextEditingController().clear();
          },
          child: Padding(
            padding: const EdgeInsets.only(top: 5.0),
            child: SingleChildScrollView(
              child: Form(
                key: model.formkey,
                child: Column(
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      height: 134,
                      width: 134,
                      child: Stack(
                        children: <Widget>[
                          GestureDetector(
                            onTap: () {},
                            child: Container(
                                child: StateResponsive(
                                    state: model.state,
                                    busyWidget: CircularProgressIndicator(),
                                    idleWidget: SizedBox.shrink()),
                                width: 134,
                                height: 134,
                                decoration: new BoxDecoration(
                                    shape: BoxShape.circle,
                                    image: new DecorationImage(
                                      fit: BoxFit.cover,
                                      image: model.imageUrl.isEmpty
                                          ? AssetImage(
                                              'assets/images/chefavatar1.png')
                                          : CachedNetworkImageProvider(
                                              model.imageUrl),
                                    ))),
                          ),
                          GestureDetector(
                            onTap: () => model.chooseImage(),
                            child: Align(
                              alignment: Alignment.bottomRight,
                              child: Container(
                                padding: EdgeInsets.all(5),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(15)),
                                margin: EdgeInsets.only(bottom: 10, right: 10),
                                child: Icon(Icons.edit),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 20, right: 20),
                          child: Text(
                            'Name',
                            style: GoogleFonts.poppins(
                                textStyle: TextStyle(
                                    color: Color(0xff333333), fontSize: 18),
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                        SizedBox(height: 10.5),
                        Container(
                          padding: EdgeInsets.only(left: 20, right: 20),
                          child: TextFormField(
                            textInputAction: TextInputAction.next,
                            controller: model.name,
                            keyboardType: TextInputType.text,
                            style:
                                TextStyle(fontSize: 18, fontFamily: "Poppins"),
                            cursorColor: Color(0XFFF898989),
                            decoration: InputDecoration(
                              hintText: "Enter Name",
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 20, right: 20),
                          child: Text(
                            'Email Address',
                            style: GoogleFonts.poppins(
                                textStyle: TextStyle(
                                  color: Color(0xff333333),
                                  fontSize: 18,
                                ),
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                        SizedBox(height: 10.5),
                        Container(
                          padding: EdgeInsets.only(left: 20, right: 20),
                          child: TextFormField(
                            textInputAction: TextInputAction.next,
                            controller: model.email,
                            keyboardType: TextInputType.emailAddress,
                            style:
                                TextStyle(fontSize: 16, fontFamily: "Poppins"),
                            cursorColor: Color(0XFFF898989),
                            decoration: InputDecoration(
                              hintText: "Emmanuel.cook@gmail.com",
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 20, right: 20),
                          child: Text(
                            'Phone Number',
                            style: GoogleFonts.poppins(
                                textStyle: TextStyle(
                                    color: Color(0xff333333), fontSize: 18),
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                        SizedBox(height: 10.5),
                        Container(
                          padding: EdgeInsets.only(left: 20, right: 20),
                          child: TextFormField(
                            textInputAction: TextInputAction.next,
                            controller: model.phone,
                            keyboardType: TextInputType.number,
                            style:
                                TextStyle(fontSize: 16, fontFamily: "Poppins"),
                            cursorColor: Color(0XFFF898989),
                            decoration: InputDecoration(hintText: "+234"),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 20, right: 20),
                          child: Text(
                            'Bio',
                            style: GoogleFonts.poppins(
                                textStyle: TextStyle(
                                    color: Color(0XFF333333), fontSize: 18),
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                        SizedBox(height: 10.5),
                        Container(
                          padding: EdgeInsets.only(left: 20, right: 20),
                          child: TextFormField(
                            textInputAction: TextInputAction.done,
                            controller: model.bio,
                            minLines: 4,
                            maxLines: 10,
                            keyboardType: TextInputType.text,
                            style: TextStyle(
                              fontSize: 16,
                              fontFamily: "Poppins",
                            ),
                            cursorColor: Color(0XFFF898989),
                            decoration: InputDecoration(
                              hintText: 'Enter text',
                            ),
                          ),
                        ),
                        SizedBox(height: 10),
                        Container(
                            padding: EdgeInsets.only(left: 20, right: 20),
                            child: PasswordField(
                              validator: (v) =>
                                  model.validatePassword(model.password.text),
                              controller: model.password,
                            )),
                        SizedBox(
                          height: 50,
                        ),
                        Container(
                          padding: EdgeInsets.only(left: 20, right: 20),
                          child: Material(
                            borderRadius: BorderRadius.circular(10),
                            color: Color(0xFFF578DDE),
                            child: MaterialButton(
                              padding: EdgeInsets.all(15),
                              minWidth: 330,
                              onPressed: () {},
                              child: Text(
                                "Update Profile",
                                style: GoogleFonts.poppins(
                                    textStyle: TextStyle(
                                        letterSpacing: 1,
                                        color: Colors.white,
                                        fontSize: 18),
                                    fontWeight: FontWeight.w600),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
