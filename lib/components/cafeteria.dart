import 'package:flutter/material.dart';

class Cafeteria extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final width = (MediaQuery.of(context).size.width - 40) / 2;
    return Container(
      width: width,
      height: width * 1.8,
      child: Padding(
        padding: EdgeInsets.all(width / 8),
        child: Image.asset('assets/images/cafeteria.png'),
      ),
      decoration: BoxDecoration(
        color: const Color.fromRGBO(192, 127, 61, 1),
        borderRadius: BorderRadius.circular(20),
      ),
    );
  }
}
