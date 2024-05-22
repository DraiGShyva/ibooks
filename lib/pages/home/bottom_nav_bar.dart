import 'package:animated_notch_bottom_bar/animated_notch_bottom_bar/animated_notch_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:myapp/components/my_app_bottom_navigation_bar.dart';
import 'package:myapp/pages/home/account_page.dart';
import 'package:myapp/pages/home/favourite_page.dart';
import 'package:myapp/pages/home/home_page.dart';

class BottomNavBar extends StatelessWidget {
  BottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MyAppBottomNavigationBar(
        bottomBarPages: bottomBarPages,
        bottomBarItems: bottomBarItems,
      ),
    );
  }

  final List<Widget> bottomBarPages = [
    const HomePage(),
    const FavouritePage(),
    const AccountPage(),
  ];

  final List<BottomBarItem> bottomBarItems = [
    const BottomBarItem(
      itemLabel: 'Home',
      inActiveItem: Icon(
        Icons.home_outlined,
        color: Colors.blueGrey,
      ),
      activeItem: Icon(
        Icons.home_filled,
        color: Colors.blueAccent,
      ),
    ),
    const BottomBarItem(
      itemLabel: 'Favourite',
      inActiveItem: Icon(Icons.star_border, color: Colors.blueGrey),
      activeItem: Icon(
        Icons.star,
        color: Colors.amber,
      ),
    ),
    const BottomBarItem(
      itemLabel: 'Account',
      inActiveItem: Icon(
        Icons.person_outline,
        color: Colors.blueGrey,
      ),
      activeItem: Icon(
        Icons.person,
        color: Colors.green,
      ),
    ),
  ];
}
