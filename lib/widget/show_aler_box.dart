import 'package:flutter/material.dart';

class CustomAlertBox extends StatelessWidget {
  final String title;
  final String message;
  final Function()? onClose;

  const CustomAlertBox({
    Key? key,
    required this.title,
    required this.message,
    this.onClose,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(title),
      content: Text(message),
      actions: <Widget>[
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
            if (onClose != null) {
              onClose!();
            }
          },
          child: Text('OK'),
        ),
      ],
    );
  }
}
