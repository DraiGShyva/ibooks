import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppController extends GetxController {
  final authenKey = ''.obs;
  final isFirstRun = true.obs;

  @override
  void onInit() {
    loadEnv();
    super.onInit();
  }

  Future<void> loadEnv() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    authenKey(prefs.getString('AUTHEN_KEY') ?? '');
    isFirstRun(prefs.getBool('FIRST_RUN') ?? true);
  }

  Future<void> saveAuthenKey() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('AUTHEN_KEY', authenKey.value);
  }

  Future<void> deleteAuthenKey() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('AUTHEN_KEY');
  }

  Future<void> saveFirstRun() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('FIRST_RUN', isFirstRun.value);
  }
}
