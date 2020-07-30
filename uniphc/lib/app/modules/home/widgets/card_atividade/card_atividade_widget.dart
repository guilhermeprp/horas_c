import 'package:flutter/material.dart';

class CardAtividadeWidget extends StatelessWidget {
  final String nomeAtividade;
  final String pesoAtividade;

  const CardAtividadeWidget({
    Key key, @required this.nomeAtividade,
       @required this.pesoAtividade
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
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
                Text( pesoAtividade,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.normal),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
