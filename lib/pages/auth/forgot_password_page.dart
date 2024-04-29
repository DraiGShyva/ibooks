import 'package:flutter/material.dart';
import 'package:myapp/components/my_app_button.dart';
import 'package:myapp/components/my_app_slide_button.dart';
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
              text: 'Recover your password', style: MyAppTextStyles.small),
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
              name: 'Confirm',
              onPressed: () => AutheUtils.forgotPasswordPressed(
                  formKey, emailController.text, context)),
          const SizedBox(height: 10),
        ],
      ),
    );

    List<Widget> slideButton = [
      Positioned(
        bottom: 100,
        right: 0,
        child: MyAppSlideButton(
          onSlideComplete: () => Navigator.pushNamedAndRemoveUntil(
            context,
            MyApp.LOGIN,
            (route) => false,
          ),
          text: 'Sign In',
          reverse: true,
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
