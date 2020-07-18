import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:icook_mobile/ui/followers_screen/data.dart';

class FollowersScreen extends StatefulWidget {
  @override
  _FollowersScreenState createState() => _FollowersScreenState();
}

class _FollowersScreenState extends State<FollowersScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 4,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(
          'Followers',
          style: GoogleFonts.poppins(
              textStyle: TextStyle(fontSize: 24), fontWeight: FontWeight.w500),
        ),
        centerTitle: true,
      ),
      body: ListView.separated(
          padding: EdgeInsets.all(10),
          separatorBuilder: (BuildContext context, int index) {
            return Align(
              alignment: Alignment.centerRight,
              child: Container(
                height: 0.5,
                width: MediaQuery.of(context).size.width / 1.3,
                child: Divider(),
              ),
            );
          },
          itemCount: followers_screen.length,
          itemBuilder: (BuildContext context, int index) {
            Map followers = followers_screen[index];
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: ListTile(
                leading: CircleAvatar(
                  backgroundImage: AssetImage(
                    followers['dp'],
                  ),
                  radius: 25,
                ),
                contentPadding: EdgeInsets.all(0),
                title: Text(followers['name']),
                subtitle: Text(followers['status']),
                trailing: followers['isAccept']
                    ? FlatButton(
                        child: Text(
                          "Follow",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        color: Colors.grey,
                        onPressed: () {},
                      )
                    : FlatButton(
                        child: Text(
                          "Following",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        color: Theme.of(context).accentColor,
                        onPressed: () {},
                      ),
                onTap: () {},
              ),
            );
          }),
    );
  }
}
