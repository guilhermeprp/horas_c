import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SliderWidget extends StatefulWidget {
  final int limiteAtividade;
  final double pesoAtividade;
  const SliderWidget(
      {Key key, @required this.limiteAtividade, @required this.pesoAtividade})
      : super(key: key);

  @override
  _SliderWidgetState createState() => _SliderWidgetState();
}

class _SliderWidgetState extends State<SliderWidget> {
  var valor = 0;

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
              activeColor: Colors.indigo,
              value: valor.toDouble(),
              onChanged: (double newValue) {
                setState(() => valor = newValue.round());
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
    // num peso = widget.pesoAtividade as num;
    var estatistica = valor / widget.pesoAtividade;

    print(estatistica.round());

    // print(widget.pesoAtividade);
  }
}
