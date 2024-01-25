import 'package:flutter/material.dart';
import 'package:myapp/resources/custom_text_field.dart';
import 'package:myapp/resources/custom_button.dart';

//router name: '/login'
class Register extends StatelessWidget {
  const Register({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController email = TextEditingController();
    TextEditingController username = TextEditingController();
    TextEditingController password = TextEditingController();
    TextEditingController rePassword = TextEditingController();
    return Stack(
      children: [
        Container(
          decoration: const BoxDecoration(
            color: Color.fromARGB(255, 235, 241, 255),
            image: DecorationImage(
              image: AssetImage('assets/images/log/background.jpg'),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Material(
          color: Colors.transparent,
          child: Center(
            child: Ink(
              height: 520,
              width: 300,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(20.0)),
                border: Border.fromBorderSide(
                  BorderSide(
                    color: Color.fromARGB(64, 0, 0, 0),
                    width: 1.0,
                  ),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black,
                    blurRadius: 10,
                  ),
                ],
              ),
              padding: const EdgeInsetsDirectional.all(20.0),
              child: Center(
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
                    const SizedBox(height: 10),
                    const Text('Đăng ký tài khoản'),
                    const SizedBox(height: 10),
                    CustomTextField(
                      labelText: 'Email*',
                      hintText: 'Nhập email của bạn.',
                      textEC: email,
                    ),
                    const SizedBox(height: 10),
                    CustomTextField(
                      labelText: 'Tài khoản*',
                      hintText: 'Nhập tài khoản của bạn.',
                      textEC: username,
                    ),
                    const SizedBox(height: 10),
                    CustomTextField(
                      labelText: 'Mật khẩu*',
                      hintText: 'Nhập mật khẩu của bạn.',
                      textEC: password,
                      isPassword: true,
                    ),
                    const SizedBox(height: 10),
                    CustomTextField(
                      labelText: 'Nhập lại mật khẩu*',
                      hintText: 'Nhập lại mật khẩu của bạn.',
                      textEC: rePassword,
                      isPassword: true,
                    ),
                    CustomButton(
                      name: 'Đăng ký',
                      onPressed: () {
                        Navigator.of(context).pushNamedAndRemoveUntil(
                            '/login', (route) => false,
                            arguments: username.text);
                      },
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextButton(
                            onPressed: () {},
                            child: const Text('Quên mật khẩu')),
                        const Text('|'),
                        TextButton(
                            onPressed: () {
                              Navigator.of(context).pushNamedAndRemoveUntil(
                                '/login',
                                (route) => false,
                              );
                            },
                            child: const Text('Đăng nhập')),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
