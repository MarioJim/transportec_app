class BusRoute {
  final String letter;
  final String name;
  final String hour;

  BusRoute(this.letter, this.name, this.hour);

  factory BusRoute.fromJSON(dynamic json) {
    return BusRoute(
      json['letra'],
      json['nombre'],
      json['hora'].toString().substring(0, 5),
    );
  }
}
