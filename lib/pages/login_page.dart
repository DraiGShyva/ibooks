import 'package:flutter/material.dart';

import '../components/my_app_button.dart';
import '../components/my_app_text_field.dart';
import '../utils/validator.dart';
import '../utils/on_pressed.dart';

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
                              width: 150)),
                      const SizedBox(height: 10),
                      const Text('Đăng nhập vào ứng dụng'),
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
                        onFieldSubmitted: (value) => OnPressed.loginPressed(
                            formKey,
                            usernameController.text,
                            passwordController.text,
                            context),
                      ),
                      const SizedBox(height: 15),
                      MyAppButton(
                          name: 'Đăng nhập',
                          onPressed: () => OnPressed.loginPressed(
                              formKey,
                              usernameController.text,
                              passwordController.text,
                              context)),
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextButton(
                              onPressed: () => Navigator.pushNamed(
                                  context, '/forgot-password'),
                              child: const Text('Quên mật khẩu')),
                          const Text('|'),
                          TextButton(
                            onPressed: () =>
                                Navigator.pushNamed(context, '/register'),
                            child: const Text('Tạo tài khoản'),
                          ),
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
    );
  }
}
