import 'package:flutter/material.dart';
import 'package:myapp/components/my_app_text.dart';

class MyAppNotification {
  MyAppNotification._();

  static void showSnackBar({
    required String content,
    required BuildContext context,
  }) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: MyAppText(text: content, style: MyAppTextStyles.small),
      action: SnackBarAction(
        label: 'Undo',
        onPressed: () {
          // Some code to undo the change.
        },
      ),
    ));
  }

  static void showAlertDialog({
    required String title,
    required Widget content,
    required BuildContext context,
    List<Widget>? listButton,
  }) {
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
        );
      },
    );
  }
}
