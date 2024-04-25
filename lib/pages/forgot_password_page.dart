import 'package:flutter/material.dart';
import 'package:myapp/utils/on_pressed.dart';

import '../components/my_app_button.dart';
import '../components/my_app_text_field.dart';
import '../utils/validator.dart';

// This page is used inside the Begin page
class ForgotPasswordPage extends StatelessWidget {
  ForgotPasswordPage({super.key});

  final TextEditingController emailController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey();

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
                      const Text('Lấy lại mật khẩu của bạn'),
                      const SizedBox(height: 10),
                      MyAppTextField(
                        labelText: 'Email*',
                        hintText: 'abc123@edu.com',
                        textEC: emailController,
                        validator: Validator.emailValidator.call,
                        onFieldSubmitted: (value) =>
                            OnPressed.forgotPasswordPressed(
                                formKey, emailController.text, context),
                      ),
                      const SizedBox(height: 15),
                      MyAppButton(
                          name: 'Xác nhận',
                          onPressed: () => OnPressed.forgotPasswordPressed(
                              formKey, emailController.text, context)),
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text('Bạn đã có tài khoản?'),
                          TextButton(
                            onPressed: () => Navigator.pushNamedAndRemoveUntil(
                                context, '/login', (route) => false),
                            child: const Text('Đăng nhập'),
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
