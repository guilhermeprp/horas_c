import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
  var valor = 0;
  double estatisticas = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 70),
      child: Row(
        children: <Widget>[
          Container(
            width: MediaQuery.of(context).size.width * 0.8,
            child: Slider(
              min: 0,
              max: widget.limiteAtividade.toDouble(),
              label: valor.round().toString(),
              divisions: widget.limiteAtividade,
              inactiveColor: Colors.blueGrey[400],
              activeColor: Colors.blue[800],
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
            style: TextStyle(color: Colors.white),
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
