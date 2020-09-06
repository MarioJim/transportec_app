import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:transportec_app/routes.dart';
import 'package:transportec_app/services/api.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (ctx) => TransportecAPI(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Transportec App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(title: Text('Rutas')),
        body: RoutesScreen(),
      ),
    );
  }
}
