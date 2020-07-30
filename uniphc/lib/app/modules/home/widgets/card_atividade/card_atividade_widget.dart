import 'dart:collection';

import 'package:flutter/material.dart';

  double value = 1.0;
class CardAtividadeWidget extends StatelessWidget {
  final String nomeAtividade;
  final String pesoAtividade;
  final double horaAtividade;

  const CardAtividadeWidget({
    Key key, @required this.nomeAtividade,
       @required this.pesoAtividade,
       @required this.horaAtividade,
  }): super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Stack(
        children: <Widget>[
          Container(
            height: 140,
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(nomeAtividade,                  
                  style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
                ),
                Text( pesoAtividade,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.normal),
                ),
                Slider.adaptive(
                  min: 0,
                  max: horaAtividade,
                  // divisions: 10,
                  inactiveColor: Colors.blueGrey[400],
                  activeColor: Colors.indigo,
                  value: value,
                  onChanged: (double e) => changed (e),
                ),
                Text("data"),
              ],
            ),
          ),
        ],
      ),
    );
  }
  void changed (e) {
    setState((){
    value = e;

    });
  }

  void setState(Null Function() param0) {}




}
