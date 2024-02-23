import 'package:flutter/material.dart';
import 'package:myapp/resources/custom_text_field.dart';
import 'package:myapp/resources/custom_button.dart';
import 'package:myapp/views/begin.dart';

// This page is used inside the Begin page
class Register extends StatelessWidget {
  const Register({
    super.key,
    required this.email,
    required this.password,
    required this.rePassword,
  });

  final TextEditingController email;
  final TextEditingController password;
  final TextEditingController rePassword;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          alignment: Alignment.topLeft,
          child: Image.asset(
            'assets/images/log/hello.png',
            width: 150,
          ),
        ),
        const SizedBox(height: 10),
        const Text('Đăng ký tài khoản'),
        const SizedBox(height: 10),
        CustomTextField(
          labelText: 'Email*',
          hintText: 'abc123@edu.com',
          textEC: email,
        ),
        const SizedBox(height: 10),
        CustomTextField(
          labelText: 'Mật khẩu*',
          hintText: '[A-Z][a-z][0-9][!@#\$%^&*]',
          textEC: password,
          isPassword: true,
        ),
        const SizedBox(height: 10),
        CustomTextField(
          labelText: 'Xác nhận mật khẩu*',
          hintText: 'Nhập lại mật khẩu của bạn.',
          textEC: rePassword,
          isPassword: true,
        ),
        CustomButton(
          name: 'Đăng ký',
          onPressed: () {
            beginPage.value = '/registerToLogin';
            clearPass();
          },
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Bạn đã có tài khoản?'),
            TextButton(
                onPressed: () {
                  beginPage.value = '/registerToLogin';
                  clearEmail();
                },
                child: const Text('Đăng nhập')),
          ],
        ),
      ],
    );
  }
}
