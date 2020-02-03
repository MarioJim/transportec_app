import 'dart:async';
import 'package:flutter/material.dart';

import 'package:transportec_app/components/crosswalk.dart';
import 'package:transportec_app/components/expanded_row.dart';
import 'package:transportec_app/components/route_place.dart';
import 'package:transportec_app/services/api.dart';

const durationBetweenRefreshes = Duration(seconds: 5);

class RoutesScreen extends StatefulWidget {
  @override
  _RoutesScreenState createState() => _RoutesScreenState();
}

class _RoutesScreenState extends State<RoutesScreen>
    with WidgetsBindingObserver {
  TransportecAPI api = TransportecAPI();
  Timer _timer;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    _timer = new Timer(durationBetweenRefreshes, () async {
      await api.updateData();
      setState(() {});
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    WidgetsBinding.instance.removeObserver(this);
    api.dispose();
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    if (state == AppLifecycleState.paused) {
      _timer.cancel();
    } else if (state == AppLifecycleState.resumed) {
      _timer = new Timer(durationBetweenRefreshes, () => api.updateData());
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: <Widget>[
          ExpandedRow(
            RoutePlace(letter: api.map['1-1a']),
            RoutePlace(letter: api.map['1-1b']),
          ),
          ExpandedRow(
            RoutePlace(letter: api.map['1-2a']),
            RoutePlace(letter: api.map['1-2b']),
          ),
          Crosswalk(),
          ExpandedRow(
            RoutePlace(letter: api.map['2-1a']),
            RoutePlace(letter: api.map['2-1b']),
          ),
          ExpandedRow(
            RoutePlace(letter: api.map['2-2a']),
            RoutePlace(letter: api.map['2-2b']),
          ),
          Crosswalk(),
          ExpandedRow(
            RoutePlace(letter: api.map['3-1a']),
            RoutePlace(letter: api.map['3-1b']),
          ),
          ExpandedRow(
            RoutePlace(letter: api.map['3-2a']),
            RoutePlace(letter: api.map['3-2b']),
          ),
          ExpandedRow(
            RoutePlace(letter: api.map['3-3a']),
            RoutePlace(letter: api.map['3-3b']),
          ),
          ExpandedRow(
            RoutePlace(letter: api.map['3-4a']),
            RoutePlace(letter: api.map['3-4b']),
          ),
          Crosswalk(),
          ExpandedRow(
            RoutePlace(letter: api.map['4-1a']),
            RoutePlace(letter: api.map['4-1b']),
          ),
          ExpandedRow(
            RoutePlace(letter: api.map['4-2a']),
            RoutePlace(letter: api.map['4-2b']),
          ),
          ExpandedRow(
            RoutePlace(letter: api.map['4-3a']),
            RoutePlace(letter: api.map['4-3b']),
          ),
          ExpandedRow(
            RoutePlace(letter: api.map['4-4a']),
            RoutePlace(letter: api.map['4-4b']),
          ),
          ExpandedRow(
            RoutePlace(letter: api.map['4-5a']),
            RoutePlace(letter: api.map['4-5b']),
          ),
          ExpandedRow(
            RoutePlace(letter: api.map['4-6a']),
            RoutePlace(letter: api.map['4-6b']),
          ),
        ],
      ),
    );
  }
}
