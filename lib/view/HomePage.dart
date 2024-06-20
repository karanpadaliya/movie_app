import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/controller/HomeProvider.dart';
import 'package:movie_app/view/SearchMovieList.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isSearch = true;

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
                Provider.of<HomeProvider>(context, listen: false)
                    .getIsSearch();
                print(isSearch);
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
        builder: (BuildContext context, value, Widget? child) {
          return Visibility(
            visible: value.isSearch,
            child: Column(
              // mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Expanded(
                  child: SearchMovieList(),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
