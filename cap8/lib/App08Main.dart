// App08Main.dart
// Aplicación de reseña de películas

import 'package:flutter/material.dart';
import 'App0807.dart';

void main() => runApp(App08Main());

class App08Main extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MovieTitlePage(),
    );
  }
}

class MovieTitlePage extends StatefulWidget {
  @override
  MovieTitlePageState createState() => MovieTitlePageState();
}

class MovieTitlePageState extends State<MovieTitlePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Movie Title")),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Center(
          child: buildTitlePageCore(),
        ),
      ),
    );
  }
}

class DetailPage extends StatelessWidget {
  final overview = 'Craig Schwartz, un marionetista callejero con un gran talento,'
                    'consigue encontrar trabajo en la planta 7 1/2 del edificio '
                    'Mertin-Flemmer de Manhattan, donde encuentra una pequeña puerta'
                    'que le permite el acceso a un pasillo secreto que le aspira y '
                    'que le permite acceder al cerebro de John Malkovich.';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Details"),),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Center(child: buildDetailPageCore(context),),
      ),
    );
  }
}