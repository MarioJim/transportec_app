import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/bus_route.dart';
import '../services/favorites.dart';

class RouteSheet extends StatelessWidget {
  final BusRoute busRoute;

  RouteSheet(this.busRoute);

  @override
  Widget build(BuildContext context) {
    final favorites = Provider.of<Favorites>(context);
    final isFav = favorites.isFavorite(busRoute.letter);
    return Container(
      height: 320,
      padding: const EdgeInsets.symmetric(vertical: 36, horizontal: 20),
      child: Column(children: [
        ListTile(
          title: Text(
            busRoute.name,
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
          ),
          leading: CircleAvatar(
            backgroundColor: Theme.of(context).primaryColor,
            radius: 30,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: FittedBox(
                fit: BoxFit.fitWidth,
                child: Text(
                  busRoute.letter,
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
          subtitle: Text(
            'Salida a las ${busRoute.hour}',
            style: TextStyle(fontSize: 20),
          ),
        ),
        SizedBox(height: 20),
        FlatButton.icon(
          onPressed: () => favorites.toggleFavorite(busRoute.letter),
          icon: Icon(
            isFav ? Icons.delete : Icons.favorite,
            color: isFav ? Colors.red : Colors.grey,
            size: 36,
          ),
          label: Text(
            '${isFav ? 'Eliminar de' : 'Añadir a'} favoritos',
            style: TextStyle(
              fontSize: 18,
              color: isFav ? Colors.red : Colors.grey,
            ),
          ),
        ),
      ]),
    );
  }
}
