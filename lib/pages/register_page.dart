import 'package:flutter/material.dart';

import '../components/my_app_button.dart';
import '../components/my_app_text_field.dart';
import '../utils/on_pressed.dart';
import '../utils/validator.dart';

class RegisterPage extends StatelessWidget {
  RegisterPage({super.key});

  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController rePasswordController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey();
  final FocusNode confirmPasswordFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/log/background.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(top: 20.0, bottom: 20.0),
              child: GestureDetector(
                onTap: () => FocusScope.of(context).unfocus(),
                child: Container(
                  width: 300,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(20.0)),
                    border: Border.fromBorderSide(BorderSide(
                        color: Color.fromARGB(64, 0, 0, 0), width: 1.0)),
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
                          child: Image.asset('assets/images/log/hello.png',
                              width: 150),
                        ),
                        const SizedBox(height: 10),
                        const Text('Đăng ký tài khoản'),
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
                            FocusScope.of(context)
                                .requestFocus(confirmPasswordFocusNode);
                          },
                        ),
                        const SizedBox(height: 10),
                        MyAppTextField(
                          labelText: 'Xác nhận mật khẩu*',
                          hintText: 'Nhập lại mật khẩu của bạn.',
                          textEC: rePasswordController,
                          isPassword: true,
                          validator: Validator.confirmPasswordValidator(
                                  passwordController.text)
                              .call,
                          focusNode: confirmPasswordFocusNode,
                          onFieldSubmitted: (value) =>
                              OnPressed.registerPressed(
                                  formKey,
                                  usernameController.text,
                                  passwordController.text,
                                  context),
                        ),
                        const SizedBox(height: 15),
                        MyAppButton(
                          name: 'Đăng ký',
                          onPressed: () => OnPressed.registerPressed(
                              formKey,
                              usernameController.text,
                              passwordController.text,
                              context),
                        ),
                        const SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text('Bạn đã có tài khoản?'),
                            TextButton(
                                onPressed: () =>
                                    Navigator.pushNamedAndRemoveUntil(
                                        context, '/login', (route) => false),
                                child: const Text('Đăng nhập')),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
