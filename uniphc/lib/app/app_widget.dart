import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: Modular.navigatorKey,
      title: 'Horas Complementares',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primaryColor: Colors.black),
      initialRoute: '/',
      onGenerateRoute: Modular.generateRoute,
    );
  }
}
