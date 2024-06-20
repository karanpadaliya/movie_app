import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:movie_app/controller/ApiHelper.dart';
import 'package:movie_app/controller/HomeProvider.dart';
import 'package:movie_app/model/searchModel.dart';
import 'package:movie_app/view/HomePage.dart';
import 'package:provider/provider.dart';

class SearchMovieList extends StatefulWidget {
  SearchMovieList({Key? key}) : super(key: key);

  @override
  _SearchMovieListState createState() => _SearchMovieListState();
}

class _SearchMovieListState extends State<SearchMovieList> {
  TextEditingController searchController = TextEditingController();
  Future<Response>? _searchResult;

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeProvider>(
      builder: (context, homeProvider, Widget? child) {
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(),
          body: Column(
            children: [
              RichText(
                text: TextSpan(
                  text: '',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 22,
                  ),
                  children: <TextSpan>[
                    TextSpan(
                      text: 'Find ',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 22,
                      ),
                    ),
                    TextSpan(
                      text: 'Favourite ',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.blue,
                        fontSize: 26,
                      ),
                    ),
                    TextSpan(
                      text: 'Movie',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 22,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: FutureBuilder<Response>(
                  future: _searchResult,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(child: CircularProgressIndicator());
                    } else if (snapshot.hasError) {
                      return Center(child: Text("Error: ${snapshot.error}"));
                    } else if (snapshot.hasData && snapshot.data != null) {
                      SearchModel searchMode =
                          searchModelFromJson(snapshot.data!.body);
                      return ListView.builder(
                        itemCount: searchMode.search?.length ?? 0,
                        itemBuilder: (context, index) {
                          var search = searchMode.search![index];
                          return Container(
                            margin: EdgeInsets.all(10),
                            child: Stack(
                              children: [
                                Image.network(
                                  search.poster ?? "",
                                  fit: BoxFit.cover,
                                  height: 200,
                                  width: double.infinity,
                                  errorBuilder: (context, error, stackTrace) {
                                    return Text("No Image");
                                  },
                                ),
                                ClipRRect(
                                  // Clip it cleanly.
                                  child: BackdropFilter(
                                    filter: ImageFilter.blur(
                                        sigmaX: 10, sigmaY: 10),
                                    child: Container(
                                      color: Colors.grey.withOpacity(0.1),
                                      alignment: Alignment.center,
                                      height: 200,
                                      child: Image.network(
                                        search.poster ?? "",
                                        fit: BoxFit.cover,
                                        errorBuilder:
                                            (context, error, stackTrace) {
                                          return Text("No Image");
                                        },
                                      ),
                                    ),
                                  ),
                                ),
                                Positioned(
                                  bottom: 10,
                                  left: 10,
                                  child: Text(
                                    search.title ?? "",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      backgroundColor: Colors.black54,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      );
                    } else {
                      return Center(
                        child: Image.asset("assets/images/notFound.gif"),
                      );
                    }
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: CupertinoTextField(
                  controller: searchController,
                  maxLines: 1,
                  maxLength: 20,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: CupertinoColors.systemGrey2),
                  ),
                  placeholder: "Search",
                  prefix: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Icon(
                      CupertinoIcons.search,
                    ),
                  ),
                  suffix: IconButton(
                    onPressed: () {
                      searchController.clear();
                      Navigator.pushReplacementNamed(context, "HomePage");
                    },
                    icon: Icon(
                      CupertinoIcons.delete_left,
                    ),
                  ),
                  onSubmitted: (value) {
                    setState(() {
                      _searchResult = ApiHelper.obj.getApiMovieData(value);
                    });
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
