import 'package:animated_card/animated_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:hasura_connect/hasura_connect.dart';
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
          return ListView.builder(
            itemCount: atividades =
                atividadesController.listadeAtividades.length,
            itemBuilder: (BuildContext context, int index) {
              //Lista de Cards contendo atividades
              return AnimatedCard(
                direction: AnimatedCardDirection.right,
                initDelay: Duration(milliseconds: 1),
                duration: Duration(seconds: 2),
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Card(
                    child: Stack(
                      children: <Widget>[
                        CardAtividadeWidget(
                          nomeAtividade: atividadesController
                              .listadeAtividades[index].atividadeNome,
                          pesoAtividade: "Peso " +
                              atividadesController
                                  .listadeAtividades[index].atividadePeso,
                          medidaAtividade: atividadesController
                              .listadeAtividades[index].atividadeMedida,
                        ),
                        SliderWidget(
                          limiteAtividade: atividadesController
                              .listadeAtividades[index].atividadeLimite,
                          pesoAtividade: atividadesController
                              .listadeAtividades[index]
                              .atividadePesoEstatisticas,
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),

      // TODO: Alterar para calcular as atividades e ir para a tela de estatísticas

      //Botão para pagina de estatísticas
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, "/");
        },
        backgroundColor: Colors.green[800],
        child: Icon(Icons.alarm_on, size: 40, color: Colors.white),
      ),
    );
  }
}

class AtividadesPage extends StatefulWidget {
  final String title;
  const AtividadesPage({Key key, this.title = "Atividades"}) : super(key: key);

  @override
  _AtividadesPageState createState() => _AtividadesPageState();
}
