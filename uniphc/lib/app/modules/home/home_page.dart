import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:uniphc/app/modules/home/home_module.dart';
import 'package:uniphc/app/modules/home/widgets/card_atividade/card_atividade_slider.dart';
import 'package:uniphc/app/modules/home/widgets/card_atividade/card_atividade_widget.dart';
import 'home_controller.dart';

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({Key key, this.title = "Horas Complementares"})
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
      backgroundColor: Colors.indigo[900],
      appBar: AppBar(
        centerTitle: true,
        title: Text(widget.title),
      ),
      body: Observer(
        builder: (BuildContext context) {
          return ListView.builder(
            itemCount: homeController.listadeAtividades.length,
            itemBuilder: (BuildContext context, int index) {
              return CardAtividadeWidget(
                nomeAtividade: homeController.listadeAtividades[index].atividadeNome,
                pesoAtividade: "Peso "+homeController.listadeAtividades[index].atividadePeso,
                // limiteAtividade: homeController.listadeAtividades[index].atividadeLimite.toDouble(),
                );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: null,
        backgroundColor: Colors.green[700],
        child: Icon(Icons.thumb_up, color: Colors.white),
      ),
    );
  }
}
