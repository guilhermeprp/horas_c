import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:uniphc/app/modules/atividades/widgets/aba_navegacao/aba_navegacao_widget.dart';
import 'package:uniphc/app/shared/combobox/combobox_widget.dart';

import 'home_controller.dart';

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({Key key, this.title = "Home"}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeController> {
  var scaffoldKey = GlobalKey<ScaffoldState>();
  //use 'controller' variable to access controller

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      drawer: AbaNavegacao(),
      body: Container(
        decoration: BoxDecoration(
          color: Color.fromRGBO(0, 30, 90, 1),
        ),
        child: Stack(
          children: <Widget>[
            //Drawer customizado para Home
            Positioned(
                left: 10,
                top: 30,
                child: IconButton(
                  icon: Icon(Icons.menu),
                  color: Colors.white,
                  onPressed: () => scaffoldKey.currentState.openDrawer(),
                )),

            // Logo do APP
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                      margin: EdgeInsets.only(top: 50),
                      height: 230,
                      width: 230,
                      child: Image.asset('assets/images/logo_app.png')),
                ],
              ),
            ),
            Center(
              child: Container(
                  margin: EdgeInsets.only(bottom: 35),
                  child: Text('Selecione seu Curso:',
                      style: TextStyle(fontSize: 22, color: Colors.white))),
            ),

            // Aba/Box de seleção
            ComboboxWidget(
              items: [
                Model("01", "Análise de Sistemas"),
                Model("02", "Ciência da Computação"),
                Model("03", "Enfermagem"),
                Model("04", "Jornalismo")
              ],
              onChanged: (item) {
                print(item.curso);
              },
              itemSelecionado: Model("01", "Análise de Sistemas"),
            ),

            // Botão de confirmar Home app
            Container(
              alignment: Alignment.center,
              margin: EdgeInsets.only(top: 220),
              width: 500,
              child: FittedBox(
                child: RawMaterialButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/Atividades');
                  },
                  shape: CircleBorder(),
                  child: Icon(
                    Icons.done,
                    size: 80,
                    color: Colors.white,
                  ),
                ),
              ),
            ),

            // Logo dos Criadores
            Container(
                alignment: Alignment.bottomLeft,
                margin: EdgeInsets.all(10),
                child:
                    Text('Powered by:', style: TextStyle(color: Colors.white))),
            Container(
                margin: EdgeInsets.only(left: 90, bottom: 1),
                alignment: Alignment.bottomLeft,
                child: Image.asset(
                  'assets/images/logo_gp.png',
                  height: 35,
                  width: 35,
                )),
          ],
        ),
      ),
    );
  }
}
