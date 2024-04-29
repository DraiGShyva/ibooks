import 'package:flutter/material.dart';
import 'package:myapp/components/my_app_button.dart';
import 'package:myapp/components/my_app_slide_button.dart';
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
    Widget form = Form(
      key: formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            alignment: Alignment.topLeft,
            child: Image.asset('assets/images/log/hello.png', width: 150),
          ),
          const SizedBox(height: 10),
          const MyAppText(
              text: 'Sign up for an account', style: MyAppTextStyles.small),
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
            onFieldSubmitted: (value) {
              FocusScope.of(context).requestFocus(confirmPasswordFocusNode);
            },
          ),
          const SizedBox(height: 10),
          MyAppTextField(
            labelText: 'Confirm Password*',
            hintText: 'Enter your password again.',
            textEC: rePasswordController,
            isPassword: true,
            validator:
                Validator.confirmPasswordValidator(passwordController.text)
                    .call,
            focusNode: confirmPasswordFocusNode,
            onFieldSubmitted: (value) => AutheUtils.registerPressed(formKey,
                usernameController.text, passwordController.text, context),
          ),
          const SizedBox(height: 15),
          MyAppButton(
            name: 'Register',
            onPressed: () => AutheUtils.registerPressed(formKey,
                usernameController.text, passwordController.text, context),
          ),
        ],
      ),
    );

    List<Widget> slideButton = [
      Positioned(
        bottom: 100,
        left: 0,
        child: MyAppSlideButton(
          onSlideComplete: () => Navigator.pushNamedAndRemoveUntil(
            context,
            MyApp.LOGIN,
            (route) => false,
          ),
          text: 'Sign In',
        ),
      )
    ];

    return AutheUtils.autheScaffold(
      context: context,
      containerChild: form,
      otherChild: slideButton,
    );
  }
}
