import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:recycler_flutter_app/values/Colors.dart';
import 'package:recycler_flutter_app/styles/styles.dart';

class Splash extends StatefulWidget {
  final String nextRoute;

  @override
  Splash({this.nextRoute});

  State<StatefulWidget> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: mainColor,
        body: Stack(
          children: <Widget>[
            Container(
              child: SingleChildScrollView(
                  physics: AlwaysScrollableScrollPhysics(),
                  padding: EdgeInsets.symmetric(horizontal: 50, vertical: 100),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset(
                              "lib/assets/images/logo.svg",
                              color: Colors.white,
                              width: 100,
                              height: 100,
                            )
                          ]),
                      SizedBox(
                        height: 30,
                      ),
                      LoginPlate()
                    ],
                  )),
            )
          ],
        ));
  }
}

class LoginPlate extends StatefulWidget {
  //плашка для входа
  @override
  State<StatefulWidget> createState() => _loginPlateState();
}

class _loginPlateState extends State<LoginPlate> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Your login"),
          SizedBox(height: 10),
          Container(
              decoration: loginPlatesDecorationStyle,
              alignment: Alignment.centerLeft,
              height: 60,
              child: TextField(
                maxLines: 1,
                keyboardType: TextInputType.name,
                decoration: InputDecoration(border: InputBorder.none),
              )),
          SizedBox(height: 10),
          Text("Your password"),
          SizedBox(height: 10),
          Container(
              decoration: loginPlatesDecorationStyle,
              alignment: Alignment.centerLeft,
              height: 60,
              child: TextField(
                maxLines: 1,
                keyboardType: TextInputType.name,
                decoration: InputDecoration(border: InputBorder.none),
              ))
        ],
      ),
    );
  }
}

class LoadingPlate extends StatelessWidget {
  //чисто загрузка, сюда также переходим после авторизации,
  //здесь сделать колесико загрузки и фоновую подгрузку требуемых данных
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
}
