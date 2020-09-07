import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'services/api.dart';
import 'services/favorites.dart';
import 'views/routes_view.dart';

void main() => runApp(TransportecApp());

class TransportecApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (ctx) => TransportecAPI()),
        ChangeNotifierProvider(create: (ctx) => Favorites()),
      ],
      child: MaterialApp(
        title: 'Transportec App',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Scaffold(
          appBar: AppBar(title: Text('Rutas')),
          body: RoutesView(),
        ),
      ),
    );
  }
}
