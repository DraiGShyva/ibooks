// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';
import 'package:myapp/pages/Auth/forgot_password_page.dart';
import 'package:myapp/pages/Auth/login_page.dart';
import 'package:myapp/pages/Auth/register_page.dart';
import 'package:myapp/pages/chapter/chapter_list_page.dart';
import 'package:myapp/pages/chapter/chapter_page.dart';
import 'package:myapp/pages/home/home_page.dart';
import 'package:myapp/pages/other/load_page.dart';

class MyApp extends StatelessWidget {
  static String? username;

  const MyApp({super.key});

  static const String LOAD = '/load';
  static const String LOGIN = '/login';
  static const String REGISTER = '/register';
  static const String FORGOT = '/forgot-password';
  static const String HOME = '/home';
  static const String LIST_CHAPTER = '/list-chapter';
  static const String CHAPTER = '/chapter';

  static onGenerateRoute(settings) => MaterialPageRoute(
        builder: (context) {
          switch (settings.name) {
            case LOAD:
              if (settings.arguments != null) {
                return LoadPage(
                  nextPage: settings.arguments['nextPage'],
                  removeUntil: settings.arguments['removeUntil'],
                );
              }
              return const LoadPage();
            case LOGIN:
              if (settings.arguments != null) {
                return LoginPage(
                  username: settings.arguments['username'],
                );
              }
              return const LoginPage();
            case REGISTER:
              return RegisterPage();
            case FORGOT:
              return ForgotPasswordPage();
            case HOME:
              return MyBottomNavigationBar();
            case LIST_CHAPTER:
              return ChapterListPage(id: settings.arguments['id']);
            case CHAPTER:
              return ChapterPage(
                id: settings.arguments['id'],
                chapNumber: settings.arguments['chapNumber'],
              );
            default:
              return const LoginPage();
            // return MyBottomNavigationBar();
          }
        },
      );

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: buildTheme(),
      onGenerateRoute: (settings) => onGenerateRoute(settings),
    );
  }
}

ThemeData buildTheme() => ThemeData(
      useMaterial3: true,
    );
