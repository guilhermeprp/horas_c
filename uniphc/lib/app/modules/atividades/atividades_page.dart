import 'dart:ui';

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
  // use 'controller' variable to access controller
  AtividadesController atividadesController = AtividadesModule.to.get();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      backgroundColor: Color(0xFF16171b),

      //# Drawer side bar do aplicativo
      drawer: AbaNavegacao(),

      //# Chama List View
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            expandedHeight: 300,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.asset(
                'assets/images/background_sliver.png',
                fit: BoxFit.fitWidth,
                filterQuality: FilterQuality.medium,
              ),
              title: Stack(
                children: [
                  Text(
                    'Atividades',
                    style: TextStyle(
                      foreground: Paint()
                        ..style = PaintingStyle.stroke
                        ..strokeWidth = 3
                        ..color = Color(0xFF16171b),
                    ),
                  ),
                  Text('Atividades'),
                ],
              ),
              centerTitle: true,
            ),
            backgroundColor: Color(0xFF16171b),
            pinned: true,
            floating: false,
            stretch: true,
            elevation: 0,
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) => Observer(
                      builder: (BuildContext context) {
                        return buildListView();
                      },
                    ),
                childCount: 1),
          ),
        ],
      ),

      // TODO: Alterar para calcular as atividades e ir para a tela de estatísticas

      //# Botão para pagina de estatísticas
      floatingActionButton: Padding(
        padding: EdgeInsets.only(top: 55),
        child: Container(
          height: 60,
          width: 60,
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
            backgroundColor: Colors.transparent,
            child:
                Icon(MdiIcons.clockCheckOutline, size: 45, color: Colors.white),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

      //# Barra de navegação inferior
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.fromLTRB(50, 0, 50, 10),
        child: Container(
          clipBehavior: Clip.antiAliasWithSaveLayer,
          decoration: BoxDecoration(
            border: Border.all(color: Color(0xFF000000), width: 0.3),
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

  ListView buildListView() {
    return ListView.builder(
      physics: ClampingScrollPhysics(),
      shrinkWrap: true,
      itemCount: atividades = atividadesController.listadeAtividades.length,
      itemBuilder: (BuildContext context, int index) {
        //# Lista de Cards contendo atividades
        return Container(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Stack(
            children: <Widget>[
              Container(
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
                tipoAtividade:
                    atividadesController.listadeAtividades[index].atividadeNome,
                idAtividade: atividadesController.listadeAtividades[index].id,
              ),
            ],
          ),
        );
      },
    );
  }

  //# Builder da lista de atividades

}

class AtividadesPage extends StatefulWidget {
  final String title;
  const AtividadesPage({Key key, this.title = "Atividades"}) : super(key: key);

  @override
  _AtividadesPageState createState() => _AtividadesPageState();
}
