import 'package:flutter/material.dart';
import 'package:myapp/views/customs/log/custom_button.dart';
import 'package:myapp/views/customs/log/custom_text_field.dart';

//router name: '/login'
class Login extends StatelessWidget {
  final TextEditingController? username;
  const Login({super.key, this.username});

  @override
  Widget build(BuildContext context) {
    TextEditingController password = TextEditingController();
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
              height: 400,
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
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      'Đăng nhập vào ứng dụng',
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    CustomTextField(
                      labelText: 'Tài khoản*',
                      hintText: 'Nhập tài khoản của bạn.',
                      textEC: username,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    CustomTextField(
                      labelText: 'Mật khẩu*',
                      hintText: 'Nhập mật khẩu của bạn.',
                      textEC: password,
                      isPassword: true,
                    ),
                    CustomButton(
                      name: 'Đăng nhập',
                      onPressed: () {
                        Navigator.of(context).pushNamed('/login');
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
                            onPressed: () {},
                            child: const Text('Tạo tài khoản')),
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
