import 'package:flutter/material.dart';
import 'package:myapp/components/my_app_button.dart';
import 'package:myapp/components/my_app_slide_button.dart';
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
    Widget form = Form(
      key: formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
              alignment: Alignment.topLeft,
              child: Image.asset('assets/images/log/hello.png', width: 150)),
          const SizedBox(height: 10),
          const MyAppText(
              text: 'Log in to the application', style: MyAppTextStyles.small),
          const SizedBox(height: 10),
          MyAppTextField(
            labelText: 'Username*',
            hintText: 'Enter your username.',
            textEC: usernameController,
            validator: Validator.requiredValidator.call,
            action: TextInputAction.next,
          ),
          const SizedBox(height: 10),
          MyAppTextField(
            labelText: 'Password*',
            hintText: 'Enter your password.',
            textEC: passwordController,
            isPassword: true,
            validator: Validator.passwordValidator.call,
            onFieldSubmitted: (value) => AutheUtils.loginPressed(formKey,
                usernameController.text, passwordController.text, context),
          ),
          const SizedBox(height: 15),
          MyAppButton(
            name: 'Login',
            onPressed: () => AutheUtils.loginPressed(formKey,
                usernameController.text, passwordController.text, context),
          ),
          const SizedBox(height: 20),
          const MyAppText(
            text: 'Login with social networks:',
            style: MyAppTextStyles.smallBlue,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                onPressed: () {
                  Navigator.pushNamed(context, MyApp.LOAD);
                },
                icon: const Image(
                  image: AssetImage('assets/images/log/logo-facebook.png'),
                  width: 30,
                ),
              ),
              const MyAppText(text: '|', style: MyAppTextStyles.small),
              IconButton(
                onPressed: () {
                  Navigator.pushNamed(context, MyApp.LOAD);
                },
                icon: const Image(
                  image: AssetImage('assets/images/log/logo-google.png'),
                  width: 30,
                ),
              ),
            ],
          ),
        ],
      ),
    );

    List<Widget> slideButton = [
      Positioned(
        bottom: 100,
        left: 0,
        child: MyAppSlideButton(
          onSlideComplete: () => Navigator.pushNamed(context, MyApp.FORGOT),
          text: 'Forgot\npassword',
        ),
      ),
      Positioned(
        bottom: 100,
        right: 0,
        child: MyAppSlideButton(
          onSlideComplete: () => Navigator.pushNamed(context, MyApp.REGISTER),
          text: 'Sign Up',
          reverse: true,
        ),
      ),
    ];

    return AutheUtils.autheScaffold(
      context: context,
      containerChild: form,
      otherChild: slideButton,
    );
  }
}
