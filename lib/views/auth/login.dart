import 'package:flutter/material.dart';
import 'package:myapp/components/custom_text_field.dart';
import 'package:myapp/components/custom_button.dart';
import 'package:myapp/components/snack_bar.dart';
import 'package:myapp/data/user.dart';
import 'package:myapp/utils/validator.dart';
import 'package:myapp/views/auth/begin.dart';

// This page is used inside the Begin page
class Login extends StatelessWidget {
  Login({super.key});

  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(20.0)),
        border: Border.fromBorderSide(
            BorderSide(color: Color.fromARGB(64, 0, 0, 0), width: 1.0)),
        boxShadow: [BoxShadow(color: Colors.black, blurRadius: 10)],
      ),
      padding: const EdgeInsetsDirectional.all(20.0),
      child: Form(
        key: formKey,
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
              validator: Validator.emailValidator.call,
            ),
            const SizedBox(
              height: 10,
            ),
            CustomTextField(
              labelText: 'Mật khẩu*',
              hintText: 'Nhập mật khẩu của bạn.',
              textEC: password,
              isPassword: true,
              validator: Validator.passwordValidator.call,
            ),
            CustomButton(
              name: 'Đăng nhập',
              onPressed: () {
                if (formKey.currentState!.validate()) {
                  if (email.text != user.email &&
                      password.text != user.password) {
                    showMessenger(
                        'Tài khoản hoặc mật khẩu không chính xác!', context);
                  } else {
                    showMessenger('Đăng nhập thành công', context);
                  }
                }
              },
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                    onPressed: () {
                      beginPageListener.value = '/loginToForgotPassword';
                    },
                    child: const Text('Quên mật khẩu')),
                const Text('|'),
                TextButton(
                    onPressed: () {
                      beginPageListener.value = '/loginToRegister';
                    },
                    child: const Text('Tạo tài khoản')),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
