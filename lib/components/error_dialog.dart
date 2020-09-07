import 'package:flutter/material.dart';

class ErrorDialog extends StatelessWidget {
  final String errorMessage;

  ErrorDialog(this.errorMessage);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Error',
            style: TextStyle(fontSize: 24),
          ),
          Icon(
            Icons.error,
            color: Colors.red,
            size: 32,
          ),
        ],
      ),
      content: Text(
        errorMessage,
      ),
      actions: [
        new FlatButton(
          child: new Text('Entendido'),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ],
    );
  }
}
