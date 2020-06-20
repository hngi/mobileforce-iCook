import 'package:flutter/material.dart';
import 'package:icook_mobile/ui/favorite_screen/favorite_screen.dart';
import 'package:icook_mobile/ui/profile_screen/profile_screen.dart';
import 'package:icook_mobile/ui/search_screen/search_page.dart';
import 'package:icook_mobile/ui/widgets/lazy_indexstack.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int index = 0;
  var headers = <String>[
    'Feeds',
    'Search',
  ];

  var _views = [
    FavoriteScreen(),
    SearchView(),
    FavoriteScreen(),
    ProfileScreen()
  ];

  // BottomNavigationBarItem builder
  BottomNavigationBarItem _bottomNavigationBarItem(
    IconData icon,
    String label,
  ) =>
      BottomNavigationBarItem(
          icon: Icon(
            icon,
          ),
          title: Text(label));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LazyIndexedStack(
        itemBuilder: (context, _) => _views[index],
        itemCount: _views.length,
        index: index,
        reuse: true,
      ),
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(
          // sets the background color of the `BottomNavigationBar`
          canvasColor: Theme.of(context).primaryColor,
          // sets the active color of the `BottomNavigationBar` if `Brightness` is light
          primaryColor: Colors.blue,
          textTheme: Theme.of(context).textTheme.copyWith(
                caption: TextStyle(color: Colors.grey[500], fontSize: 10),
              ),
        ),
        child: BottomNavigationBar(
          items: [
            _bottomNavigationBarItem(Icons.home, 'Home'),
            _bottomNavigationBarItem(Icons.search, 'Search'),
            _bottomNavigationBarItem(Icons.add_circle, 'Add'),
            _bottomNavigationBarItem(
                Icons.favorite, 'Favorite'),
            _bottomNavigationBarItem(
                Icons.person_outline, 'Profile'),
          ],
          type: BottomNavigationBarType.fixed,
          elevation: 15,
          currentIndex: index,
          onTap: (page) {
            setState(() {
              index = page;
            });
          },
        ),
      ),
    );
  }
}
