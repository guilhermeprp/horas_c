import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:uniphc/app/database/app_database.dart';
import 'package:uniphc/app/modules/atividades/models/estatistica_model.dart';

class SliderWidget extends StatefulWidget {
  final int limiteAtividade;
  final double pesoAtividade;
  final String tipoAtividade;
  final String idAtividade;
  const SliderWidget({
    Key key,
    @required this.limiteAtividade,
    @required this.pesoAtividade,
    @required this.tipoAtividade,
    @required this.idAtividade,
  }) : super(key: key);

  @override
  _SliderWidgetState createState() => _SliderWidgetState();
}

class _SliderWidgetState extends State<SliderWidget> {
  var valor = 0;
  double estatisticas = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 70),
      padding: EdgeInsets.only(left: 10),
      child: Row(
        children: <Widget>[
          Container(
            width: MediaQuery.of(context).size.width * 0.75,
            child: Slider(
              min: 0,
              max: widget.limiteAtividade.toDouble(),
              divisions: widget.limiteAtividade,
              inactiveColor: Colors.blueGrey[400],
              activeColor: Color(0xFF18d8f4),
              value: valor.toDouble(),
              onChanged: (double newValue) {
                setState(
                  () => valor = newValue.round(),
                );
              },
              onChangeEnd: (double valor) {
                guardar();
              },
            ),
          ),
          Text(
            valor.round().toString(),
            style: TextStyle(
                color: Color(0xFF18d8f4),
                fontFamily: 'TickingTimebomb',
                fontSize: 20),
          ),
        ],
      ),
    );
  }

  void guardar() {
    // final String tipoAtividade = widget.tipoAtividade;
    // final int limiteAtividade = widget.limiteAtividade;
    // var horaAtividade = valor / widget.pesoAtividade;
    // final String idAtividade = widget.idAtividade;

    var newDBEstatistica = Estatistica(
      id: widget.idAtividade,
      tipoAtividade: widget.tipoAtividade,
      limiteAtividade: widget.limiteAtividade,
      horaAtividade: estatisticas,
    );
    DBProvider.db.newEstatistica(newDBEstatistica);

    print(estatisticas);
  }
}
