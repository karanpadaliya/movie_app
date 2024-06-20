import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/controller/FavoritesProvider.dart';
import 'package:movie_app/model/movieDetailsModel.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class MovieDetailsPage extends StatefulWidget {
  final MovieDetailsModel movieDetails;

  MovieDetailsPage({required this.movieDetails});

  @override
  State<MovieDetailsPage> createState() => _MovieDetailsPageState();
}

class _MovieDetailsPageState extends State<MovieDetailsPage> {
  late FavoritesProvider _favoritesProvider;
  bool isFavorite = false;

  @override
  void initState() {
    super.initState();
    _favoritesProvider = Provider.of<FavoritesProvider>(context, listen: false);
    checkIfFavorite();
  }

  void checkIfFavorite() {
    for (var movie in _favoritesProvider.favoriteMovies) {
      if (movie.title == widget.movieDetails.title) {
        setState(() {
          isFavorite = true;
        });
        return;
      }
    }
  }

  @override
  Widget build(BuildContext context) {

    FavoritesProvider favoritesProvider =
        Provider.of<FavoritesProvider>(context);

    bool isAlreadyAddedInFavoritesPage =
        favoritesProvider.favoriteMovies.contains(widget.movieDetails);
    if (isAlreadyAddedInFavoritesPage) {
      isFavorite = true;
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: CupertinoColors.darkBackgroundGray,
        foregroundColor: Colors.white,
        title: Text(widget.movieDetails.title ?? "Movie Details"),
        actions: [
          IconButton(
            onPressed: () {
              if (isFavorite) {
                showAlreadyAddedDialog(context, widget.movieDetails.title);
              } else {
                _showFavoriteSuccessDialog(context, widget.movieDetails.title);
                favoritesProvider.addFavorite(widget.movieDetails);
              }
            },
            icon: Icon(
              isFavorite ? Icons.favorite : Icons.favorite_border,
              color: isFavorite ? Colors.red : null,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.share),
          ),
        ],
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(16.0),
              child: Image.network(
                widget.movieDetails.poster ?? "",
                height: 300,
                width: 200,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    height: 300,
                    width: 200,
                    color: Colors.grey[200],
                    child: Center(
                      child: Text(
                        "No Image",
                        style: TextStyle(fontSize: 16, color: Colors.grey),
                      ),
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 16),
            Text(
              widget.movieDetails.title ?? "",
              style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.deepPurple),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 16),
            CardHighlight(context, 'Year', widget.movieDetails.year),
            CardHighlight(context, 'Genre', widget.movieDetails.genre),
            CardHighlight(context, 'Director', widget.movieDetails.director),
            Divider(),
            buildRow('Rated:', widget.movieDetails.rated),
            buildRow('Released:', widget.movieDetails.released),
            buildRow('Runtime:', widget.movieDetails.runtime),
            buildRow('Writer:', widget.movieDetails.writer),
            buildRow('Actors:', widget.movieDetails.actors),
            buildRow('Plot:', widget.movieDetails.plot),
            buildRow('Language:', widget.movieDetails.language),
            buildRow('Country:', widget.movieDetails.country),
            buildRow('Awards:', widget.movieDetails.awards),
            Divider(),
            Text(
              'Ratings:',
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.deepPurple),
            ),
            SizedBox(height: 8),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: widget.movieDetails.ratings!.map((rating) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4.0),
                  child: Text(
                    '${rating.source}: ${rating.value}',
                    style: TextStyle(fontSize: 16, color: Colors.black87),
                  ),
                );
              }).toList(),
            ),
            Divider(),
            buildRow('Metascore:', widget.movieDetails.metascore),
            buildRow('IMDb Rating:', widget.movieDetails.imdbRating),
            buildRow('IMDb Votes:', widget.movieDetails.imdbVotes),
            buildRow('Box Office:', widget.movieDetails.boxOffice),
            buildRow('Production:', widget.movieDetails.production),
            GestureDetector(
              onTap: () {
                if (widget.movieDetails.website != null &&
                    widget.movieDetails.website!.isNotEmpty) {
                  _launchURL(widget.movieDetails.website!);
                }
              },
              child: Text(
                'Website: ${widget.movieDetails.website}',
                style: TextStyle(
                    fontSize: 16,
                    color: Colors.blue,
                    decoration: TextDecoration.underline),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showFavoriteSuccessDialog(BuildContext context, String? movieTitle) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Center(child: Text('Favorite Added')),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                height: 300,
                width: 200,
                decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.network(
                    widget.movieDetails.poster ?? "Poster_not_found",
                    fit: BoxFit.cover,
                    scale: 10,
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Center(
                  child: Text(
                '$movieTitle ',
                style: TextStyle(
                  fontSize: 25,
                ),
              )),
              Text(
                'Added to your favorites!!',
                style: TextStyle(),
              ),
            ],
          ),
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacementNamed(context, "FavoritesPage");
              },
              child: Row(
                children: [
                  SizedBox(
                    width: 50,
                  ),
                  Icon(
                    Icons.favorite,
                    color: Colors.red,
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text('View Favorite'),
                ],
              ),
              style: ButtonStyle(
                backgroundColor: MaterialStatePropertyAll(
                    CupertinoColors.darkBackgroundGray),
                foregroundColor: MaterialStatePropertyAll(Colors.white),
                shape: MaterialStatePropertyAll(
                  ContinuousRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }

  void showAlreadyAddedDialog(BuildContext context, String? movieTitle) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Already Added'),
          content: Text('$movieTitle is already in your favorites.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }


  Widget buildRow(String label, String? value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black87),
          ),
          SizedBox(width: 8),
          Expanded(
            child: Text(
              value ?? "N/A",
              style: TextStyle(fontSize: 18, color: Colors.black54),
            ),
          ),
        ],
      ),
    );
  }

  Widget CardHighlight(BuildContext context, String title, String? value) {
    return Card(
      elevation: 4,
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      child: ListTile(
        leading: Icon(Icons.star, color: Colors.deepPurple),
        title: Text(
          title,
          style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.deepPurple),
        ),
        subtitle: Text(
          value ?? "N/A",
          style: TextStyle(fontSize: 18, color: Colors.black87),
        ),
      ),
    );
  }

  Future<void> _launchURL(String url) async {
    final Uri uri = Uri.parse(url);
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

}
