import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp/components/my_app_button_rounded.dart';
import 'package:myapp/components/my_app_notification.dart';
import 'package:myapp/components/my_app_text.dart';
import 'package:myapp/components/my_app_text_field.dart';
import 'package:myapp/controller/account_controller.dart';
import 'package:myapp/controller/app_controller.dart';
import 'package:myapp/utils/colors.dart';
import 'package:myapp/utils/local_image.dart';
import 'package:myapp/utils/route.dart';
import 'package:myapp/utils/validator.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key, this.username});

  final String? username;

  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    if (username != null) _usernameController.text = username!;

    Widget form = Form(
      key: _formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
              alignment: Alignment.topLeft,
              child: Image.asset(HELLO_LOG_IMG, width: 150)),
          const SizedBox(height: 10),
          const MyAppText('Log in to the application',
              style: MyAppTextStyles.small),
          const SizedBox(height: 10),
          MyAppTextField(
            labelText: 'Username*',
            hintText: 'Enter your username.',
            textEC: _usernameController,
            validator: Validator.requiredValidator.call,
            action: TextInputAction.next,
          ),
          const SizedBox(height: 10),
          MyAppTextField(
            labelText: 'Password*',
            hintText: 'Enter your password.',
            textEC: _passwordController,
            isPassword: true,
            validator: Validator.passwordValidator.call,
            onFieldSubmitted: (value) => _loginPressed(context,
                formKey: _formKey,
                username: _usernameController.text,
                password: _passwordController.text),
          ),
          const SizedBox(height: 10),
          MyAppRoundedButton(
            child: const MyAppText('Login', style: MyAppTextStyles.mediumBlue),
            onPressed: () => _loginPressed(context,
                formKey: _formKey,
                username: _usernameController.text,
                password: _passwordController.text),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const MyAppText('Do not have an account?',
                  style: MyAppTextStyles.small),
              TextButton(
                onPressed: () => Navigator.pushNamed(context, REGISTER),
                child:
                    const MyAppText('Register', style: MyAppTextStyles.small),
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
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(BG_LOG_IMG), fit: BoxFit.cover)),
              child: Center(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 20.0, bottom: 20.0),
                    child: Container(
                      width: 300,
                      decoration: BoxDecoration(
                        color: Get.put(AppController()).isDarkMode.value
                            ? MyAppColors.blueGrey
                            : MyAppColors.white,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(20.0)),
                        border: const Border.fromBorderSide(BorderSide(
                            color: Color.fromARGB(64, 0, 0, 0), width: 1.0)),
                        boxShadow: const [
                          BoxShadow(color: MyAppColors.black, blurRadius: 10)
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

_loginPressed(BuildContext context,
    {required GlobalKey<FormState> formKey,
    required String username,
    required String password}) {
  if (formKey.currentState!.validate()) {
    final accountController = Get.put(AccountController());
    final appController = Get.put(AppController());
    accountController.isAccountValid(
      username: username,
      password: password,
      onComplete: (check) {
        MyAppNotification.showAlertDialog(context: context);
        Future.delayed(const Duration(seconds: 1), () {
          if (check) {
            appController.authenKey.value = username;
            appController.saveAuthenKey();
            MyAppNotification.showToast(content: 'Login successful!');
            Navigator.pushNamed(context, LOAD, arguments: {
              'nextPage': HOME,
              'removeUntil': true,
            });
          } else {
            MyAppNotification.showToast(
                content: 'Username or password incorrectly!');
            Navigator.pop(context);
          }
        });
      },
    );
  }
}
