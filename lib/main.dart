import 'package:flutter/material.dart';
import 'package:myapp/views/pages/login.dart';

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
          // transitionDuration: const Duration(milliseconds: 400),
        );
    return MaterialApp(
      title: 'My App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: const Login(),
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case "/login":
            return settings.arguments == null
                ? fadePageRoute(const Login())
                : fadePageRoute(Login(
                    username: settings.arguments as TextEditingController));
          default:
            return null;
        }
      },
    );
  }
}
