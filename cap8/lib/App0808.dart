// App0808.dart

import 'package:flutter/material.dart';
import 'App08Main.dart';

const Map<String, String> synopses = {
  'Una casa de dinamita':
    'Centrado en los miembros del personal de la Casa Blanca que se enfrentan a un inminente ataque con misiles contra Estados Unidos, este apasionante drama se desarrolla en tiempo real a medida que aumentan las tensiones.',
  'La Hora De La Desaparicion':
      'Varias historias interrelacionadas sobre la desaparición de estudiantes de pre-escolar en una pequeña ciudad.',
  'Una batalla tras otra':
    'Cuando su enemigo malvado reaparece después de 16 años, un grupo de exrevolucionarios se reúne para rescatar a la hija de uno de ellos.',
};

extension MoreMovieTitlePage on MovieTitlePageState {
  goToDetailPage(String movieName) {
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => DetailPage(),
          settings: RouteSettings(arguments: movieName)
      )
    );
  }

  Widget buildTitlePageCore() {
    return ListView(
      children: [
        ListTile(
          title: Text('Una casa de dinamita'),
          onTap: () => goToDetailPage('Una casa de dinamita'),
        ),
        ListTile(
          title: Text('La Hora De La Desaparicion'),
          onTap: () => goToDetailPage('La Hora De La Desaparicion'),
        ),
        ListTile(
          title: Text('Una batalla tras otra'),
          onTap: () => goToDetailPage('Una batalla tras otra'),
        ),
      ],
    );
  }
}

extension MoreDetailPage on DetailPage {
  Widget buildDetailPageCore(context) {
    final movieName = ModalRoute.of(context)?.settings.arguments;
    final overview = '(From imdb) ${synopses[movieName]}';
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(overview),
      ],
    );
  }
}