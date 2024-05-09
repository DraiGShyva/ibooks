import 'package:flutter/material.dart';
import 'package:myapp/components/my_app_notification.dart';
import 'package:myapp/data/account_data.dart';
import 'package:myapp/models/account_model.dart';
import 'package:myapp/my_app.dart';

class AutheUtils {
  AutheUtils._();

  static loginPressed(
      {required GlobalKey<FormState> formKey,
      required String username,
      required String password,
      required BuildContext context}) {
    if (formKey.currentState!.validate()) {
      if (AccountData.isAccountValid(username, password)) {
        MyApp.username = username;
        Navigator.pushNamed(context, MyApp.LOAD, arguments: {
          'nextPage': MyApp.HOME,
          'removeUntil': true,
        });
      } else {
        MyAppNotification.showToast(
            content: 'Username or password incorrectly!', context: context);
      }
    }
  }

  static registerPressed(
      {required GlobalKey<FormState> formKey,
      required String username,
      required String password,
      required BuildContext context}) {
    FocusScope.of(context).unfocus();
    if (formKey.currentState!.validate()) {
      if (AccountData.isAccountExist(username)) {
        MyAppNotification.showToast(
            content: 'Account already exists', context: context);
      } else {
        AccountData.addAccount(
          AccountModel(
            username: username,
            password: password,
            favourite: [],
          ),
        );
        MyAppNotification.showToast(
            content: 'Successful account registration', context: context);
        MyAppNotification.showAlertDialog(context: context);
        Future.delayed(const Duration(seconds: 1), () {
          Navigator.pushNamedAndRemoveUntil(
            context,
            MyApp.LOGIN,
            (route) => false,
            arguments: {'username': username},
          );
        });
      }
    }
  }

  static forgotPasswordPressed(
      {required GlobalKey<FormState> formKey,
      required String email,
      required BuildContext context}) {
    if (formKey.currentState!.validate()) {
      if (!AccountData.isAccountExist(email)) {
        MyAppNotification.showToast(
            content: 'Email does not exist in the system', context: context);
      } else {
        MyAppNotification.showToast(
            content: 'The confirmation code has been sent to your email',
            context: context);
        Navigator.pushNamedAndRemoveUntil(
          context,
          'null',
          (route) => false,
          arguments: {'email': email},
        );
      }
    }
  }

  static Scaffold autheScaffold(
      {required BuildContext context,
      required Widget containerChild,
      List<Widget>? otherChild}) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
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
                        boxShadow: [
                          BoxShadow(color: Colors.black, blurRadius: 10)
                        ],
                      ),
                      padding: const EdgeInsetsDirectional.all(20.0),
                      child: containerChild,
                    ),
                  ),
                ),
              ),
            ),
          ),
          if (MediaQuery.of(context).viewInsets.bottom == 0)
            ...(otherChild ?? const <Widget>[]),
        ],
      ),
    );
  }
}
