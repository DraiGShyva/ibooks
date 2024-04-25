import 'package:animated_notch_bottom_bar/animated_notch_bottom_bar/animated_notch_bottom_bar.dart';
import 'package:flutter/material.dart';

import '../components/my_app_bottom_navigation_bar.dart';
import 'account_page.dart';
import 'chat_page.dart';
import 'favourite_page.dart';
import 'home_page.dart';

class MyBottomNavigationBar extends StatelessWidget {
  MyBottomNavigationBar({super.key});

  final List<Widget> bottomBarPages = [
    const HomePage(),
    const FavouritePage(),
    const ChatPage(),
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
        color: Colors.blueAccent,
      ),
    ),
    const BottomBarItem(
      itemLabel: 'Chat',
      inActiveItem: Icon(
        Icons.chat_outlined,
        color: Colors.blueGrey,
      ),
      activeItem: Icon(
        Icons.chat,
        color: Colors.pink,
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
        color: Colors.yellow,
      ),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MyAppBottomNavigationBar(
        bottomBarPages: bottomBarPages,
        bottomBarItems: bottomBarItems,
      ),
    );
  }
}
