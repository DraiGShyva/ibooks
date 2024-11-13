import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:ibooks/controller/account_controller.dart';
import 'package:ibooks/controller/app_controller.dart';
import 'package:ibooks/controller/banner_controller.dart';
import 'package:ibooks/controller/chapter_controller.dart';
import 'package:ibooks/controller/comic_controller.dart';
import 'package:ibooks/pages/auth/login_page.dart';
import 'package:ibooks/pages/auth/register_page.dart';
import 'package:ibooks/pages/begin/onboarding_page.dart';
import 'package:ibooks/pages/chapter/list_chapter_page.dart';
import 'package:ibooks/pages/chapter/chapter_page.dart';
import 'package:ibooks/pages/home/bottom_nav_bar.dart';
import 'package:ibooks/pages/other/category_selection_page.dart';
import 'package:ibooks/pages/other/load_page.dart';
import 'package:ibooks/pages/begin/splash_page.dart';
import 'package:ibooks/pages/other/notification_page.dart';
import 'package:ibooks/pages/other/search_page.dart';
import 'package:ibooks/utils/colors.dart';
import 'package:ibooks/utils/route.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(statusBarColor: MyAppColors.transparent),
  );

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
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
              return LoginPage();

            case REGISTER:
              return RegisterPage();

            case HOME:
              Get.put(BannerController()).onInit();
              Get.put(ComicController()).onInit();
              Get.put(ChapterController()).onInit();
              return LoadPage.widget(next: const BottomNavBar());

            case LIST_CHAPTER:
              return ListChapterPage(id: settings.arguments['id']);

            case CHAPTER:
              return ChapterPage(
                id: settings.arguments['id'],
                chapNumber: settings.arguments['chapNumber'],
              );

            case ONBOARDING:
              return const OnboardingPage();

            case SEARCH:
              return SearchPage(searchItem: settings.arguments['searchItem']);

            case CATEGORY_SELECTION:
              return CategorySelectionPage(items: settings.arguments['items']);

            case NOTIFICATION:
              return const NotificationPage();

            default:
              return const SplashPage();
          }
        },
      );

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = ThemeData(
        useMaterial3: true,
        brightness: Get.put(AppController()).isDarkMode.value
            ? Brightness.dark
            : Brightness.light);

    Get.put(AppController()).isDarkMode.listen((isDarkMode) {
      if (mounted) setState(() {});
    });

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: themeData,
      onGenerateRoute: (settings) => MyApp.onGenerateRoute(settings),
    );
  }
}
