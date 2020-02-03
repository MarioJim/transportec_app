import 'package:flutter/material.dart';

class RoutePlace extends StatelessWidget {
  final String letter;

  RoutePlace({this.letter});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        letter ?? '',
      ),
      decoration: BoxDecoration(
        color: letter != null ? Colors.blue : Colors.grey,
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(20.0),
      ),
      alignment: Alignment.center,
    );
  }
}
