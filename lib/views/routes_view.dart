import 'package:flutter/material.dart';
import 'package:assorted_layout_widgets/assorted_layout_widgets.dart';

import '../components/crosswalk.dart';
import '../components/route_place.dart';
import '../components/route_sheet.dart';
import '../components/trees.dart';

class RoutesView extends StatelessWidget {
  List<Widget> buildSection(int number, int length) {
    return List.generate(
      length,
      (i) => Row(children: <Widget>[
        RoutePlace('$number-${i + 1}a', showModal),
        RoutePlace('$number-${i + 1}b', showModal),
      ]),
    );
  }

  void showModal(BuildContext ctx, String place) {
    if (place == null) return;
    print(place);
    showModalBottomSheet(context: ctx, builder: (_) => RouteSheet(place));
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(children: [
            Row(children: [
              RoutePlace('???', showModal),
              RoutePlace('???', showModal),
            ]),
            SizedBox(height: 170),
            ...List.generate(6, (_) => Trees()).toList(),
          ]),
          ColumnSuper(
            innerDistance: -10.0,
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
                RoutePlace('???', showModal),
                RoutePlace('???', showModal),
                RoutePlace('???', showModal),
                RoutePlace('???', showModal),
                RoutePlace('???', showModal),
                RoutePlace('???', showModal),
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
