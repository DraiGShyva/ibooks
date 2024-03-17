import 'package:flutter/material.dart';
import 'package:myapp/components/custom_text_field.dart';
import 'package:myapp/components/custom_button.dart';
import 'package:myapp/utils/validator.dart';
import 'package:myapp/views/auth/begin.dart';

// This page is used inside the Begin page
class ForgotPassword extends StatelessWidget {
  ForgotPassword({super.key});

  final TextEditingController email = TextEditingController();
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
              'Lấy lại mật khẩu của bạn',
            ),
            const SizedBox(
              height: 10,
            ),
            CustomTextField(
              labelText: 'Email*',
              hintText: 'abc123@edu.com',
              textEC: email,
              validator: Validator.emailValidator.call,
            ),
            CustomButton(
              name: 'Gửi mã xác nhận',
              onPressed: () {
                if (formKey.currentState!.validate()) {
                  //TODO: Kiểm tra email tồn tại, nếu có thì chuyển đến trang nhập mã xác nhận
                }
              },
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Bạn đã có tài khoản?'),
                TextButton(
                  onPressed: () {
                    beginPageListener.value = '/forgotPasswordToLogin';
                  },
                  child: const Text('Đăng nhập'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
