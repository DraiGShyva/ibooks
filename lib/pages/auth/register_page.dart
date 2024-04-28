import 'package:flutter/material.dart';
import 'package:myapp/components/my_app_button.dart';
import 'package:myapp/components/my_app_text.dart';
import 'package:myapp/components/my_app_text_field.dart';
import 'package:myapp/my_app.dart';
import 'package:myapp/utils/authe_utils.dart';
import 'package:myapp/utils/validator/validator.dart';

class RegisterPage extends StatelessWidget {
  RegisterPage({super.key});

  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController rePasswordController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey();
  final FocusNode confirmPasswordFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    List<Widget> children = [
      Container(
        alignment: Alignment.topLeft,
        child: Image.asset('assets/images/log/hello.png', width: 150),
      ),
      const SizedBox(height: 10),
      const MyAppText(text: 'Đăng ký tài khoản', style: MyAppTextStyles.small),
      const SizedBox(height: 10),
      MyAppTextField(
        labelText: 'Username*',
        hintText: 'abc123',
        textEC: usernameController,
        validator: Validator.requiredValidator.call,
        action: TextInputAction.next,
      ),
      const SizedBox(height: 10),
      MyAppTextField(
        labelText: 'Mật khẩu*',
        hintText: '[A-Z][a-z][0-9][!@#\$%^&*]',
        textEC: passwordController,
        isPassword: true,
        validator: Validator.passwordValidator.call,
        onFieldSubmitted: (value) {
          FocusScope.of(context).requestFocus(confirmPasswordFocusNode);
        },
      ),
      const SizedBox(height: 10),
      MyAppTextField(
        labelText: 'Xác nhận mật khẩu*',
        hintText: 'Nhập lại mật khẩu của bạn.',
        textEC: rePasswordController,
        isPassword: true,
        validator:
            Validator.confirmPasswordValidator(passwordController.text).call,
        focusNode: confirmPasswordFocusNode,
        onFieldSubmitted: (value) => AutheUtils.registerPressed(
            formKey, usernameController.text, passwordController.text, context),
      ),
      const SizedBox(height: 15),
      MyAppButton(
        name: 'Đăng ký',
        onPressed: () => AutheUtils.registerPressed(
            formKey, usernameController.text, passwordController.text, context),
      ),
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
                text: 'Đăng nhập', style: MyAppTextStyles.small),
          ),
        ],
      ),
    ];

    return AutheUtils.autheScaffold(formKey, context, children);
  }
}
