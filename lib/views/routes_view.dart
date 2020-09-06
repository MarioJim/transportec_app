import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:assorted_layout_widgets/assorted_layout_widgets.dart';

import '../components/crosswalk.dart';
import '../components/route_place.dart';
import '../services/api.dart';

class RoutesView extends StatelessWidget {
  List<Widget> buildSection({int num, int length}) {
    return new List.generate(length, (i) => i)
        .map((i) => Row(children: <Widget>[
              Consumer<TransportecAPI>(
                builder: (_, api, __) =>
                    RoutePlace(api.getPlace('$num-${i + 1}a')),
              ),
              Consumer<TransportecAPI>(
                builder: (_, api, __) =>
                    RoutePlace(api.getPlace('$num-${i + 1}b')),
              ),
            ]))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ColumnSuper(
            innerDistance: -10.0,
            children: [
              ...buildSection(num: 1, length: 1),
              SizedBox(height: 180),
              ...new List.generate(11, (i) => i)
                  .map((i) => i % 2 == 0
                      ? Image.asset('assets/images/trees.png', height: 64)
                      : SizedBox(height: 30))
                  .toList(),
            ],
          ),
          ColumnSuper(
            innerDistance: -10.0,
            children: <Widget>[
              ...buildSection(num: 1, length: 2),
              Crosswalk(),
              ...buildSection(num: 2, length: 2),
              Crosswalk(),
              ...buildSection(num: 3, length: 4),
              Crosswalk(),
              ...buildSection(num: 4, length: 6),
            ],
          ),
          ColumnSuper(
            innerDistance: -10.0,
            children: [
              Row(
                children: <Widget>[
                  Consumer<TransportecAPI>(
                    builder: (_, api, __) =>
                        RoutePlace(api.getPlace('$num-${2 + 1}a')),
                  ),
                  Consumer<TransportecAPI>(
                    builder: (_, api, __) =>
                        RoutePlace(api.getPlace('$num-${2 + 1}b')),
                  ),
                  Consumer<TransportecAPI>(
                    builder: (_, api, __) =>
                        RoutePlace(api.getPlace('$num-${2 + 1}a')),
                  ),
                  Consumer<TransportecAPI>(
                    builder: (_, api, __) =>
                        RoutePlace(api.getPlace('$num-${2 + 1}b')),
                  ),
                  Consumer<TransportecAPI>(
                    builder: (_, api, __) =>
                        RoutePlace(api.getPlace('$num-${2 + 1}a')),
                  ),
                  Consumer<TransportecAPI>(
                    builder: (_, api, __) =>
                        RoutePlace(api.getPlace('$num-${2 + 1}b')),
                  ),
                ],
              ),
              SizedBox(height: 220),
              Image.asset('assets/images/cafeteria.png', height: 180),
            ],
          ),
        ],
      ),
    );
  }
}
