// Figure0809Extensions.dart
part of 'Figure0809Main.dart';

class DetailPage extends StatefulWidget {
  final bool? initialFavorite;
  DetailPage({Key? key, this.initialFavorite}) : super(key: key);

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  bool? isFavorite;

  @override
  void initState() {
    super.initState();
    isFavorite = widget.initialFavorite ?? false;
  }

  @override
  Widget build(BuildContext context) {
    final String overview = 'This is a short overview of the example movie'
          'Tap the button to toggle and return to the previous page';

    return Scaffold(
      appBar: AppBar(title: Text('Details'),),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(overview, style: Theme.of(context).textTheme.bodyMedium,),
            SizedBox(height: 16.0,),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  isFavorite = !(isFavorite ?? false);
                });
                Navigator.pop(context, isFavorite);
              },
                child: Text(isFavorite == true ? 'Unfavorite this' : 'Make it as Favorite')
            )
          ],
        ),
      ),
    );
  }
}

extension MoreMovieTitlePage on MovieTitlePageState {
  Future<void> goToDetailPage() async {
    final result = await Navigator.push<bool?>(
      context,
      MaterialPageRoute(builder: (context) => DetailPage(initialFavorite: isFavorite,)),
    );

    if(!mounted) return;
    setState(() {
      // Se actualiza solamente si se devuelve en la navegación un valor no nulo
      if(result != null) {
        isFavorite = result;
      }
    });
  }
}