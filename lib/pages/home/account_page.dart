import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp/components/my_app_button_rounded.dart';
import 'package:myapp/controller/app_controller.dart';
import 'package:myapp/utils/route.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: MyAppRoundedButton(
        name: 'Log out',
        onPressed: () {
          Get.put(AppController()).deleteAuthenKey();
          Navigator.pushNamedAndRemoveUntil(context, LOGIN, (route) => false);
        },
      ),
    );
  }
}
