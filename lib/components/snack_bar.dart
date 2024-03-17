import 'package:flutter/material.dart';

showMessenger(text, context) =>
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text('$text'),
      action: SnackBarAction(
        label: 'Undo',
        onPressed: () {
          // Some code to undo the change.
        },
      ),
    ));
