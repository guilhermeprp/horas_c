import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:uniphc/app/modules/home/home_module.dart';
import 'package:uniphc/app/modules/home/widgets/card_atividade/card_atividade_widget.dart';
import 'home_controller.dart';

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({Key key, this.title = "Atividades"})
      : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeController> {
  //use 'controller' variable to access controller
  HomeController homeController = HomeModule.to.get();
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
          title:  Text(widget.title),
        ),
      ),

      // Drawer side bar do aplicativo
      drawer: Drawer(
        child: ListView(
        

        ),

      ),

      body: Observer(
        builder: (BuildContext context) {
          return ListView.builder(
            itemCount: homeController.listadeAtividades.length,
            itemBuilder: (BuildContext context, int index) {
              return CardAtividadeWidget(
                nomeAtividade: homeController.listadeAtividades[index].atividadeNome,
                pesoAtividade: "Peso "+homeController.listadeAtividades[index].atividadePeso,
                medidaAtividade: homeController.listadeAtividades[index].atividadeMedida,
                // limiteAtividade: homeController.listadeAtividades[index].atividadeLimite.toDouble(),
                );
            },
          );
        },
      ),
      

      floatingActionButton: FloatingActionButton(
        // Alterar para calcular as atividades e ir para a tela de estatísticas
        onPressed: null,
        backgroundColor: Colors.green[800],
        child: Icon(Icons.alarm_on, size: 40 , color: Colors.white),

      ),
    );
  }
}
