import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:uniphc/app/modules/atividades/atividades_module.dart';
import 'package:uniphc/app/modules/atividades/widgets/aba_navegacao/aba_navegacao_widget.dart';
import 'package:uniphc/app/modules/atividades/widgets/card_atividade/card_atividade_widget.dart';
import 'atividades_controller.dart';

class AtividadesPage extends StatefulWidget {
  final String title;
  const AtividadesPage({Key key, this.title = "Atividades"}) : super(key: key);

  @override
  _AtividadesPageState createState() => _AtividadesPageState();
}

class _AtividadesPageState
    extends ModularState<AtividadesPage, AtividadesController> {
  //use 'controller' variable to access controller
  AtividadesController atividadesController = AtividadesModule.to.get();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo[700],
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
            itemCount: atividadesController.listadeAtividades.length,
            itemBuilder: (BuildContext context, int index) {
              return CardAtividadeWidget(
                nomeAtividade:
                    atividadesController.listadeAtividades[index].atividadeNome,
                pesoAtividade: "Peso " +
                    atividadesController.listadeAtividades[index].atividadePeso,
                medidaAtividade: atividadesController
                    .listadeAtividades[index].atividadeMedida,
              );
            },
          );
        },
      ),

      floatingActionButton: FloatingActionButton(
        // Alterar para calcular as atividades e ir para a tela de estatísticas
        onPressed: null,
        backgroundColor: Colors.green[800],
        child: Icon(Icons.alarm_on, size: 40, color: Colors.white),
      ),
    );
  }
}
