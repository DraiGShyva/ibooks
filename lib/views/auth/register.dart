import 'package:flutter/material.dart';
import 'package:myapp/components/custom_text_field.dart';
import 'package:myapp/components/custom_button.dart';
import 'package:myapp/utils/validator.dart';
import 'package:myapp/views/auth/begin.dart';

// This page is used inside the Begin page
class Register extends StatelessWidget {
  Register({super.key});

  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  final TextEditingController rePassword = TextEditingController();
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
              child: Image.asset('assets/images/log/hello.png', width: 150),
            ),
            const SizedBox(height: 10),
            const Text('Đăng ký tài khoản'),
            const SizedBox(height: 10),
            CustomTextField(
              labelText: 'Email*',
              hintText: 'abc123@edu.com',
              textEC: email,
              validator: Validator.emailValidator.call,
            ),
            const SizedBox(height: 10),
            CustomTextField(
              labelText: 'Mật khẩu*',
              hintText: '[A-Z][a-z][0-9][!@#\$%^&*]',
              textEC: password,
              isPassword: true,
              validator: Validator.passwordValidator.call,
            ),
            const SizedBox(height: 10),
            CustomTextField(
              labelText: 'Xác nhận mật khẩu*',
              hintText: 'Nhập lại mật khẩu của bạn.',
              textEC: rePassword,
              isPassword: true,
              validator: Validator.confirmPasswordValidator(password.text).call,
            ),
            CustomButton(
              name: 'Đăng ký',
              onPressed: () {
                if (formKey.currentState!.validate()) {
                  //TODO: Gửi dữ liệu đăng ký tài khoản
                  beginPageListener.value = '/registerToLogin';
                }
              },
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Bạn đã có tài khoản?'),
                TextButton(
                    onPressed: () {
                      beginPageListener.value = '/registerToLogin';
                    },
                    child: const Text('Đăng nhập')),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
