import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:recycler_flutter_app/values/Colors.dart';

class Splash extends StatefulWidget {
  final String nextRoute;

  @override
  Splash({this.nextRoute});

  State<StatefulWidget> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  Widget build(BuildContext context) {
    bool _logged = false; //описание логики проверки состояния логина
    Widget login = _logged
        ? Scaffold()
        : Text(
            "ты в логине, братан"); //  в завимимости от результата проверки выбираем блок действий
    return Scaffold(
      backgroundColor: mainColor,
        body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset("lib/assets/images/logo.svg", height: 100, width: 100)
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
                onPressed: () {
                  Navigator.of(context).pushReplacementNamed(widget.nextRoute);
                },
                child: Text("Войти"))
          ],
        )
      ],
    ));
  }
}

class LoginPlate extends StatefulWidget {
  //плашка для входа
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    throw UnimplementedError();
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
