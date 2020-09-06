import 'package:flutter/material.dart';

class Trees extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Image.asset('assets/images/trees.png', height: 64),
    );
  }
}
