
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';


const heightUnit = 10;
class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Settings"),
        leading: GestureDetector(
      onTap: () { /* Write listener code here */ },
      child: Icon(
        Icons.arrow_back_ios,  // add custom icons also
      ),
  ),
  actions: <Widget>[
    Padding(
      padding: EdgeInsets.only(right: 20.0),
      child: GestureDetector(
        onTap: () {},
        child: Icon(
          Icons.search,
          size: 26.0,
        ),
      )
    ),
  
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
                      SizedBox(height: heightUnit* 2.0),
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
                          SizedBox(height: heightUnit* 0.5),
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
                          SizedBox(height: heightUnit * 0.5),
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
                                  borderSide: BorderSide(color: Colors.white),
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
                         
                          SizedBox(
                width: 7,
              ),
                          Text(
                              '       Change',
                              style: GoogleFonts.poppins(
                                fontSize: 14,
                                fontWeight: FontWeight.w300,
                                color: Colors.blue,)
                          ),
                              
                          SizedBox(height: heightUnit* 0.5),
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
                          SizedBox(
                            height: 5,
                          ),
                          NotificationsItem(title: 'Activity on posts'),
                          NotificationsItem(title: 'NewsLetter'),
                          NotificationsItem(title: 'Auto Update App'),
                          NotificationsItem(title: 'Dark Mode'),
                        ],
                        
                      ),
                    ]
                ),
              ),
            )));
  }}
class NotificationsItem extends StatefulWidget {
//  final bool isSwitched;
  final String title;
  const NotificationsItem({Key key, this.title}) : super(key: key);
  @override
  _NotificationsItemState createState() => _NotificationsItemState();
}
class _NotificationsItemState extends State<NotificationsItem> {
  bool isSwitched = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0),
      child: ListTile(
        title:
        new Text(widget.title
        ),
        trailing: new Switch(
          value: isSwitched,
          activeColor: Colors.blue,
          activeTrackColor: Colors.blueAccent,
          onChanged: (value){
            setState(() {
              isSwitched = value;
            });
          },
        ),
      ),
    );
  }
}

  
