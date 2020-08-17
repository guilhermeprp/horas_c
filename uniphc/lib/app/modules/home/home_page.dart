import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:uniphc/app/modules/atividades/widgets/aba_navegacao/aba_navegacao_widget.dart';
import 'package:uniphc/app/shared/combobox/combobox_widget.dart';
import 'home_controller.dart';

class _HomePageState extends ModularState<HomePage, HomeController> {
  var scaffoldKey = GlobalKey<ScaffoldState>();
  //use 'controller' variable to access controller

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      drawer: AbaNavegacao(),
      body: Container(
        color: Color.fromRGBO(0, 30, 90, 1),
        child: Stack(
          children: <Widget>[
            //# Logo do Background
            Opacity(
              opacity: 1,
              child: Container(
                width: MediaQuery.of(context).size.width / 2,
                height: MediaQuery.of(context).size.height,
                decoration: BoxDecoration(
                    image: DecorationImage(
                  fit: BoxFit.fitHeight,
                  alignment: FractionalOffset.centerRight,
                  image: AssetImage('assets/images/logo_app.png'),
                )),
              ),
            ),

            //# Nome APP
            Container(
              alignment: Alignment.center,
              margin: EdgeInsets.only(
                  bottom: MediaQuery.of(context).size.height * 0.58),
              child: Text(
                'Horas C',
                style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontFamily: 'ArialRounded'),
              ),
            ),

            //# Selecione seu curso
            Container(
              margin: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.43),
              child: Column(
                children: <Widget>[
                  Container(
                    child: Text(
                      'Selecione seu Curso:',
                      style: TextStyle(
                        fontSize: 22,
                        color: Colors.white,
                      ),
                    ),
                  ),

                  //# Aba/Box de seleção
                  // TODO: Criar filtro para pegar atividades por curso escolhido
                  ComboboxWidget(
                    items: [
                      Model("01", "Análise de Sistemas"),
                      Model("02", "Ciência da Computação"),
                      Model("03", "Enfermagem"),
                      Model("04", "Jornalismo")
                    ],
                    onChanged: (item) {
                      print(item);
                    },
                    itemSelecionado: Model("01", "Análise de Sistemas"),
                  ),
                ],
              ),
            ),

            //# Botão de confirmar Home app
            Container(
              alignment: Alignment.center,
              margin: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.5),
              child: FittedBox(
                child: RawMaterialButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/Atividades');
                  },
                  shape: CircleBorder(),
                  child: Icon(
                    MdiIcons.checkboxMarkedCircleOutline,
                    size: width * 0.25,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({Key key, this.title = "Home"}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}
