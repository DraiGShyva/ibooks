import 'package:flutter/material.dart';

import '../components/my_app_notification.dart';
import '../data/account_data.dart';
import '../models/account.dart';
import '../route.dart';

class OnPressed {
  static loginPressed(GlobalKey<FormState> formKey, String username,
      String password, BuildContext context) {
    if (formKey.currentState!.validate()) {
      if (AccountData.isAccountValid(username, password)) {
        MyAppNotification.showSnackBar(
            content: 'Tài khoản hoặc mật khẩu không chính xác!',
            context: context);
      } else {
        MyAppNotification.showSnackBar(
            content: 'Đăng nhập thành công', context: context);
        Navigator.pushNamedAndRemoveUntil(context, HOME, (route) => false);
      }
    }
  }

  static registerPressed(GlobalKey<FormState> formKey, String username,
      String password, BuildContext context) {
    FocusScope.of(context).unfocus();
    if (formKey.currentState!.validate()) {
      if (AccountData.isAccountExist(username)) {
        MyAppNotification.showSnackBar(
            content: 'Tài khoản đã tồn tại', context: context);
      } else {
        AccountData.addAccount(Account(username: username, password: password));
        MyAppNotification.showSnackBar(
            content: 'Đăng ký tài khoản thành công', context: context);
        Navigator.pushNamedAndRemoveUntil(
          context,
          LOGIN,
          (route) => false,
          arguments: {'username': username},
        );
      }
    }
  }

  static forgotPasswordPressed(
      GlobalKey<FormState> formKey, String email, BuildContext context) {
    if (formKey.currentState!.validate()) {
      if (!AccountData.isAccountExist(email)) {
        MyAppNotification.showSnackBar(
            content: 'Email không tồn tại trong hệ thống', context: context);
      } else {
        MyAppNotification.showSnackBar(
            content: 'Mã xác nhận đã được gửi đến email của bạn',
            context: context);
        Navigator.pushNamedAndRemoveUntil(
          context,
          'null',
          (route) => false,
          arguments: {'email': email},
        );
      }
    }
  }
}
