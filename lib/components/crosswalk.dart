import 'package:flutter/material.dart';

class Crosswalk extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Image.asset(
        'assets/images/crosswalk.png',
        fit: BoxFit.cover,
        height: 30,
        width: 72,
      ),
    );
  }
}
