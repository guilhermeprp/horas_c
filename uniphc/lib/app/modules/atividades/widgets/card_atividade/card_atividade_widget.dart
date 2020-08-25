import 'package:flutter/material.dart';
import 'package:uniphc/app/modules/atividades/atividades_controller.dart';

AtividadesController atividadesController;

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
      margin: EdgeInsets.all(5),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black38,
            blurRadius: 20,
            spreadRadius: 0,
            offset: Offset(2, 1),
          ),
        ],
        color: Color(0xFF18d8f4),
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(30),
          bottomLeft: Radius.circular(30),
          bottomRight: Radius.circular(30),
        ),
      ),
      height: 128,
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.fromLTRB(14, 10, 14, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: 5.0),
            child: Text(
              nomeAtividade,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Color(0xFF212121),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Text(
                    pesoAtividade,
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.normal,
                      color: Color(0xFF212121),
                    ),
                  ),
                ),
                Text(
                  medidaAtividade,
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.normal,
                    color: Color(0xFF212121),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
