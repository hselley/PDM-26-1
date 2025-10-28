// App0805.dart

import 'package:flutter/material.dart';
import 'App08Main.dart';

extension MoreMovieTitlePage on MovieTitlePageState {
  static bool _isFavorite = false;

  gotoDetailPage() async {
    _isFavorite = await Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => DetailPage(),
          settings: RouteSettings(arguments: _isFavorite)
      ),
    ) ?? _isFavorite;

    // Actualizar la vista
    setState(() {});
  }

  Widget buildTitlePageCore() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("¿Quieres ser Jonh Malkovich?", textScaler: TextScaler.linear(1.5),),
            Visibility(
                visible: _isFavorite ?? false,
                child: Icon(Icons.favorite, color: Colors.red, size: 25)
            ),
          ],
        ),
        SizedBox(height: 16.0,),
        ElevatedButton.icon(
          onPressed: gotoDetailPage,
          label: Text("Details"),
          icon: Icon(Icons.movie_creation_outlined),
        )
      ],
    );
  }
}

extension MoreDetailPage on DetailPage {
  Widget buildDetailPageCore(context) {
    final _argument = ModalRoute.of(context)?.settings.arguments ?? false;
    final _isFavoriteArgument = _argument as bool;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(overview),
        SizedBox(height: 16.0,),
        Image.asset('assets/Malkovich.png'),
        SizedBox(height: 16.0,),
        ElevatedButton(
          onPressed: () {
            Navigator.pop(context, !_isFavoriteArgument);
          },
          child:
            Text(_isFavoriteArgument ? 'Unfavorite this' : 'Make it favorite'),
        )
      ],
    );
  }
}