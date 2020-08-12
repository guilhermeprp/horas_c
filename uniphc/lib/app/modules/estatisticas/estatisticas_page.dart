import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'estatisticas_controller.dart';

class EstatisticasPage extends StatefulWidget {
  final String title;
  const EstatisticasPage({Key key, this.title = "Estatisticas"})
      : super(key: key);

  @override
  _EstatisticasPageState createState() => _EstatisticasPageState();
}

class _EstatisticasPageState
    extends ModularState<EstatisticasPage, EstatisticasController> {
  //use 'controller' variable to access controller

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: <Widget>[],
      ),
    );
  }
}
