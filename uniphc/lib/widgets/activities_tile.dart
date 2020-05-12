import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:uniphc/controller/peso_controller.dart';
import 'package:uniphc/widgets/custom_slider.dart';
import 'package:uniphc/controller/atividades_controller.dart';
class ActivitiesTile extends StatefulWidget {
  
  @override
  _ActivitiesTileState createState() => _ActivitiesTileState();
}
class _ActivitiesTileState extends State<ActivitiesTile> {
  
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Card(
            margin: EdgeInsets.symmetric(horizontal: 10),
            child: ListView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: listaAtividades.length,
                itemBuilder: (BuildContext context, int index) {
                  Peso peso = listaPesos[index];
                  Atividade atividade = listaAtividades[index];
                        print('${peso.medidaPeso}');
                        print('${atividade.nome}');
                  return Column(
                    children: <Widget>[
                      ListTile(
                        title: Text(atividade.nome),
                        subtitle: Text('Peso: '+peso.medidaPeso),
                      ),
                     CustomSlider()
                    ],
                  );
                }),
          ),
        ],
      ),
    );
  }
  }
  