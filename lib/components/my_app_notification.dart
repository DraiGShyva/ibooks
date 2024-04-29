import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:myapp/components/my_app_text.dart';

class MyAppNotification {
  MyAppNotification._();

  static void showToast(
      {required String content, required BuildContext context}) {
    Fluttertoast.showToast(
      msg: content,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      backgroundColor: Colors.grey[800],
      textColor: Colors.white,
    );
  }

  static void showAlertDialog(
      {required String title,
      required Widget content,
      required BuildContext context,
      List<Widget>? listButton}) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: MyAppText(text: title, style: MyAppTextStyles.mediumBold),
          content: content,
          actions: listButton ??
              [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text('OK'),
                ),
              ],
          actionsAlignment: MainAxisAlignment.spaceBetween,
        );
      },
    );
  }
}
