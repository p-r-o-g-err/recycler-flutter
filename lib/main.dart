import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:recycler_flutter_app/screens/Splash/splash.dart';
import 'package:recycler_flutter_app/screens/HomePage/home.dart';

void main() => runApp(RecyclerApplication());

class RecyclerApplication extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/login': (BuildContext context) => Splash(),
        '/home': (BuildContext context) => Home()
      },
      initialRoute: '/home',
    );
  }
}
