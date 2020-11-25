import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import 'manuais_controller.dart';
import 'package:uniphc/app/modules/atividades/widgets/aba_navegacao/aba_navegacao_widget.dart';

class _ManuaisPageState extends ModularState<ManuaisPage, ManuaisController> {
  var scaffoldKey = GlobalKey<ScaffoldState>();
  //use 'controller' variable to access controller
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF16171b),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: Text("Manuais"),
      ),
      drawer: AbaNavegacao(),
      body: Column(
        children: [
          //# Botões Manuais app
          Container(
            margin: EdgeInsets.only(top: 105),
            alignment: Alignment.topCenter,
            child: FittedBox(
              child: RawMaterialButton(
                onPressed: () => launch(
                    "https://drive.google.com/file/d/1CDTQRl_2kysaUTQa5LsY8TGNQyC4Ytyd/view?usp=sharing"),
                shape: CircleBorder(),
                child: Icon(
                  MdiIcons.fileDocumentOutline,
                  size: MediaQuery.of(context).size.width * 0.5,
                  color: Color(0xFFef9a9a),
                ),
              ),
            ),
          ),
          Container(
            child: Text(
              "Manual AC 2019.pdf",
              style: TextStyle(color: Colors.white),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 40),
            alignment: Alignment.center,
            child: FittedBox(
              child: RawMaterialButton(
                onPressed: () => launch(
                    "https://drive.google.com/file/d/15AuNfdARV4_Wpt7fjd3BdBkiYLpRb_lJ/view?usp=sharing"),
                shape: CircleBorder(),
                child: Icon(
                  MdiIcons.fileDocumentOutline,
                  size: MediaQuery.of(context).size.width * 0.5,
                  color: Color(0xFFd5d170),
                ),
              ),
            ),
          ),
          Container(
            child: Text(
              "Relatório.pdf",
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
      //# Barra de navegação inferior
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.fromLTRB(50, 0, 50, 10),
        child: Container(
          clipBehavior: Clip.antiAliasWithSaveLayer,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black, width: 0.3),
            borderRadius: BorderRadius.all(Radius.circular(20)),
            color: Color(0xFF212121),
          ),
          height: 55,
          child: ClipRRect(
            clipBehavior: Clip.antiAlias,
            borderRadius: BorderRadius.all(
              Radius.circular(20),
            ),
            child: BottomAppBar(
              color: Colors.transparent,
              notchMargin: 1,
              elevation: 0,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(30, 0, 30, 3),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      icon: Icon(
                        Icons.home,
                        size: 35,
                        color: Colors.white,
                      ),
                      onPressed: () {
                        Navigator.pushNamed(context, '/Home');
                      },
                    ),
                    IconButton(
                      icon: Icon(
                        Icons.assignment,
                        size: 35,
                        color: Colors.white,
                      ),
                      onPressed: () {
                        Navigator.pushNamed(context, "/Atividades");
                      },
                    ),
                    IconButton(
                      icon: Icon(
                        Icons.analytics,
                        size: 35,
                        color: Colors.white,
                      ),
                      onPressed: () {
                        Navigator.pushNamed(context, "/Estatisticas");
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class ManuaisPage extends StatefulWidget {
  const ManuaisPage({Key key}) : super(key: key);

  @override
  _ManuaisPageState createState() => _ManuaisPageState();
}
