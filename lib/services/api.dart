import 'dart:async';
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'package:timeago/timeago.dart' as timeago;

import '../models/bus_route.dart';

class TransportecAPI with ChangeNotifier, WidgetsBindingObserver {
  Map<String, BusRoute> _map;
  Timer _timer;
  String _error;
  DateTime _lastConnection;

  TransportecAPI() {
    _map = Map();
    WidgetsBinding.instance.addObserver(this);
    _initalizeTimer();
    _lastConnection = DateTime.now();
    _updateData();
  }

  BusRoute getRouteByPlace(String place) => _map[place];

  BusRoute getRouteByLetter(String letter) {
    return _map.values.firstWhere(
      (r) => r.letter == letter,
      orElse: () => null,
    );
  }

  String get error => _error;

  String get lastConnection => timeago.format(_lastConnection, locale: 'es');

  void _initalizeTimer() {
    _timer = new Timer.periodic(
      Duration(seconds: 5),
      (_) async => await _updateData(),
    );
  }

  Future<void> _updateData() async {
    try {
      http.Response response = await http.post(_getUrl());
      if (response.statusCode != 200) throw Exception();
      dynamic data = jsonDecode(response.body);
      _map.clear();
      for (dynamic ruta in data['rutas']) {
        _map[ruta['ubicacion']] = BusRoute.fromJSON(ruta);
      }
      _lastConnection = DateTime.now();
      _error = null;
    } catch (e) {
      _error = 'No se ha podido establecer una conexión con el servidor';
    }
    notifyListeners();
  }

  String _getUrl() => kDebugMode
      ? 'http://192.168.1.71:8080'
      : 'https://tvr.com.mx/transportec/getListadoRutasPantalla';

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    if (state == AppLifecycleState.paused) {
      _timer.cancel();
    } else if (state == AppLifecycleState.resumed) {
      _initalizeTimer();
    }
  }

  @override
  void dispose() {
    _timer.cancel();
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }
}
