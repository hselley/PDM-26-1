// Figure0809Main.dart

import 'package:flutter/material.dart';
part 'Figure0809Extensions.dart';

void main() => runApp(App08Main());

class App08Main extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Movie Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: MovieTitlePage(),
    );
  }
}

class MovieTitlePage extends StatefulWidget {
  @override
  MovieTitlePageState createState() => MovieTitlePageState();
}

class MovieTitlePageState extends State<MovieTitlePage> {
  bool? isFavorite;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Movie Title'),),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Poster placeholder
            Container(
              height: 200,
              color: Colors.grey[300],
              child: Center(child: Icon(Icons.local_movies_sharp),),
            ),

            SizedBox(height: 16,),
            Text('The example movie', style: Theme.of(context).textTheme.titleLarge),
            SizedBox(height: 8,),
            Text(isFavorite == true ? 'Favorited' : 'Not Favorited'),
            SizedBox(height: 16.0,),
            ElevatedButton(
              onPressed: () => goToDetailPage(),
              child: Text('Show details'),
            )
          ],
        ),
      ),
    );
  }
}