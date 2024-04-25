import 'package:flutter/material.dart';
import 'package:myapp/pages/begin_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    fadePageRoute(Widget page) => PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) => page,
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return SlideTransition(
              position: Tween<Offset>(
                begin: const Offset(1.0, 0.0),
                end: Offset.zero,
              ).animate(animation),
              child: child,
            );
          },
          transitionDuration: const Duration(milliseconds: 400),
        );
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: const BeginPage(),
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case "/begin":
            return fadePageRoute(const BeginPage());
          default:
            return null;
        }
      },
    );
  }
}
