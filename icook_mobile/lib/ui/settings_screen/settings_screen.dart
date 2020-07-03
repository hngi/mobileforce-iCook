import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:icook_mobile/core/services/key_storage/key_storage_service.dart';
import 'package:icook_mobile/ui/ui_helper.dart';
import 'package:provider/provider.dart';

import '../../locator.dart';

const heightUnit = 10;

class SettingsScreen extends StatefulWidget {
  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  final key = locator<KeyStorageService>();
  TextEditingController name;
  TextEditingController email;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    name = TextEditingController(text: key.name);
    email = TextEditingController(text: key.email);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Settings"),
          actions: <Widget>[
            Padding(
                padding: EdgeInsets.only(right: 20.0),
                child: GestureDetector(
                  onTap: () {},
                  child: Icon(
                    Icons.search,
                    size: 26.0,
                  ),
                )),
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
                child: Column(children: [
                  SizedBox(height: heightUnit * 2.0),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '      Personal Information',
                      ),
                      SizedBox(height: heightUnit * 0.5),
                      Container(
                        padding: EdgeInsets.only(left: 20, right: 20),
                        child: TextField(
                          controller: name,
                          enabled: false,
                          textInputAction: TextInputAction.next,
                          onSubmitted: (_) =>
                              FocusScope.of(context).nextFocus(),
                          keyboardType: TextInputType.text,
                          style: TextStyle(fontSize: 18, fontFamily: "Poppins"),
                          cursorColor: Color(0XFFF898989),
                          decoration: InputDecoration(
                            hintText: "Fullname",
                          ),
                        ),
                      ),
                      SizedBox(height: heightUnit * 0.5),
                      Container(
                        padding: EdgeInsets.only(left: 20, right: 20),
                        child: TextField(
                          controller: email,
                          enabled: false,
                          textInputAction: TextInputAction.next,
                          onSubmitted: (_) =>
                              FocusScope.of(context).nextFocus(),
                          keyboardType: TextInputType.text,
                          style: TextStyle(fontSize: 18, fontFamily: "Poppins"),
                          cursorColor: Color(0XFFF898989),
                          decoration: InputDecoration(
                            hintText: "Email address",
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Text(
                        '      Password',
                        style: GoogleFonts.poppins(
                            textStyle: TextStyle(fontSize: 18),
                            fontWeight: FontWeight.w500),
                      ),
                      SizedBox(
                        width: 7,
                      ),
                      Text('       Change',
                          style: GoogleFonts.poppins(
                            fontSize: 14,
                            fontWeight: FontWeight.w300,
                            color: Colors.blue,
                          )),
                      SizedBox(height: heightUnit * 0.5),
                      Container(
                        padding: EdgeInsets.only(left: 20, right: 20),
                        child: TextField(
                          obscureText: true,
                          textInputAction: TextInputAction.next,
                          onSubmitted: (_) =>
                              FocusScope.of(context).nextFocus(),
                          keyboardType: TextInputType.number,
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
                        switched:
                            Provider.of<ThemeNotifier>(context).isDarkMode,
                      )
                    ],
                  ),
                ]),
              ),
            )));
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
