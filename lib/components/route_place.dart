import 'package:flutter/material.dart';

class RoutePlace extends StatelessWidget {
  final String letter;

  RoutePlace(this.letter);

  @override
  Widget build(BuildContext context) {
    final color1 = letter == null ? Colors.grey : Colors.green;
    final color2 = Theme.of(context).primaryColor;
    final size = MediaQuery.of(context).size.width / 10;
    return Container(
      child: Text(
        letter ?? '',
        style: TextStyle(fontSize: 20.0),
      ),
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: <Color>[color1, color2]),
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(30.0),
      ),
      alignment: Alignment.center,
      constraints: BoxConstraints(
        minHeight: 50.0,
        maxWidth: size,
      ),
    );
  }
}
