import 'dart:ui';

import 'package:animated_card/animated_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:uniphc/app/modules/atividades/atividades_module.dart';
import 'package:uniphc/app/modules/atividades/widgets/aba_navegacao/aba_navegacao_widget.dart';
import 'package:uniphc/app/modules/atividades/widgets/card_atividade/card_atividade_slider.dart';
import 'package:uniphc/app/modules/atividades/widgets/card_atividade/card_atividade_widget.dart';
import 'atividades_controller.dart';

class _AtividadesPageState
    extends ModularState<AtividadesPage, AtividadesController> {
  var atividades;
  //use 'controller' variable to access controller
  AtividadesController atividadesController = AtividadesModule.to.get();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
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

      // Drawer side bar do aplicativo
      drawer: AbaNavegacao(),

      body: Observer(
        builder: (BuildContext context) {
          return buildListView();
        },
      ),

      // TODO: Alterar para calcular as atividades e ir para a tela de estatísticas

      //Botão para pagina de estatísticas
      floatingActionButton: Padding(
        padding: EdgeInsets.only(top: 27),
        child: Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 17, 153, 142),
                Color.fromARGB(255, 56, 239, 125)
              ],
            ),
          ),
          child: FloatingActionButton(
            onPressed: () {
              Navigator.pushNamed(context, "/Estatisticas");
            },
            elevation: 0,
            backgroundColor: Colors.transparent,
            child:
                Icon(MdiIcons.clockCheckOutline, size: 40, color: Colors.white),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      // Barra de navegação inferior
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.fromLTRB(50, 0, 50, 5),
        child: Container(
          height: 55,
          child: ClipRRect(
            clipBehavior: Clip.antiAlias,
            borderRadius: BorderRadius.all(
              Radius.circular(20),
            ),
            child: BottomNavigationBar(
              backgroundColor: Color.fromRGBO(255, 255, 255, 1),
              items: [
                BottomNavigationBarItem(
                  icon: Padding(
                    padding: const EdgeInsets.only(right: 20),
                    child: Icon(
                      Icons.home,
                      color: Colors.grey,
                      size: 35,
                    ),
                  ),
                  title: SizedBox.shrink(),
                ),
                BottomNavigationBarItem(
                  icon: Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Icon(
                      Icons.picture_as_pdf,
                      color: Colors.grey,
                      size: 35,
                    ),
                  ),
                  title: SizedBox.shrink(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  //Lista de atividades
  ListView buildListView() {
    return ListView.builder(
      itemCount: atividades = atividadesController.listadeAtividades.length,
      itemBuilder: (BuildContext context, int index) {
        //Lista de Cards contendo atividades
        return AnimatedCard(
          direction: AnimatedCardDirection.right,
          initDelay: Duration(milliseconds: 1),
          duration: Duration(seconds: 2),
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Stack(
              children: <Widget>[
                Container(
                  // color: Colors.amber,
                  child: CardAtividadeWidget(
                    nomeAtividade: atividadesController
                        .listadeAtividades[index].atividadeNome,
                    pesoAtividade: "Peso " +
                        atividadesController
                            .listadeAtividades[index].atividadePeso,
                    medidaAtividade: atividadesController
                        .listadeAtividades[index].atividadeMedida,
                  ),
                ),
                SliderWidget(
                  limiteAtividade: atividadesController
                      .listadeAtividades[index].atividadeLimite,
                  pesoAtividade: atividadesController
                      .listadeAtividades[index].atividadePesoEstatisticas,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class AtividadesPage extends StatefulWidget {
  final String title;
  const AtividadesPage({Key key, this.title = "Atividades"}) : super(key: key);

  @override
  _AtividadesPageState createState() => _AtividadesPageState();
}
