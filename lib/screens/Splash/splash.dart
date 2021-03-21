import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:recycler_flutter_app/screens/HomePage/home.dart';
import 'package:recycler_flutter_app/values/Colors.dart';
import 'package:recycler_flutter_app/styles/styles.dart';

class Splash extends StatefulWidget {
  State<StatefulWidget> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: <Widget>[
        Container(
          color: colorsMainColor,
        ),
        Container(
          child: SingleChildScrollView(
              physics: AlwaysScrollableScrollPhysics(),
              padding: EdgeInsets.symmetric(horizontal: 50, vertical: 100),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
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
          Text("Имя пользователя", style: loginPlateTextStyle),
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
          Text("Пароль", style: loginPlateTextStyle),
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
          SizedBox(
            height: 10,
          ),
          FlatButton(
              onPressed: () {
                toHomePage(context);
              },
              child: Text("LOG IN"))
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

void toHomePage(BuildContext context) {
  Navigator.pushReplacement(
      context, MaterialPageRoute(builder: (BuildContext context) => Home()));
}
