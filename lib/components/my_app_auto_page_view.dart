import 'dart:async';
import 'package:flutter/material.dart';

class MyAppAutoPageView extends StatefulWidget {
  const MyAppAutoPageView({
    super.key,
    this.pages = const [
      Center(child: Text('Page 1')),
      Center(child: Text('Page 2')),
      Center(child: Text('Page 3')),
    ],
    this.height = 250.0,
  });

  final List<Widget> pages;
  final double height;

  @override
  State<MyAppAutoPageView> createState() => _MyAppAutoPageViewState();
}

class _MyAppAutoPageViewState extends State<MyAppAutoPageView> {
  final PageController _pageController = PageController();
  int _currentPage = 0;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  @override
  void dispose() {
    _timer?.cancel();
    _pageController.dispose();
    super.dispose();
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 2), (timer) {
      if (_currentPage < widget.pages.length - 1) {
        _currentPage++;
      } else {
        _currentPage = 0;
      }
      _pageController.animateToPage(
        _currentPage,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.height,
      child: PageView(
        controller: _pageController,
        children: widget.pages,
      ),
    );
  }
}
