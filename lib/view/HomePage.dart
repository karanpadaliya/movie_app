import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/controller/FavoritesProvider.dart';
import 'package:movie_app/controller/HomeProvider.dart';
import 'package:movie_app/model/movieDetailsModel.dart';
import 'package:movie_app/view/MovieDetailsPage.dart';
import 'package:movie_app/view/SearchMovieList.dart';
import 'package:movie_app/view/components/HomePage(Favorite).dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      backgroundColor: Colors.white,
      navigationBar: CupertinoNavigationBar(
        backgroundColor: CupertinoColors.darkBackgroundGray,
        middle: Text(
          "HomePage",
          style: TextStyle(color: CupertinoColors.white, fontSize: 20),
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              onPressed: () {
                Navigator.pushNamed(context, "FavoritesPage");
              },
              icon: Icon(
                CupertinoIcons.heart_fill,
                color: CupertinoColors.white,
                size: 23,
              ),
            ),
            IconButton(
              onPressed: () {
                Provider.of<HomeProvider>(context, listen: false).getIsSearch();
              },
              icon: Icon(
                CupertinoIcons.search,
                color: CupertinoColors.white,
                size: 23,
              ),
            ),
          ],
        ),
      ),
      child: Consumer<HomeProvider>(
        builder: (BuildContext context, homeProvider, Widget? child) {
          return Visibility(
            visible: homeProvider.isSearch,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Expanded(
                  child: SearchMovieList(),
                ),
              ],
            ),
            replacement: Home_FavoritePage(),
          );
        },
      ),
    );
  }
}
