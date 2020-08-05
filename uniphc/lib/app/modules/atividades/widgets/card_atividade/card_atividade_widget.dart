import 'package:flutter/material.dart';
import 'package:uniphc/app/modules/atividades/widgets/card_atividade/card_atividade_slider.dart';

class CardAtividadeWidget extends StatelessWidget {
  final String nomeAtividade;
  final String pesoAtividade;
  final String medidaAtividade;

  const CardAtividadeWidget({
    Key key,
    @required this.nomeAtividade,
    @required this.pesoAtividade,
    @required this.medidaAtividade,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12),
      child: Card(
        child: Stack(
          children: <Widget>[
            Container(
              height: 128,
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    nomeAtividade,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: Text(
                          pesoAtividade,
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.normal),
                        ),
                      ),
                      Text(medidaAtividade,
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.normal)),
                    ],
                  ),
                  SliderWidget(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
