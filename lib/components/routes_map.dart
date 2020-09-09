import 'package:flutter/material.dart';

import '../components/cafeteria.dart';
import '../components/crosswalk.dart';
import '../components/route_place.dart';
import '../components/trees.dart';
import '../models/bus_route.dart';

class RoutesMap extends StatelessWidget {
  final void Function(BuildContext, BusRoute) showModal;

  RoutesMap(this.showModal);

  List<Widget> buildSection(int number, int length) {
    return List.generate(
      length,
      (i) => Row(children: <Widget>[
        RoutePlace('$number-${i + 1}a', showModal),
        RoutePlace('$number-${i + 1}b', showModal),
      ]),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(children: [
          Row(children: [
            RoutePlace('1-1-c', showModal),
            RoutePlace('1-1-b', showModal),
          ]),
          SizedBox(height: 170),
          ...List.generate(6, (_) => Trees()).toList(),
        ]),
        Column(
          children: <Widget>[
            ...buildSection(1, 2),
            Crosswalk(),
            ...buildSection(2, 2),
            Crosswalk(),
            ...buildSection(3, 4),
            Crosswalk(),
            ...buildSection(4, 6),
          ],
        ),
        Column(
          children: [
            Row(children: <Widget>[
              RoutePlace('1-1c', showModal),
              RoutePlace('1-1d', showModal),
              RoutePlace('1-1e', showModal),
              RoutePlace('1-1f', showModal),
              RoutePlace('1-1g', showModal),
              RoutePlace('1-1h', showModal),
            ]),
            SizedBox(height: 100),
            Cafeteria(),
          ],
        ),
      ],
    );
  }
}
