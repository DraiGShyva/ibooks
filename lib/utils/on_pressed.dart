import 'package:flutter/material.dart';

import '../components/custom_notification.dart';
import '../data/account_data.dart';
import '../models/account.dart';
import '../pages/begin_page.dart';

class OnPressed {
  static loginPressed(GlobalKey<FormState> formKey, String username,
      String password, BuildContext context) {
    if (formKey.currentState!.validate()) {
      if (AccountData.isAccountValid(username, password)) {
        CustomNotification.showSnackBar(
            content: 'Tài khoản hoặc mật khẩu không chính xác!',
            context: context);
      } else {
        CustomNotification.showSnackBar(
            content: 'Đăng nhập thành công', context: context);
      }
    }
  }

  static registerPressed(GlobalKey<FormState> formKey, String username,
      String password, BuildContext context) {
    FocusScope.of(context).unfocus();
    if (formKey.currentState!.validate()) {
      if (AccountData.isAccountExist(username)) {
        CustomNotification.showSnackBar(
            content: 'Tài khoản đã tồn tại', context: context);
      } else {
        AccountData.addAccount(Account(username: username, password: password));
        CustomNotification.showSnackBar(
            content: 'Đăng ký tài khoản thành công', context: context);
        beginPageListener.value = '/login';
      }
    }
  }

  static forgotPasswordPressed(
      GlobalKey<FormState> formKey, String email, BuildContext context) {
    if (formKey.currentState!.validate()) {
      if (!AccountData.isAccountExist(email)) {
        CustomNotification.showSnackBar(
            content: 'Email không tồn tại trong hệ thống', context: context);
      } else {
        CustomNotification.showSnackBar(
            content: 'Mã xác nhận đã được gửi đến email của bạn',
            context: context);
        beginPageListener.value = '/reset-password';
      }
    }
  }
}
