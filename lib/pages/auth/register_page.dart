import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp/components/my_app_button_rounded.dart';
import 'package:myapp/components/my_app_notification.dart';
import 'package:myapp/components/my_app_text.dart';
import 'package:myapp/components/my_app_text_field.dart';
import 'package:myapp/controller/account_controller.dart';
import 'package:myapp/models/account_model.dart';
import 'package:myapp/utils/local_image.dart';
import 'package:myapp/utils/route.dart';
import 'package:myapp/utils/validator.dart';

class RegisterPage extends StatelessWidget {
  RegisterPage({super.key});

  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController rePasswordController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey();
  final FocusNode confirmPasswordFocusNode = FocusNode();

  registerPressed(
      {required GlobalKey<FormState> formKey,
      required String username,
      required String password,
      required BuildContext context}) {
    FocusScope.of(context).unfocus();
    if (formKey.currentState!.validate()) {
      final accountController = Get.put(AccountController());
      accountController.addAccount(
        newAccount: Account(
          username: username,
          password: password,
          favourite: [],
        ),
        onComplete: (message, isSuccessful) {
          MyAppNotification.showAlertDialog(context: context);
          Future.delayed(const Duration(seconds: 1), () {
            if (isSuccessful) {
              Navigator.pushNamedAndRemoveUntil(
                context,
                LOGIN,
                (route) => false,
                arguments: {'username': username},
              );
            } else {
              Navigator.pop(context);
            }
            MyAppNotification.showToast(content: message, context: context);
          });
        },
      );
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
            child: Image.asset(HELLO_LOG_IMG, width: 150),
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
            onFieldSubmitted: (value) => FocusScope.of(context).unfocus(),
          ),
          const SizedBox(height: 15),
          MyAppRoundedButton(
            name: 'Register',
            onPressed: () => registerPressed(
                formKey: formKey,
                username: usernameController.text,
                password: passwordController.text,
                context: context),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const MyAppText(
                  text: 'Do you have an account?',
                  style: MyAppTextStyles.small),
              TextButton(
                onPressed: () => Navigator.pushNamedAndRemoveUntil(
                    context, LOGIN, (route) => false),
                child: const MyAppText(
                    text: 'Log in', style: MyAppTextStyles.small),
              ),
            ],
          ),
        ],
      ),
    );

    return Scaffold(
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(BG_LOG_IMG),
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
                        boxShadow: [
                          BoxShadow(color: Colors.black, blurRadius: 10)
                        ],
                      ),
                      padding: const EdgeInsetsDirectional.all(20.0),
                      child: form,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
