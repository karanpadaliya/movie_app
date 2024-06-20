import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/controller/FavoritesProvider.dart';
import 'package:movie_app/model/movieDetailsModel.dart';
import 'package:movie_app/view/MovieDetailsPage.dart';
import 'package:provider/provider.dart';

class Home_FavoritePage extends StatefulWidget {
  const Home_FavoritePage({super.key});

  @override
  State<Home_FavoritePage> createState() => _Home_FavoritePageState();
}

class _Home_FavoritePageState extends State<Home_FavoritePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.all(20),
            height: 130,
            width: double.infinity,
            decoration: BoxDecoration(
              color: CupertinoColors.darkBackgroundGray,
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(25),
                  bottomRight: Radius.circular(25)),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: RichText(
                text: TextSpan(
                  text: '',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                  ),
                  children: <TextSpan>[
                    TextSpan(
                      text: 'Find ',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                      ),
                    ),
                    TextSpan(
                      text: 'Favourite ',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: CupertinoColors.link,
                        fontSize: 26,
                      ),
                    ),
                    TextSpan(
                      text: 'Movie\n',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                      ),
                    ),
                    TextSpan(
                      text: 'In ',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                      ),
                    ),
                    TextSpan(
                      text: 'One ',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: CupertinoColors.link,
                        fontSize: 26,
                      ),
                    ),
                    TextSpan(
                      text: 'App ',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            child: Consumer<FavoritesProvider>(
              builder: (BuildContext context, favoritesProvider, Widget? child) {
                List<MovieDetailsModel> favorites =
                    favoritesProvider.favoriteMovies;

                if (favorites.isEmpty) {
                  return Center(
                    child: Image.asset("assets/images/notFound.gif"),
                  );
                }

                return CarouselSlider.builder(
                  options: CarouselOptions(
                    height: 270,
                    enlargeCenterPage: true,
                    aspectRatio: 10,
                    viewportFraction: 0.5,
                    enableInfiniteScroll: true,
                  ),
                  itemCount: favorites.length,
                  itemBuilder: (context, index, realIndex) {
                    MovieDetailsModel movie = favorites[index];
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => MovieDetailsPage(movieDetails: movie),
                          ),
                        );
                      },
                      child: Container(
                        margin: const EdgeInsets.all(5.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.2),
                              blurRadius: 5,
                              offset: Offset(0, 3),
                            ),
                          ],
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                          child: Image.network(
                            movie.poster ?? '',
                            fit: BoxFit.cover,
                            width: 1000.0,
                          ),
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: InkWell(
              onTap: () {
                Navigator.pushNamed(context, "FavoritesPage");
              },
              child: Container(
                height: 50,
                decoration: BoxDecoration(
                  color: CupertinoColors.darkBackgroundGray,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      blurRadius: 5,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 14.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Your Favorites",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Icon(
                        Icons.keyboard_arrow_right,
                        color: Colors.white,
                        size: 28,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 270,
            child: Consumer<FavoritesProvider>(
              builder:
                  (BuildContext context, favoritesProvider, Widget? child) {
                List<MovieDetailsModel> favorites =
                    favoritesProvider.favoriteMovies;

                if (favorites.isEmpty) {
                  return Center(
                    child: Image.asset("assets/images/notFound.gif"),
                  );
                }
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: favorites.length,
                    itemBuilder: (context, index) {
                      MovieDetailsModel movie = favorites[index];
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  MovieDetailsPage(movieDetails: movie),
                            ),
                          );
                        },
                        child: Container(
                          width: 150,
                          margin: const EdgeInsets.only(right: 16.0),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.1),
                                blurRadius: 5,
                                offset: Offset(0, 3),
                              ),
                            ],
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: ClipRRect(
                                  borderRadius: BorderRadius.vertical(
                                      top: Radius.circular(20)),
                                  child: Image.network(
                                    movie.poster ?? "",
                                    width: double.infinity,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      movie.title ?? "",
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    SizedBox(height: 5),
                                    Text(
                                      "Actors: ${movie.actors ?? ""}",
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: Colors.grey,
                                      ),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    SizedBox(height: 3),
                                    Text(
                                      "Released: ${movie.released ?? ""}",
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: Colors.grey,
                                      ),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
