// App0804.dart

import 'package:flutter/material.dart';
import 'App08Main.dart';

extension MoreMovieTitlePage on MovieTitlePageState {
  static bool? _isFavorite;

  gotoDetailPage() async {
    _isFavorite = await Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => DetailPage())
    ) ?? _isFavorite;
    // Actualización de la vista
    setState(() {});
  }

  Widget buildTitlePageCore() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("¿Quieres ser John Malkovich?", textScaler: TextScaler.linear(1.5),),
            Visibility(
              visible: _isFavorite ?? false,
              child: Icon(Icons.favorite, color: Colors.red, size: 50,),
            ),
          ],
        ),
        SizedBox(height: 16.0,),
        ElevatedButton.icon(
            onPressed: gotoDetailPage,
            label: Text("Details"),
            icon: Icon(Icons.arrow_forward),
        )
      ],
    );
  }
}

extension MoreDetailPage on DetailPage {
  Widget buildDetailPageCore(context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(overview),
        SizedBox(height: 16.0,),
        Image.asset('assets/Malkovich.png'),
        SizedBox(height: 16.0,),
        ElevatedButton(
            onPressed: () {
              Navigator.pop(context, true);
            },
            child: Text("Make it favorite!"),
        )
      ],
    );
  }
}