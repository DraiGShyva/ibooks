import 'package:flutter/material.dart';
import 'package:myapp/resources/custom_text_field.dart';
import 'package:myapp/resources/custom_button.dart';
import 'package:myapp/views/begin.dart';

// This page is used inside the Begin page
class Login extends StatelessWidget {
  const Login({
    super.key,
    required this.email,
    required this.password,
  });

  final TextEditingController email;
  final TextEditingController password;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Center(
        child: Ink(
          height: 400,
          width: 300,
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(20.0)),
            border: Border.fromBorderSide(
              BorderSide(
                color: Color.fromARGB(64, 0, 0, 0),
                width: 1.0,
              ),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black,
                blurRadius: 10,
              ),
            ],
          ),
          padding: const EdgeInsetsDirectional.all(20.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  alignment: Alignment.topLeft,
                  child: Image.asset(
                    'assets/images/log/hello.png',
                    width: 150,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  'Đăng nhập vào ứng dụng',
                ),
                const SizedBox(
                  height: 10,
                ),
                CustomTextField(
                  labelText: 'Tài khoản*',
                  hintText: 'Nhập email của bạn.',
                  textEC: email,
                ),
                const SizedBox(
                  height: 10,
                ),
                CustomTextField(
                  labelText: 'Mật khẩu*',
                  hintText: 'Nhập mật khẩu của bạn.',
                  textEC: password,
                  isPassword: true,
                ),
                CustomButton(
                  name: 'Đăng nhập',
                  onPressed: () {},
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton(
                        onPressed: () {
                          beginPage.value = '/loginToForgotPassword';
                          clearPass();
                        },
                        child: const Text('Quên mật khẩu')),
                    const Text('|'),
                    TextButton(
                        onPressed: () {
                          beginPage.value = '/loginToRegister';
                          clearEmail();
                          clearPass();
                        },
                        child: const Text('Tạo tài khoản')),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
