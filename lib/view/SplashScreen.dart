import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    Future.delayed(
      Duration(seconds: 3),
      () {
        Navigator.pushReplacementNamed(context, "HomePage");
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: CupertinoColors.darkBackgroundGray,
        systemNavigationBarColor: CupertinoColors.darkBackgroundGray,
        systemNavigationBarDividerColor: CupertinoColors.darkBackgroundGray,
      ),
    );
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return Scaffold(
      backgroundColor: CupertinoColors.darkBackgroundGray,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Image.asset(
              "assets/images/movieAppLogo.png",
              height: 300,
              width: 300,
              // color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
// SizedBox(height: 20,),
// Row(
//   mainAxisSize: MainAxisSize.max,
//   mainAxisAlignment: MainAxisAlignment.spaceAround,
//   children: [
//     Image.asset(
//       "assets/images/01.png",
//       scale: 16,
//       color: Colors.limeAccent,
//     ),
//     Image.asset(
//       "assets/images/02.png",
//       scale: 16,
//       color: Colors.greenAccent,
//     ),
//     Image.asset(
//       "assets/images/03.png",
//       scale: 8,
//       color: Colors.pinkAccent,
//     ),
//     Image.asset(
//       "assets/images/04.png",
//       scale: 16,
//       color: Colors.blueAccent,
//     ),
//     Image.asset(
//       "assets/images/05.png",
//       scale: 16,
//       color: Colors.orange,
//     ),
//   ],
// ),
