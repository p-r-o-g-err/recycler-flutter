import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:recycler_flutter_app/screens/Splash/splash.dart';
import 'package:recycler_flutter_app/screens/HomePage/home.dart';

void main() => runApp(recyclerApplication());

class recyclerApplication extends StatelessWidget{
  final routes = <String , WidgetBuilder>{
    '/HomePage' : (BuildContext context) => Home()
  };



  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home:
        Splash(nextRoute: '/HomePage'),
      routes: routes,
    );
  }
}