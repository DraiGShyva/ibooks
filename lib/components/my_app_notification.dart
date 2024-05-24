import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:myapp/components/my_app_text.dart';

class MyAppNotification {
  MyAppNotification._();

  static void showToast({required String content, int time = 3}) {
    Fluttertoast.showToast(
      msg: content,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      backgroundColor: Colors.grey[800],
      textColor: Colors.white,
      timeInSecForIosWeb: time,
    );
  }

  static void showAlertDialog(
      {String title = 'Đang xử lý',
      Widget? content,
      required BuildContext context,
      List<Widget>? listButton}) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Material(
          color: Colors.transparent,
          child: GestureDetector(
            onTap: () {
              FocusScope.of(context).unfocus();
            },
            child: AlertDialog(
              title: MyAppText(
                  text: title,
                  style: MyAppTextStyles.mediumBold,
                  textAlign: TextAlign.center),
              content: content ??
                  const CircleAvatar(
                    child: CircularProgressIndicator(),
                  ),
              actions: listButton,
              actionsAlignment: MainAxisAlignment.spaceBetween,
            ),
          ),
        );
      },
    );
  }
}
