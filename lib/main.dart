import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:myapp/controller/account_controller.dart';
import 'package:myapp/controller/comic_controller.dart';
import 'package:myapp/pages/Auth/login_page.dart';
import 'package:myapp/pages/Auth/register_page.dart';
import 'package:myapp/pages/begin/onboarding_page.dart';
import 'package:myapp/pages/chapter/list_chapter_page.dart';
import 'package:myapp/pages/chapter/chapter_page.dart';
import 'package:myapp/pages/home/bottom_nav_bar.dart';
import 'package:myapp/pages/other/load_page.dart';
import 'package:myapp/pages/begin/splash_page.dart';
import 'package:myapp/utils/route.dart';

import 'controller/banner_controller.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(statusBarColor: Colors.transparent),
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static onGenerateRoute(settings) => MaterialPageRoute(
        builder: (context) {
          Get.put(AccountController()).onInit();
          switch (settings.name) {
            case LOAD:
              if (settings.arguments != null) {
                return LoadPage(nextPage: settings.arguments['nextPage']);
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

            case HOME:
              Get.put(BannerController()).onInit();
              Get.put(ComicController()).onInit();
              return const LoadPage(nextPage: BOTTOM_NAV_BAR);

            case BOTTOM_NAV_BAR:
              return BottomNavBar();

            case LIST_CHAPTER:
              return ListChapterPage(id: settings.arguments['id']);

            case CHAPTER:
              return ChapterPage(
                id: settings.arguments['id'],
                chapNumber: settings.arguments['chapNumber'],
              );

            case ONBOARDING:
              return const OnboardingPage();

            default:
              return const SplashPage();
          }
        },
      );

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
      ),
      onGenerateRoute: (settings) => onGenerateRoute(settings),
    );
  }
}
