import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:icook_mobile/ui/ui_helper.dart';

const heightUnit = 10;

class SettingsScreen extends StatefulWidget {
  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(
          'Settings',
          style: GoogleFonts.poppins(
              textStyle: TextStyle(fontSize: 24), fontWeight: FontWeight.w500),
        ),
        centerTitle: true,
        actions: <Widget>[
          Icon(Icons.search),
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
                SizedBox(height: heightUnit * 2.0),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '      Personal Information',
                      style: GoogleFonts.poppins(
                          textStyle: TextStyle(fontSize: 18),
                          fontWeight: FontWeight.w500),
                    ),
                    SizedBox(height: heightUnit * 0.5),
                    Container(
                      padding: EdgeInsets.only(left: 20, right: 20, bottom: 20),
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
                          hintStyle:
                              TextStyle(fontSize: 16, fontFamily: "Poppins"),
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
                      padding: EdgeInsets.only(left: 20, right: 20, bottom: 20),
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
                          hintStyle:
                              TextStyle(fontSize: 16, fontFamily: "Poppins"),
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
                    Container(
                      child: Row(children: <Widget>[
                        Text(
                          '      Password',
                          style: GoogleFonts.poppins(
                              textStyle: TextStyle(fontSize: 18),
                              fontWeight: FontWeight.w500),
                        ),
                        FlatButton(
                          textColor: Colors.blue,
                          child: Text('Change',
                              textAlign: TextAlign.right,
                              style: GoogleFonts.poppins(
                                fontSize: 14,
                                fontWeight: FontWeight.w300,
                              )),
                          onPressed: () => _onTextTap(),
                        ),
                      ]),
                    ),
                  ],
                ),
                SizedBox(height: heightUnit * 0.5),
                Container(
                  padding: EdgeInsets.only(left: 20, right: 20),
                  child: TextField(
                    obscureText: true,
                    textInputAction: TextInputAction.next,
                    onSubmitted: (_) => FocusScope.of(context).nextFocus(),
                    keyboardType: TextInputType.visiblePassword,
                    style: TextStyle(fontSize: 16, fontFamily: "Poppins"),
                    cursorColor: Color(0XFFF898989),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  '      Notifications',
                  style: GoogleFonts.poppins(
                      textStyle: TextStyle(fontSize: 18),
                      fontWeight: FontWeight.w500),
                ),
                Divider(),
                SizedBox(
                  height: 5,
                ),
                NotificationsItem(
                  title: 'Activity on posts',
                  switched: false,
                ),
                NotificationsItem(
                  title: 'NewsLetter',
                  switched: false,
                ),
                NotificationsItem(
                  title: 'Auto Update App',
                  switched: false,
                ),
                NotificationsItem(
                  title: 'Dark Mode',
                  settings: Settings.DarkMode,
                  switched: Provider.of<ThemeNotifier>(context).isDarkMode,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _onTextTap() {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return Container(
            child: _addChangePassword(),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
              topLeft: const Radius.circular(40),
              topRight: const Radius.circular(40),
            )),
          );
        });
  }

  Column _addChangePassword() {
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(top: 2.0, bottom: 2.0),
          child: Column(
            children: [
              SizedBox(height: heightUnit * 2.0),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '      Password Change',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                        textStyle: TextStyle(fontSize: 18),
                        fontWeight: FontWeight.w500),
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 10, right: 10, bottom: 10),
                    child: TextField(
                      obscureText: true,
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.number,
                      style: TextStyle(fontSize: 16, fontFamily: "Poppins"),
                      cursorColor: Color(0XFFF898989),
                      decoration: InputDecoration(
                        hintText: "Current Password",
                      ),
                    ),
                  ),
                ],
              ),
              Text('Forgot Password?',
                  textAlign: TextAlign.right,
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    fontWeight: FontWeight.w300,
                    color: Colors.blue,
                  )),
              // password input

              Padding(
                padding: EdgeInsets.only(left: 10, right: 10, bottom: 10),
                child: TextField(
                  obscureText: true,
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.visiblePassword,
                  style: TextStyle(fontSize: 16, fontFamily: "Poppins"),
                  decoration: InputDecoration(
                    hintText: "New Password",
                  ),
                ),
              ),
              // password input
              Padding(
                padding: EdgeInsets.only(left: 10, right: 10, bottom: 10),
                child: TextField(
                  obscureText: true,
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.visiblePassword,
                  style: TextStyle(fontSize: 16, fontFamily: "Poppins"),
                  decoration: InputDecoration(
                    hintText: "Confirm Password",
                  ),
                ),
              ),
              // submit button
              //

              Container(
                padding: EdgeInsets.only(left: 10, right: 10, bottom: 10),
                child: Column(
                  children: <Widget>[
                    RaisedButton(
                      child: Text("Save Password"),
                      textColor: Colors.white,
                      color: Colors.blue,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(3)),
                      onPressed: () => CloseButton,
                    ),
                  ],
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}

enum Settings { DarkMode }

class NotificationsItem extends StatelessWidget {
  final String title;
  final Settings settings;
  final bool switched;

  const NotificationsItem({
    Key key,
    this.title,
    this.settings,
    this.switched,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<ThemeNotifier>(context, listen: false);
    return Padding(
      padding: const EdgeInsets.only(left: 8.0),
      child: ListTile(
        title: new Text(title),
        trailing: new Switch(
          value: switched,
          activeColor: Colors.blue,
          activeTrackColor: Colors.blueAccent,
          onChanged: (v) {
            if (settings == Settings.DarkMode) {
              print('called $v');
              model.updateTheme(value: v);
            }
          },
        ),
      ),
    );
  }
}
