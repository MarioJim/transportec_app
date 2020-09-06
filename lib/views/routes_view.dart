import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:assorted_layout_widgets/assorted_layout_widgets.dart';

import '../components/crosswalk.dart';
import '../components/route_place.dart';
import '../components/trees.dart';
import '../services/api.dart';

class RoutesView extends StatelessWidget {
  List<Widget> buildSection(TransportecAPI api, int num, int length) =>
      new List.generate(length, (i) => i)
          .map((i) => Row(children: <Widget>[
                RoutePlace(api.getPlace('$num-${i + 1}a')),
                RoutePlace(api.getPlace('$num-${i + 1}b')),
              ]))
          .toList();

  @override
  Widget build(BuildContext context) {
    final api = Provider.of<TransportecAPI>(context);
    return SingleChildScrollView(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(children: [
            ...buildSection(api, 1, 1),
            SizedBox(height: 170),
            ...new List.generate(6, (_) => Trees()).toList(),
          ]),
          ColumnSuper(
            innerDistance: -10.0,
            children: <Widget>[
              ...buildSection(api, 1, 2),
              Crosswalk(),
              ...buildSection(api, 2, 2),
              Crosswalk(),
              ...buildSection(api, 3, 4),
              Crosswalk(),
              ...buildSection(api, 4, 6),
            ],
          ),
          Column(
            children: [
              Row(children: <Widget>[
                RoutePlace(api.getPlace('$num-${2 + 1}a')),
                RoutePlace(api.getPlace('$num-${2 + 1}a')),
                RoutePlace(api.getPlace('$num-${2 + 1}a')),
                RoutePlace(api.getPlace('$num-${2 + 1}a')),
                RoutePlace(api.getPlace('$num-${2 + 1}a')),
                RoutePlace(api.getPlace('$num-${2 + 1}a')),
              ]),
              SizedBox(height: 240),
              Image.asset('assets/images/cafeteria.png', height: 180),
            ],
          ),
        ],
      ),
    );
  }
}
