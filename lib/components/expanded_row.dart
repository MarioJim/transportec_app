import 'package:flutter/material.dart';

class ExpandedRow extends StatelessWidget {
  final Widget left, right;

  ExpandedRow(this.left, this.right);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Row(
        children: <Widget>[
          Expanded(child: left),
          Expanded(child: right),
        ],
      ),
    );
  }
}
