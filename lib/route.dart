// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';

import 'pages/forgot_password_page.dart';
import 'pages/login_page.dart';
import 'pages/my_bottom_navigation_bar.dart';
import 'pages/register_page.dart';

const String LOGIN = '/login';
const String REGISTER = '/register';
const String FORGOT = '/forgot-password';
const String HOME = '/home';

onGenerateRoute(settings) => MaterialPageRoute(builder: (context) {
      switch (settings.name) {
        case LOGIN:
          return LoginPage(
            username: settings.arguments['username'],
          );
        case REGISTER:
          return RegisterPage();
        case FORGOT:
          return ForgotPasswordPage();
        case HOME:
          return MyBottomNavigationBar();
        default:
          return MyBottomNavigationBar();
      }
    });

// customScaleTransition(Widget child) => PageRouteBuilder(
//     pageBuilder: (context, animation, secondaryAnimation) =>
//         ScaleTransition(
//           scale: Tween<double>(
//             begin: 0.0,
//             end: 1.0,
//           ).animate(AnimationController(
//             vsync: Navigator.of(context),
//             duration: const Duration(milliseconds: 500),
//           )..forward()),
//           child: child,
//         ));