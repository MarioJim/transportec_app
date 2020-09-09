import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'screens/routes_screen.dart';
import 'services/api.dart';
import 'services/favorites.dart';

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
          primarySwatch: Colors.teal,
          accentColor: Color.fromRGBO(43, 194, 194, 1),
        ),
        home: RoutesScreen(),
      ),
    );
  }
}
