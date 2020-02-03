import 'dart:convert';
import 'package:http/http.dart' as http;

const url = 'https://tvr.com.mx/transportec/getListadoRutasPantalla';

class TransportecAPI {
  Map<String, String> map;
  http.Client _client;

  TransportecAPI() {
    map = Map();
    _client = http.Client();
  }

  // TODO: re-enable the API
  Future<void> updateDataProduction() async {
    http.Response response = await _client.post(url);
    if (response.statusCode != 200) {
      // TODO: handle error
      return;
    }
    dynamic data = jsonDecode(response.body);
    for (dynamic ruta in data['rutas']) {
      map[ruta['ubicacion']] = ruta['letra'];
    }
  }

  Future<void> updateData() async {
    dynamic data = jsonDecode(
        '{"codigo":200,"rutas":[{"id":1,"ubicacion":"1-2a","idRuta":24,"nombre":"EJE 3 CAFETALES HASTA CAMPESINOS ","letra":"H","hora":"15:45:00","horaAbordo":null,"horaSalida":null,"status":0,"numPasajeros":0,"unidad":"","otroCamion":0,"dia":"2020-01-29"},{"id":2,"ubicacion":"1-2b","idRuta":28,"nombre":"TEXCOCO ","letra":"TEX","hora":"15:45:00","horaAbordo":null,"horaSalida":null,"status":0,"numPasajeros":0,"unidad":"","otroCamion":0,"dia":"2020-01-29"},{"id":3,"ubicacion":"2-1a","idRuta":26,"nombre":"MIGUEL ÁNGEL DE QUEVEDO - UNIVERSIDAD HASTA RÍO CHURUBUSCO ","letra":"P","hora":"15:45:00","horaAbordo":null,"horaSalida":null,"status":0,"numPasajeros":0,"unidad":"","otroCamion":0,"dia":"2020-01-29"},{"id":4,"ubicacion":"2-1b","idRuta":21,"nombre":"ESCUELA NAVAL MILITAR - PASEOS DE TAXQUEÑA","letra":"E","hora":"15:45:00","horaAbordo":null,"horaSalida":null,"status":0,"numPasajeros":0,"unidad":"","otroCamion":0,"dia":"2020-01-29"},{"id":5,"ubicacion":"3-1a","idRuta":22,"nombre":"MIRAMONTES HASTA AVENIDA TAXQUEÑA","letra":"F","hora":"15:45:00","horaAbordo":null,"horaSalida":null,"status":0,"numPasajeros":0,"unidad":"","otroCamion":0,"dia":"2020-01-29"},{"id":6,"ubicacion":"3-1b","idRuta":19,"nombre":"PERISUR PICACHO HASTA PLAZA SANTA TERESA","letra":"C","hora":"15:45:00","horaAbordo":null,"horaSalida":null,"status":0,"numPasajeros":0,"unidad":"","otroCamion":0,"dia":"2020-01-29"},{"id":7,"ubicacion":"3-2a","idRuta":25,"nombre":"DIRECTO EJE 3 Y CALLE 2 -HASTA  DELEGACIÓN VENUSTIANO CARRANZA ","letra":"I","hora":"15:45:00","horaAbordo":null,"horaSalida":null,"status":0,"numPasajeros":0,"unidad":"","otroCamion":0,"dia":"2020-01-29"},{"id":8,"ubicacion":"3-2b","idRuta":23,"nombre":"CAMPESTRE - VÍA LÁCTEA ","letra":"G","hora":"15:45:00","horaAbordo":null,"horaSalida":null,"status":0,"numPasajeros":0,"unidad":"","otroCamion":0,"dia":"2020-01-29"},{"id":9,"ubicacion":"3-3b","idRuta":20,"nombre":"DIRECTO LUIS CABRERA HASTA SAN JERONIMO","letra":"D","hora":"15:45:00","horaAbordo":null,"horaSalida":null,"status":0,"numPasajeros":0,"unidad":"","otroCamion":0,"dia":"2020-01-29"},{"id":10,"ubicacion":"3-4b","idRuta":27,"nombre":"DIRECTO GABRIEL MANCERA - OBRERO MUNDIAL ","letra":"R","hora":"15:45:00","horaAbordo":null,"horaSalida":null,"status":0,"numPasajeros":0,"unidad":"","otroCamion":0,"dia":"2020-01-29"}],"salida":"izquierda"}');
    for (dynamic ruta in data['rutas']) {
      map[ruta['ubicacion']] = ruta['letra'];
    }
  }

  void dispose() {
    _client.close();
  }
}
