import 'package:flutter/material.dart';
import 'package:recycler_flutter_app/main.dart';
import 'package:recycler_flutter_app/values/Colors.dart';

final loginPlatesDecorationStyle = BoxDecoration(
  color: Colors.white,
  borderRadius: BorderRadius.circular(9),
  boxShadow: [
    BoxShadow(
      color: Colors.black12,
      blurRadius: 10,
      offset: Offset(0,2)
    )
  ]
);
var loginPlateTextStyle = TextStyle(
  color: textMainColor,
  fontFamily: 'OpenSans',
  fontSize: 20,

);