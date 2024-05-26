import 'package:animated_notch_bottom_bar/animated_notch_bottom_bar/animated_notch_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp/components/my_app_bottom_navigation_bar.dart';
import 'package:myapp/components/my_app_text.dart';
import 'package:myapp/controller/app_controller.dart';
import 'package:myapp/pages/home/account_page.dart';
import 'package:myapp/pages/home/favourite_page.dart';
import 'package:myapp/pages/home/home_page.dart';
import 'package:myapp/utils/colors.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  @override
  Widget build(BuildContext context) {
    Get.put(AppController()).isDarkMode.listen((isDarkMode) {
      if (mounted) setState(() {});
    });

    return Scaffold(
      body: MyAppBottomNavigationBar(
        bottomBarPages: _bottomBarPages,
        bottomBarItems: _bottomBarItems,
        kBottomBarColor: Get.put(AppController()).isDarkMode.value
            ? MyAppColors.black70
            : MyAppColors.white70,
      ),
    );
  }

  final List<Widget> _bottomBarPages = [
    const HomePage(),
    const FavouritePage(),
    const AccountPage(),
  ];

  final List<BottomBarItem> _bottomBarItems = [
    const BottomBarItem(
      itemLabelWidget: MyAppText('Home', style: MyAppTextStyles.small),
      inActiveItem: Icon(Icons.home_outlined),
      activeItem: Icon(
        Icons.home_filled,
        color: MyAppColors.blueAccent,
      ),
    ),
    const BottomBarItem(
      itemLabelWidget: MyAppText('Favourite', style: MyAppTextStyles.small),
      inActiveItem: Icon(Icons.favorite_border),
      activeItem: Icon(
        Icons.favorite,
        color: MyAppColors.redAccent,
      ),
    ),
    const BottomBarItem(
      itemLabelWidget: MyAppText('Account', style: MyAppTextStyles.small),
      inActiveItem: Icon(Icons.person_outline),
      activeItem: Icon(
        Icons.person,
        color: MyAppColors.greenAccent,
      ),
    ),
  ];
}
