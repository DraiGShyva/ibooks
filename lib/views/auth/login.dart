import 'package:flutter/material.dart';

import '../../components/custom_button.dart';
import '../../components/custom_text_field.dart';
import '../../components/notification.dart';
import '../../data/user.dart';
import '../../utils/validator.dart';
import 'begin.dart';

// This page is used inside the Begin page
class Login extends StatelessWidget {
  Login({super.key});

  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    loginPressed() {
      if (formKey.currentState!.validate()) {
        if (email.text != user.email && password.text != user.password) {
          showSnackBarMessenger(
              content: 'Tài khoản hoặc mật khẩu không chính xác!',
              context: context);
        } else {
          showSnackBarMessenger(
              content: 'Đăng nhập thành công', context: context);
        }
      }
    }

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
                child: Image.asset('assets/images/log/hello.png', width: 150)),
            const SizedBox(height: 10),
            const Text('Đăng nhập vào ứng dụng'),
            const SizedBox(height: 10),
            CustomTextField(
              labelText: 'Tài khoản*',
              hintText: 'Nhập email của bạn.',
              textEC: email,
              validator: Validator.emailValidator.call,
              action: TextInputAction.next,
            ),
            const SizedBox(height: 10),
            CustomTextField(
              labelText: 'Mật khẩu*',
              hintText: 'Nhập mật khẩu của bạn.',
              textEC: password,
              isPassword: true,
              validator: Validator.passwordValidator.call,
              onFieldSubmitted: (value) {
                loginPressed();
              },
            ),
            const SizedBox(height: 15),
            CustomButton(name: 'Đăng nhập', onPressed: loginPressed),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                    onPressed: () {
                      beginPageListener.value = '/forgotPassword';
                    },
                    child: const Text('Quên mật khẩu')),
                const Text('|'),
                TextButton(
                  onPressed: () {
                    beginPageListener.value = '/register';
                  },
                  child: const Text('Tạo tài khoản'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
