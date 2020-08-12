import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:uniphc/app/modules/splash/loader_animator.dart';
import 'splash_controller.dart';

class _SplashPageState extends ModularState<SplashPage, SplashController> {
  //use 'controller' variable to access controller

  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 4), () => Navigator.pushNamed(context, "/Home"));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
              decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/splash_screen_app.png"),
              fit: BoxFit.cover,
            ),
          )),
          Positioned(
            left: 130,
            bottom: 50,
            child: Loading(
              radius: 30.0,
              dotRadius: 6.0,
            ),
          )
        ],
      ),
    );
  }
}

class SplashPage extends StatefulWidget {
  final String title;
  const SplashPage({Key key, this.title = "Splash"}) : super(key: key);

  @override
  _SplashPageState createState() => _SplashPageState();
}
