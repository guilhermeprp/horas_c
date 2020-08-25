import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:uniphc/app/database/dao/estatisticas_dao.dart';

class SliderWidget extends StatefulWidget {
  final int limiteAtividade;
  final double pesoAtividade;
  final String tipoAtividade;
  const SliderWidget(
      {Key key,
      @required this.limiteAtividade,
      @required this.pesoAtividade,
      @required this.tipoAtividade})
      : super(key: key);

  @override
  _SliderWidgetState createState() => _SliderWidgetState();
}

class _SliderWidgetState extends State<SliderWidget> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _accountNumberController =
      TextEditingController();
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
              activeColor: Color(0xFF161616),
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
                color: Color(0xFF212121),
                fontFamily: 'TickingTimebomb',
                fontSize: 20),
          ),
        ],
      ),
    );
  }

  void guardar() {
    estatisticas = valor / widget.pesoAtividade;
    print(widget.tipoAtividade);
    print(estatisticas.round());
  }
}
