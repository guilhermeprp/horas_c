import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:uniphc/app/modules/atividades/widgets/aba_navegacao/aba_navegacao_widget.dart';
import 'package:uniphc/app/modules/atividades/widgets/card_atividade/card_atividade_slider.dart';
import 'package:uniphc/app/shared/divisor/divisor_widget.dart';
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
      backgroundColor: Color.fromRGBO(0, 30, 90, 1),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(43),
        child: AppBar(
          backgroundColor: Colors.transparent,
          centerTitle: true,
          elevation: 0,
          title: Text(widget.title),
        ),
      ),
      drawer: AbaNavegacao(),
      body: Container(
        alignment: Alignment.topCenter,
        child: Stack(
          children: <Widget>[
            Container(
              alignment: Alignment.topCenter,
              margin: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.038),
              child: Text(
                "Total de Horas",
                style: TextStyle(
                  fontSize: 22,
                  fontFamily: "ArialRounded",
                  color: Colors.white,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(
                  MediaQuery.of(context).size.width * 0.375,
                  MediaQuery.of(context).size.height * 0.1,
                  MediaQuery.of(context).size.width * 0.375,
                  0),
              width: MediaQuery.of(context).size.width / 4,
              height: MediaQuery.of(context).size.height / 8,
              child: CircularProgressIndicator(
                backgroundColor: Colors.grey[300],
                value: 0.7,
                strokeWidth: 10,
              ),
            ),
            Container(
              alignment: Alignment.topCenter,
              margin: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.145),
              child: Text(
                "180H",
                style: TextStyle(
                    fontSize: 20,
                    fontFamily: "ArialRounded",
                    color: Colors.white),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(10)),
              ),
              margin: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.3),
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: ListView(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Expanded(
                        child: Container(
                          margin: EdgeInsets.only(top: 15),
                          child: Text(
                            "Atividade xyz",
                            style: TextStyle(fontSize: 16),
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(top: 10),
                        height: 70,
                        width: 70,
                        child: CircularProgressIndicator(
                          backgroundColor: Colors.grey[300],
                          value: 0.7,
                          strokeWidth: 10,
                        ),
                      ),
                    ],
                  ),
                  DivisorWidget(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
