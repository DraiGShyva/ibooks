import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:myapp/data/account_data.dart';
import 'package:myapp/data/chapter_data.dart';
import 'package:myapp/data/comic_data.dart';
import 'package:myapp/my_app.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarBrightness: Brightness.dark,
      statusBarIconBrightness: Brightness.light,
    ),
  );

  AccountData.init();
  ComicData.init();
  ChapterData.init();

  runApp(const MyApp());
}
