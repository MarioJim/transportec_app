import 'dart:async';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:assorted_layout_widgets/assorted_layout_widgets.dart';

import 'package:transportec_app/components/crosswalk.dart';
import 'package:transportec_app/components/route_place.dart';
import 'package:transportec_app/services/api.dart';

const durationBetweenRefreshes = Duration(seconds: 3);

class RoutesScreen extends StatefulWidget {
  @override
  _RoutesScreenState createState() => _RoutesScreenState();
}

class _RoutesScreenState extends State<RoutesScreen>
    with WidgetsBindingObserver {
  Timer _timer;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    _timer = new Timer.periodic(durationBetweenRefreshes, (timer) async {
      await Provider.of<TransportecAPI>(context, listen: false).updateData();
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    if (state == AppLifecycleState.paused) {
      _timer.cancel();
    } else if (state == AppLifecycleState.resumed) {
      _timer = new Timer.periodic(durationBetweenRefreshes, (timer) async {
        await Provider.of<TransportecAPI>(context, listen: false).updateData();
      });
    }
  }

  List<Widget> buildSection({int number, int length}) {
    List<Widget> children = [];
    for (var i = 0; i < length; i++) {
      children.add(Row(
        children: <Widget>[
          Consumer<TransportecAPI>(
            builder: (context, api, child) =>
                RoutePlace(letter: api.map['$number-${i + 1}a']),
          ),
          Consumer<TransportecAPI>(
            builder: (context, api, child) =>
                RoutePlace(letter: api.map['$number-${i + 1}b']),
          ),
        ],
      ));
    }
    return children;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ColumnSuper(
        innerDistance: -12.0,
        children: <Widget>[
          ...buildSection(number: 1, length: 2),
          Crosswalk(),
          ...buildSection(number: 2, length: 2),
          Crosswalk(),
          ...buildSection(number: 3, length: 4),
          Crosswalk(),
          ...buildSection(number: 4, length: 6),
        ],
      ),
    );
  }
}
