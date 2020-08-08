import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SliderWidget extends StatefulWidget {
  final int limiteAtividade;
  const SliderWidget({Key key, @required this.limiteAtividade})
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
            width: 290,
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
                var estatistica = valor * 1 / 3;
                print(estatistica.round());
              },
            ),
          ),
          Text(valor.round().toString()),
        ],
      ),
    );
  }
}
