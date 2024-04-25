import 'package:animated_notch_bottom_bar/animated_notch_bottom_bar/animated_notch_bottom_bar.dart';
import 'package:flutter/material.dart';

import '../components/my_app_bottom_navigation_bar.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final List<Widget> bottomBarPages = [
    const Page1(),
    const Page2(),
    const Page3(),
    const Page4(),
    const Page5(),
  ];

  final List<BottomBarItem> bottomBarItems = [
    const BottomBarItem(
      itemLabel: 'Page 1',
      inActiveItem: Icon(
        Icons.home_filled,
        color: Colors.blueGrey,
      ),
      activeItem: Icon(
        Icons.home_filled,
        color: Colors.blueAccent,
      ),
    ),
    const BottomBarItem(
      itemLabel: 'Page 2',
      inActiveItem: Icon(Icons.star, color: Colors.blueGrey),
      activeItem: Icon(
        Icons.star,
        color: Colors.blueAccent,
      ),
    ),
    const BottomBarItem(
      itemLabel: 'Page 3',
      inActiveItem: Icon(
        Icons.settings,
        color: Colors.blueGrey,
      ),
      activeItem: Icon(
        Icons.settings,
        color: Colors.pink,
      ),
    ),
    const BottomBarItem(
      itemLabel: 'Page 4',
      inActiveItem: Icon(
        Icons.person,
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

/// add controller to check weather index through change or not. in page 1
class Page1 extends StatelessWidget {
  final NotchBottomBarController? controller;

  const Page1({Key? key, this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.yellow,
      child: Center(
        /// adding GestureDetector
        child: GestureDetector(
          behavior: HitTestBehavior.translucent,
          onTap: () {
            controller?.jumpTo(2);
          },
          child: const Text('Page 1'),
        ),
      ),
    );
  }
}

class Page2 extends StatelessWidget {
  const Page2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.green, child: const Center(child: Text('Page 2')));
  }
}

class Page3 extends StatelessWidget {
  const Page3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.red, child: const Center(child: Text('Page 3')));
  }
}

class Page4 extends StatelessWidget {
  const Page4({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.blue, child: const Center(child: Text('Page 4')));
  }
}

class Page5 extends StatelessWidget {
  const Page5({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.lightGreenAccent,
        child: const Center(child: Text('Page 5')));
  }
}
