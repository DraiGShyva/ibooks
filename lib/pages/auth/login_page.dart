import 'package:flutter/material.dart';
import 'package:myapp/components/my_app_button.dart';
import 'package:myapp/components/my_app_text.dart';
import 'package:myapp/components/my_app_text_field.dart';
import 'package:myapp/my_app.dart';
import 'package:myapp/utils/authe_utils.dart';
import 'package:myapp/utils/validator/validator.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key, this.username});

  final String? username;

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    if (widget.username != null) {
      usernameController.text = widget.username!;
    }
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> children = [
      Container(
          alignment: Alignment.topLeft,
          child: Image.asset('assets/images/log/hello.png', width: 150)),
      const SizedBox(height: 10),
      const MyAppText(
          text: 'Đăng nhập vào ứng dụng', style: MyAppTextStyles.small),
      const SizedBox(height: 10),
      MyAppTextField(
        labelText: 'Tài khoản*',
        hintText: 'Nhập tên người dùng của bạn.',
        textEC: usernameController,
        validator: Validator.requiredValidator.call,
        action: TextInputAction.next,
      ),
      const SizedBox(height: 10),
      MyAppTextField(
        labelText: 'Mật khẩu*',
        hintText: 'Nhập mật khẩu của bạn.',
        textEC: passwordController,
        isPassword: true,
        validator: Validator.passwordValidator.call,
        onFieldSubmitted: (value) => AutheUtils.loginPressed(
            formKey, usernameController.text, passwordController.text, context),
      ),
      const SizedBox(height: 15),
      MyAppButton(
          name: 'Đăng nhập',
          onPressed: () => AutheUtils.loginPressed(formKey,
              usernameController.text, passwordController.text, context)),
      const SizedBox(height: 10),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextButton(
              onPressed: () => Navigator.pushNamed(context, MyApp.FORGOT),
              child: const MyAppText(
                  text: 'Quên mật khẩu?', style: MyAppTextStyles.small)),
          const MyAppText(text: '|', style: MyAppTextStyles.small),
          TextButton(
            onPressed: () => Navigator.pushNamed(context, MyApp.REGISTER),
            child: const MyAppText(
                text: 'Tạo tài khoản', style: MyAppTextStyles.small),
          ),
        ],
      ),
    ];

    return AutheUtils.autheScaffold(formKey, context, children);
  }
}
