import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:uniphc/app/database/dao/estatisticas_dao.dart';
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
  final EstatisticaDao _dao = EstatisticaDao();

  var valor = 0;
  double estatisticas = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 70),
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
    final String tipoAtividade = widget.tipoAtividade;
    final int limiteAtividade = widget.limiteAtividade;
    var horaAtividade = valor / widget.pesoAtividade;
    final String idAtividade = widget.idAtividade;

    final Estatistica estatistica =
        Estatistica(0, tipoAtividade, limiteAtividade, horaAtividade);
    if (estatistica != null &&
        idAtividade != null &&
        tipoAtividade != null &&
        limiteAtividade != null &&
        horaAtividade != null) {
      _dao.save(estatistica).then((id) => idAtividade);
    }

    print(idAtividade);
    print(tipoAtividade);
    print(limiteAtividade);
    print(horaAtividade);
  }
}
