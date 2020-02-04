import 'package:flutter/material.dart';

class RoutePlace extends StatelessWidget {
  final String letter;

  RoutePlace({@required this.letter});

  @override
  Widget build(BuildContext context) {
    Color secondColor = letter == null ? Colors.grey : Colors.green;
    return Container(
      child: Text(
        letter ?? '',
        style: TextStyle(
          fontSize: 22.0,
        ),
      ),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: <Color>[
            secondColor,
            Colors.blue[400],
          ],
        ),
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(30.0),
      ),
      alignment: Alignment.center,
      constraints: BoxConstraints(
        minHeight: 52.0,
        maxWidth: 72.0,
      ),
    );
  }
}
