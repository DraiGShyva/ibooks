import 'dart:developer';

import 'package:animated_notch_bottom_bar/animated_notch_bottom_bar/animated_notch_bottom_bar.dart';
import 'package:flutter/material.dart';

class MyAppBottomNavigationBar extends StatefulWidget {
  const MyAppBottomNavigationBar({
    super.key,
    this.bottomBarPages = const [],
    this.bottomBarItems = const [],
  });

  final List<Widget> bottomBarPages;
  final List<BottomBarItem> bottomBarItems;

  @override
  State<MyAppBottomNavigationBar> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyAppBottomNavigationBar> {
  final _pageController = PageController(initialPage: 0);

  final NotchBottomBarController _controller =
      NotchBottomBarController(index: 0);

  final int _maxCount = 6;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        physics: const NeverScrollableScrollPhysics(),
        children: List.generate(widget.bottomBarPages.length,
            (index) => widget.bottomBarPages[index]),
      ),
      extendBody: true,
      bottomNavigationBar: (widget.bottomBarPages.length <= _maxCount)
          ? AnimatedNotchBottomBar(
              notchBottomBarController: _controller,
              bottomBarItems: widget.bottomBarItems,
              onTap: (index) {
                log('current selected index $index');
                _pageController.jumpToPage(index);
              },
              kBottomRadius: 28.0,
              kIconSize: 24.0,
              bottomBarWidth: MediaQuery.of(context).size.width,
            )
          : null,
    );
  }
}
