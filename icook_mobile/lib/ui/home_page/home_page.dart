import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:icook_mobile/ui/create_recipe_screen/create_recipe_screen.dart';
import 'package:icook_mobile/ui/favorite_screen/favorite_screen.dart';
import 'package:icook_mobile/ui/home_page/home_page_model.dart';
import 'package:icook_mobile/ui/home_screen/home_screen.dart';
import 'package:icook_mobile/ui/profile_screen/profile_screen.dart';
import 'package:icook_mobile/ui/search_screen/search_page.dart';
import 'package:icook_mobile/ui/shared/lazy_indexstack.dart';
import 'package:icook_mobile/ui/ui_helper.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:stacked/stacked.dart';

class HomePage extends StatelessWidget {
  final _views = [
    HomeScreen(),
    SearchView(),
    CreateRecipeScreen(),
    FavoriteScreen(),
    ProfileScreen()
  ];

  // BottomNavigationBarItem builder
  BottomNavigationBarItem _bottomNavigationBarItem(
          String icon, String activeIcon, String label) =>
      BottomNavigationBarItem(
          backgroundColor: Colors.black,
          icon: ImageIcon(AssetImage(icon)),
          activeIcon: ImageIcon(AssetImage(activeIcon)),
          title: Text(label));

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomePageModel>.reactive(
      viewModelBuilder: () => HomePageModel(),
      builder: (context, model, child) => Scaffold(
        body: LazyIndexedStack(
          itemBuilder: (context, _) => _views[model.index],
          itemCount: _views.length,
          index: model.index,
          reuse: true,
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: [
            _bottomNavigationBarItem('assets/images/home.png',
                'assets/images/homeselected.png', 'Home'),
            _bottomNavigationBarItem('assets/images/search.png',
                'assets/images/searchselected.png', 'Search'),
            _bottomNavigationBarItem('assets/images/adddish.png',
                'assets/images/adddishselected.png', 'Add'),
            _bottomNavigationBarItem('assets/images/favourites.png',
                'assets/images/favouriteselected.png', 'Favorite'),
            _bottomNavigationBarItem('assets/images/profile.png',
                'assets/images/profileselected.png', 'Profile'),
          ],
          type: BottomNavigationBarType.fixed,
          showSelectedLabels: false,
          selectedIconTheme: IconThemeData(color: Constants.kbuttonColor1),
          showUnselectedLabels: false,
          elevation: 15,
          backgroundColor: Theme.of(context).bottomAppBarColor,
          currentIndex: model.index,
          onTap: (newIndex) => model.changeTab(newIndex),
        ),
      ),
    );
  }
}
