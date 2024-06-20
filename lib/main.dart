import 'package:flutter/material.dart';
import 'package:movie_app/controller/HomeProvider.dart';
import 'package:movie_app/view/SearchMovieList.dart';
import 'package:provider/provider.dart';
import 'package:movie_app/view/HomePage.dart';
import 'package:movie_app/view/SplashScreen.dart';

void main() {
  runApp(const MainPage());
}

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => HomeProvider(),), // Add your providers here
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: "/",
        routes: {
          "/": (context) => SplashScreen(),
          "HomePage": (context) => HomePage(),
          "SearchMovieList": (context) => SearchMovieList(),
        },
        onUnknownRoute: (settings) {
          return MaterialPageRoute(
            builder: (context) => Scaffold(
              body: Center(
                child: Text(
                  "onUnknownRoute",
                  style: TextStyle(fontSize: 40, color: Colors.black),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
