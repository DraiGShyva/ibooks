import 'package:flutter/material.dart';

showSnackBarMessenger({
  required String content,
  required BuildContext context,
}) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: Text(content),
    action: SnackBarAction(
      label: 'Undo',
      onPressed: () {
        // Some code to undo the change.
      },
    ),
  ));
}

showDialogMessage({
  required String title,
  required String content,
  required BuildContext context,
  List<Widget>? listButton,
}) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(title),
        content: Text(content),
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
