
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:icook_mobile/ui/profile_screen/constant.dart';


class ProfileSetting extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
        'Settings',
        style: GoogleFonts.poppins(
            textStyle: TextStyle(color: Colors.black, fontSize: 24),
            fontWeight: FontWeight.w500),
      ),
      centerTitle: true,
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 12),
            child: Image.asset(
              "assets/images/search.png",
              height: 18,
              width: 20,
            ),
          )
        ],
      ),

      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
          new TextEditingController().clear();
        },
        child: Padding(
          padding: const EdgeInsets.only(top: 5.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                
                SizedBox(height: kSpacingUnit.w * 2),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '      Personal Information',
                      style: GoogleFonts.poppins(
                          textStyle:
                              TextStyle(color: Color(0xff333333), fontSize: 18),
                          fontWeight: FontWeight.w500),
                    ),
                    SizedBox(height: kSpacingUnit.w * 0.5),
                    Container(
                      padding: EdgeInsets.only(left: 20, right: 20),
                      child: TextField(
                        textInputAction: TextInputAction.next,
                        onSubmitted: (_) => FocusScope.of(context).nextFocus(),
                        keyboardType: TextInputType.text,
                        style: TextStyle(fontSize: 18, fontFamily: "Poppins"),
                        cursorColor: Color(0XFFF898989),
                        decoration: InputDecoration(
                          contentPadding:
                              EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 15.0),
                          hintText: "Fullname",
                          hintStyle: TextStyle(
                              color: Color(0XFFBDBDBD),
                              fontSize: 16,
                              fontFamily: "Poppins"),
                          fillColor: Color(0xFFF4F4F4),
                          filled: true,
                          focusedBorder: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(7.0)),
                            borderSide: BorderSide(color: Color(0xFF578DDE)),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10.0)),
                            borderSide: BorderSide(color: Color(0xFFF4F4F4)),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: kSpacingUnit.w * 0.5),
                    Container(
                      padding: EdgeInsets.only(left: 20, right: 20),
                      child: TextField(
                        textInputAction: TextInputAction.next,
                        onSubmitted: (_) => FocusScope.of(context).nextFocus(),
                        keyboardType: TextInputType.text,
                        style: TextStyle(fontSize: 18, fontFamily: "Poppins"),
                        cursorColor: Color(0XFFF898989),
                        decoration: InputDecoration(
                          contentPadding:
                              EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 15.0),
                          hintText: "Email address",
                          hintStyle: TextStyle(
                              color: Color(0XFFBDBDBD),
                              fontSize: 16,
                              fontFamily: "Poppins"),
                          fillColor: Color(0xFFF4F4F4),
                          filled: true,
                          focusedBorder: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(7.0)),
                            borderSide: BorderSide(color: Color(0xFF578DDE)),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10.0)),
                            borderSide: BorderSide(color: Color(0xFFF4F4F4)),
                          ),
                        ),
                      ),
                    ),
                    
                    SizedBox(
                      height: 30,
                    ),
                    Text(
                      '      Password',
                      style: GoogleFonts.poppins(
                          textStyle:
                              TextStyle(color: Color(0xff333333), fontSize: 18),
                          fontWeight: FontWeight.w500),
                    ),
                    Text(
                'Change',
                 style: GoogleFonts.poppins(
                   
                    fontSize: 14,
                    fontWeight: FontWeight.w300,
                    color: Colors.blue,)
                          ),
                    
                    SizedBox(height: kSpacingUnit.w * 0.5),
                    Container(
                      padding: EdgeInsets.only(left: 20, right: 20),
                      child: TextField(
                        obscureText: true,
                        textInputAction: TextInputAction.next,
                        onSubmitted: (_) => FocusScope.of(context).nextFocus(),
                        keyboardType: TextInputType.number,
                        style: TextStyle(fontSize: 16, fontFamily: "Poppins"),
                        cursorColor: Color(0XFFF898989),
                        decoration: InputDecoration(
                          contentPadding:
                              EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 15.0),
                      
                          fillColor: Color(0xFFF4F4F4),
                          filled: true,
                          focusedBorder: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(7.0)),
                            borderSide: BorderSide(color: Color(0xFF578DDE)),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10.0)),
                            borderSide: BorderSide(color: Color(0xFFF4F4F4)),
                          ),
                        ),
                      ),
                
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      '      Notifications',
                      style: GoogleFonts.poppins(
                          textStyle:
                              TextStyle(color: Color(0XFF333333), fontSize: 18),
                          fontWeight: FontWeight.w500),
                    ),
                    ListTile(
                  title: Text(
                    'Activity on Posts',
                    style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w500)),
                  ),
            
       
                    ),

                SizedBox(
                  height: 5,
                ),
                ListTile(
                  title: Text(
                    'Newsletter',
                    style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w500)),
                  ),
                  
              
       
                    ),
                SizedBox(
                  height: 5,
                ),
                ListTile(
                  title: Text(
                    'Auto Update App',
                    style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w500)),
                  ),
                
                    ),
                SizedBox(
                  height: 5,
                ),
                ListTile(
                  title: Text(
                    'Dark Mode',
                    style: GoogleFonts.poppins(
                        textStyle: TextStyle(color: Colors.black, fontSize: 16),
                        fontWeight: FontWeight.w500),
                  ),
                  
                
                  ),
          
                SizedBox(
                  height: 5,
                ),
                
              ],
            ),
              ]
            ),
      ),
    )));
  }}

//   class NotificationsItem extends StatefulWidget {

//   final String title;

//   const NotificationsItem({Key key, this.title}) : super(key: key);

//   @override
//   _NotificationsItemState createState() => _NotificationsItemState();
// }

// class _NotificationsItemState extends State<NotificationsItem> {

//   bool isSwitched = false;

//   @override
//   Widget build(BuildContext context) {
//     return ListTile(
//       title:
//       new Text(widget.title),
//       trailing: new Switch(
//         value: isSwitched,
//         activeColor: Colors.blue,
//         activeTrackColor: Colors.blueAccent,
//         onChanged: (value){
//           setState(() {
//             isSwitched = value;
//           });
//         },
//       ),
//     );
//   }
// }


// class MyStatefulWidget extends StatefulWidget {
//   MyStatefulWidget({Key key}) : super(key: key);

//   @override
//   _MyStatefulWidgetState createState() => _MyStatefulWidgetState();
// }

// class _MyStatefulWidgetState extends State<MyStatefulWidget> {
//   bool _lights = false;

//   @override
//   Widget build(BuildContext context) {
//     return SwitchListTile(
//       title: const Text('Activity on Posts'),
//       value: _lights,
//       onChanged: (bool value) {
//         setState(() {
//           _lights = value;
//         });
//       },
      
//     );
//   }
// }
