import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:uniphc/app/database/dao/estatisticas_dao.dart';
import 'package:uniphc/app/modules/atividades/models/estatistica_model.dart';
import 'package:uniphc/app/modules/atividades/widgets/aba_navegacao/aba_navegacao_widget.dart';
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
  final EstatisticaDao _dao = EstatisticaDao();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF16171b),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(43),
        child: AppBar(
          backgroundColor: Colors.transparent,
          centerTitle: true,
          elevation: 0,
          title: Text(widget.title),
        ),
      ),
      extendBody: true,
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
            Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  margin: EdgeInsets.fromLTRB(
                      MediaQuery.of(context).size.width * 0.375,
                      MediaQuery.of(context).size.height * 0.11,
                      MediaQuery.of(context).size.width * 0.375,
                      0),
                  width: MediaQuery.of(context).size.width / 4,
                  height: MediaQuery.of(context).size.height / 8,
                  child: CircularProgressIndicator(
                    backgroundColor: Colors.transparent,
                    value: 0.7,
                    strokeWidth: 10,
                    valueColor: AlwaysStoppedAnimation<Color>(
                      Color(0xFF18d8f4),
                    ),
                  ),
                ),
                Positioned(
                  top: MediaQuery.of(context).size.height * 0.15,
                  child: Text(
                    "180H",
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),

            //# Coluna List View
            FutureBuilder<List<Estatistica>>(
              initialData: List(),
              future: _dao.findAll(),
              builder: (context, snapshot) {
                final List<Estatistica> estatisticas = snapshot.data;
                switch (snapshot.connectionState) {
                  case ConnectionState.none:
                    break;

                  case ConnectionState.waiting:
                    return Center(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CircularProgressIndicator(),
                          Text("Loading..."),
                        ],
                      ),
                    );
                    break;

                  case ConnectionState.active:
                    break;

                  case ConnectionState.done:
                    return Container(
                      decoration: BoxDecoration(
                        color: Color(0xFF202125),
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20)),
                      ),
                      margin: EdgeInsets.fromLTRB(
                          30, MediaQuery.of(context).size.height * 0.27, 30, 0),
                      padding: EdgeInsets.fromLTRB(20, 0, 20, 20),
                      child: ListView.builder(
                        itemBuilder: (context, index) {
                          final Estatistica estatistica = estatisticas[index];
                          return buildList(estatistica);
                        },
                        itemCount: estatisticas.length,
                      ),
                    );

                    break;
                }
                return Text('Erro desconhecido');
              },
            ),
          ],
        ),
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
                        Navigator.pushNamed(context, "/Home");
                      },
                    ),
                    IconButton(
                      icon: Icon(
                        Icons.assignment_return,
                        size: 35,
                        color: Colors.white,
                      ),
                      onPressed: () {
                        Navigator.pushNamed(context, "/Atividades");
                      },
                    ),
                    IconButton(
                      icon: Icon(
                        Icons.picture_as_pdf,
                        size: 35,
                        color: Colors.white,
                      ),
                      onPressed: () {
                        Navigator.pushNamed(context, "/");
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

  Row buildList(estatistica) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Expanded(
          child: Container(
            child: Text(
              estatistica.tipoAtividade,
              style: TextStyle(
                fontSize: 16,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        Stack(
          alignment: Alignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 15, 15, 15),
              child: Container(
                height: 60,
                width: 60,
                child: CircularProgressIndicator(
                  backgroundColor: Colors.transparent,
                  value:
                      estatistica.limiteAtividade / estatistica.horaAtividade,
                  strokeWidth: 10,
                  valueColor: AlwaysStoppedAnimation<Color>(
                    Color(0xFF18d8f4),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 15, 15, 15),
              child: Text(
                estatistica.horaAtividade,
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
