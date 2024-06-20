import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/controller/FavoritesProvider.dart';
import 'package:movie_app/model/movieDetailsModel.dart';
import 'package:movie_app/view/MovieDetailsPage.dart';
import 'package:provider/provider.dart';

class FavoritesPage extends StatefulWidget {
  @override
  State<FavoritesPage> createState() => _FavoritesPageState();
}

class _FavoritesPageState extends State<FavoritesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: CupertinoColors.darkBackgroundGray,
        foregroundColor: Colors.white,
        title: Text('Favorites'),
      ),
      body: Consumer<FavoritesProvider>(
        builder: (context, value, Widget? child) {
          List<MovieDetailsModel> favorites = value.favoriteMovies;

          return ListView.builder(
            itemCount: favorites.length,
            itemBuilder: (context, index) {
              MovieDetailsModel movie = favorites[index];
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: ListTile(
                    leading: Container(
                      height: double.infinity,
                      width: 50,
                      decoration: BoxDecoration(
                        color: Colors.grey.withOpacity(0.3),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.network(
                          movie.poster ?? "",
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    title: Text(
                      movie.title ?? "",
                      softWrap: false,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 17,
                        wordSpacing: 1,
                        letterSpacing: 1.5,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Actors: ${movie.actors ?? ""}",
                          softWrap: false,
                          overflow: TextOverflow.ellipsis,
                        ),
                        Text(
                          "Released: ${movie.released ?? ""}",
                          softWrap: false,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                    trailing: IconButton(
                      icon: Icon(Icons.delete),
                      onPressed: () {
                        value.removeFavorite(movie);
                        setState(() {

                        });
                      },
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => MovieDetailsPage(movieDetails: movie),
                        ),
                      );
                    },
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
