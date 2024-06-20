import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:movie_app/controller/ApiHelper.dart';
import 'package:movie_app/controller/HomeProvider.dart';
import 'package:movie_app/model/movieDetailsModel.dart';
import 'package:movie_app/model/searchModel.dart';
import 'package:movie_app/view/MovieDetailsPage.dart';
import 'package:provider/provider.dart';

class SearchMovieList extends StatefulWidget {
  SearchMovieList({Key? key}) : super(key: key);

  @override
  _SearchMovieListState createState() => _SearchMovieListState();
}

class _SearchMovieListState extends State<SearchMovieList> {
  TextEditingController searchController = TextEditingController();
  Future<Response>? _searchResult;
  String? selectedType;
  String? selectedYear;

  final List<String> types = ['Movie', 'Series', 'Episode'];
  final List<String> years = List.generate(50, (index) => (DateTime.now().year - index).toString());

  void updateSearchResults() {
    if (searchController.text.isNotEmpty) {
      setState(() {
        _searchResult = ApiHelper.obj.getApiMovieData(
          searchController.text,
          selectedType,
          selectedYear,
        );
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeProvider>(
      builder: (context, homeProvider, Widget? child) {
        return Scaffold(
          backgroundColor: Colors.white,
          body: Column(
            children: [
              SizedBox(height: 10),
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
                    child: Icon(CupertinoIcons.search),
                  ),
                  suffix: IconButton(
                    onPressed: () {
                      searchController.clear();
                      Navigator.pushReplacementNamed(context, "HomePage");
                    },
                    icon: Icon(CupertinoIcons.delete_left),
                  ),
                  onSubmitted: (value) {
                    updateSearchResults();
                  },
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  DropdownButton<String>(
                    hint: Text("Select Type"),
                    value: selectedType,
                    onChanged: (newValue) {
                      setState(() {
                        selectedType = newValue;
                        updateSearchResults();
                      });
                    },
                    items: types.map((type) {
                      return DropdownMenuItem(
                        child: Text(type),
                        value: type,
                      );
                    }).toList(),
                  ),
                  SizedBox(width: 20),
                  DropdownButton<String>(
                    hint: Text("Select Year"),
                    value: selectedYear,
                    onChanged: (newValue) {
                      setState(() {
                        selectedYear = newValue;
                        updateSearchResults();
                      });
                    },
                    items: years.map((year) {
                      return DropdownMenuItem(
                        child: Text(year),
                        value: year,
                      );
                    }).toList(),
                  ),
                ],
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
                      SearchModel searchMode = searchModelFromJson(snapshot.data!.body);
                      return GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: 1,
                          crossAxisSpacing: 1,
                        ),
                        itemCount: searchMode.search?.length ?? 0,
                        itemBuilder: (context, index) {
                          var search = searchMode.search![index];
                          return GestureDetector(
                            onTap: () async {
                              try {
                                MovieDetailsModel movieDetails = await ApiHelper.obj.getApiMovieDetails(search.imdbId!);
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => MovieDetailsPage(movieDetails: movieDetails),
                                  ),
                                );
                              } catch (e) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(content: Text("Failed to load movie details")),
                                );
                              }
                            },
                            child: Container(
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
                                    child: BackdropFilter(
                                      filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                                      child: Container(
                                        alignment: Alignment.center,
                                        height: 200,
                                        child: Image.network(
                                          search.poster ?? "",
                                          fit: BoxFit.cover,
                                          errorBuilder: (context, error, stackTrace) {
                                            return Text("No Image");
                                          },
                                        ),
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    bottom: 5,
                                    left: 5,
                                    child: Container(
                                      height: 25,
                                      decoration: BoxDecoration(color: Colors.white),
                                      child: Text(
                                        search.title ?? "",
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 15,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
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
            ],
          ),
        );
      },
    );
  }
}
