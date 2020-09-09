import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/bus_route.dart';
import '../services/api.dart';

class RoutePlace extends StatefulWidget {
  final String place;
  final void Function(BuildContext, BusRoute) onTap;

  RoutePlace(this.place, this.onTap);

  @override
  _RoutePlaceState createState() => _RoutePlaceState();
}

class _RoutePlaceState extends State<RoutePlace> {
  BusRoute _route;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _route = Provider.of<TransportecAPI>(context).getRouteByPlace(widget.place);
  }

  @override
  Widget build(BuildContext context) {
    final letter = _route == null ? '' : _route.letter;
    final size = (MediaQuery.of(context).size.width - 40) / 10;
    return GestureDetector(
      onTap: () => _route != null ? widget.onTap(context, _route) : {},
      child: AnimatedSwitcher(
        duration: Duration(milliseconds: 300),
        transitionBuilder: (child, animation) =>
            FadeTransition(child: child, opacity: animation),
        child: Container(
          margin: const EdgeInsets.all(2),
          key: ValueKey<String>(letter),
          child: Text(
            letter,
            softWrap: false,
            style: TextStyle(
              fontSize: letter.length > 1 ? 18.0 : 22.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          alignment: Alignment.center,
          width: size,
          height: size,
          decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            color: letter.length == 0
                ? Colors.black12
                : Theme.of(context).accentColor,
            border: Border.all(
              color: Theme.of(context).accentColor,
              width: 4,
            ),
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
    );
  }
}
