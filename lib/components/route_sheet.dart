import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../services/api.dart';

class RouteSheet extends StatelessWidget {
  final String place;

  RouteSheet(this.place);

  @override
  Widget build(BuildContext context) {
    final busRoute = Provider.of<TransportecAPI>(context).getRoute(place);
    return Card(
      elevation: 20,
      child: Column(
        children: [
          Text(busRoute.name),
          Text(busRoute.letter),
          Text(busRoute.hour),
        ],
      ),
    );
  }
}
