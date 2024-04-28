import 'package:flutter/material.dart';
import 'package:myapp/components/my_app_button.dart';
import 'package:myapp/components/my_app_text.dart';
import 'package:myapp/components/my_app_text_field.dart';
import 'package:myapp/my_app.dart';
import 'package:myapp/utils/authe_utils.dart';
import 'package:myapp/utils/validator/validator.dart';

class ForgotPasswordPage extends StatelessWidget {
  ForgotPasswordPage({super.key});

  final TextEditingController emailController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    List<Widget> children = [
      Container(
          alignment: Alignment.topLeft,
          child: Image.asset('assets/images/log/hello.png', width: 150)),
      const SizedBox(height: 10),
      const MyAppText(
          text: 'Lấy lại mật khẩu của bạn', style: MyAppTextStyles.small),
      const SizedBox(height: 10),
      MyAppTextField(
        labelText: 'Email*',
        hintText: 'abc123@edu.com',
        textEC: emailController,
        validator: Validator.emailValidator.call,
        onFieldSubmitted: (value) => AutheUtils.forgotPasswordPressed(
            formKey, emailController.text, context),
      ),
      const SizedBox(height: 15),
      MyAppButton(
          name: 'Xác nhận',
          onPressed: () => AutheUtils.forgotPasswordPressed(
              formKey, emailController.text, context)),
      const SizedBox(height: 10),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const MyAppText(
              text: 'Bạn đã có tài khoản?', style: MyAppTextStyles.small),
          TextButton(
              onPressed: () => Navigator.pushNamedAndRemoveUntil(
                  context, MyApp.LOGIN, (route) => false),
              child: const MyAppText(
                text: 'Đăng nhập',
                style: MyAppTextStyles.small,
              )),
        ],
      ),
    ];

    return AutheUtils.autheScaffold(formKey, context, children);
  }
}
