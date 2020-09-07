import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/bus_route.dart';
import '../services/api.dart';

class RoutePlace extends StatelessWidget {
  final String place;
  final void Function(BuildContext, BusRoute) onTap;

  RoutePlace(this.place, this.onTap);

  @override
  Widget build(BuildContext context) {
    final route = Provider.of<TransportecAPI>(context).getRouteByPlace(place);
    final letter = route == null ? '' : route.letter;
    final width = MediaQuery.of(context).size.width / 10;
    return GestureDetector(
      onTap: () => route != null ? onTap(context, route) : {},
      child: Container(
        child: Text(
          letter ?? '',
          style: TextStyle(fontSize: 20.0),
        ),
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: <Color>[
            letter.length == 0 ? Colors.grey : Colors.green,
            Theme.of(context).primaryColor,
          ]),
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(30.0),
        ),
        alignment: Alignment.center,
        constraints: BoxConstraints(
          minHeight: 50.0,
          maxWidth: width,
        ),
      ),
    );
  }
}
