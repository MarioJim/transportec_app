import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

import '../components/error_dialog.dart';
import '../components/route_sheet.dart';
import '../components/routes_map.dart';
import '../models/bus_route.dart';
import '../services/api.dart';

class RoutesScreen extends StatefulWidget {
  @override
  _RoutesScreenState createState() => _RoutesScreenState();
}

class _RoutesScreenState extends State<RoutesScreen> {
  bool _alertIsOpen = false;

  void showModal(BuildContext ctx, BusRoute busRoute) {
    showModalBottomSheet(
      context: ctx,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24),
      ),
      builder: (_) => RouteSheet(busRoute),
    );
  }

  void showAlert(BuildContext ctx, String error) {
    if (_alertIsOpen) return;
    _alertIsOpen = true;
    showDialog(
      context: context,
      builder: (_) => ErrorDialog(error),
    ).then((_) => _alertIsOpen = false);
  }

  @override
  Widget build(BuildContext context) {
    final error = Provider.of<TransportecAPI>(context).error;
    if (error != null)
      Future.delayed(Duration.zero, () => showAlert(context, error));
    return Scaffold(
      appBar: AppBar(title: Text('Rutas de Transportec')),
      body: SingleChildScrollView(
        child: Column(children: [
          SizedBox(height: 4),
          RoutesMap(showModal),
          SizedBox(height: 12),
          Consumer<TransportecAPI>(
            builder: (_, api, __) => Text(
              'Última conexión ${api.lastConnection}',
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
          ),
        ]),
      ),
      floatingActionButton: FloatingActionButton.extended(
        icon: Icon(Icons.map, size: 30),
        label: Text('Mapa de rutas'),
        onPressed: () async {
          const url =
              'https://www.google.com/maps/d/u/0/embed?mid=10aCLErgwkxB0buEy3-1322U6EyVaToHg';
          if (await canLaunch(url)) await launch(url);
        },
      ),
    );
  }
}
