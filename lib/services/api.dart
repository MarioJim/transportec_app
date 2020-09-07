import 'dart:async';
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;

import '../models/bus_route.dart';

const tiemBetweenRefreshes = Duration(seconds: 5000);
const url = 'https://tvr.com.mx/transportec/getListadoRutasPantalla';

class TransportecAPI with ChangeNotifier, WidgetsBindingObserver {
  Timer _timer;
  Map<String, BusRoute> _map;

  TransportecAPI() {
    _map = Map();
    if (kDebugMode) {
      updateDataDev();
    }
    WidgetsBinding.instance.addObserver(this);
    _timer = new Timer.periodic(tiemBetweenRefreshes, (_) async {
      await (kDebugMode ? updateDataDev() : updateData());
    });
  }

  Future<void> updateData() async {
    http.Response response = await http.post(url);
    if (response.statusCode != 200) {
      // TODO: Handle error
      return;
    }
    dynamic data = jsonDecode(response.body);
    _map.clear();
    for (dynamic ruta in data['rutas']) {
      _map[ruta['ubicacion']] = ruta['letra'];
    }
    notifyListeners();
  }

  Future<void> updateDataDev() async {
    http.Response response = await http.get('http://192.168.1.71:8080');
    if (response.statusCode != 200) {
      print('Error: servidor no respondió');
      return;
    }
    dynamic data = jsonDecode(response.body);
    _map.clear();
    for (dynamic ruta in data['rutas']) {
      _map[ruta['ubicacion']] = BusRoute.fromJSON(ruta);
    }
    print(_map);
    notifyListeners();
  }

  BusRoute getRoute(String place) {
    return _map[place];
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    if (state == AppLifecycleState.paused) {
      _timer.cancel();
    } else if (state == AppLifecycleState.resumed) {
      _timer = new Timer.periodic(tiemBetweenRefreshes, (_) async {
        await (kDebugMode ? updateDataDev() : updateData());
      });
    }
  }

  @override
  void dispose() {
    _timer.cancel();
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }
}
