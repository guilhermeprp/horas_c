import 'package:flutter/material.dart';

class EstatisticaDefault extends StatefulWidget {
  final String atividade;

  const EstatisticaDefault({Key key, this.atividade}) : super(key: key);

  @override
  _State createState() => _State();
}

class _State extends State<EstatisticaDefault> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 245,
          height: 100,
          alignment: AlignmentDirectional(-1, 0),
          padding: EdgeInsets.only(left: 25),
          child: Text(
            widget.atividade,
            style: TextStyle(
              fontSize: 16,
              fontFamily: "ArialRounded",
              color: Colors.white,
            ),
          ),
        ),
        Stack(
          children: [
            Container(
              margin: EdgeInsets.only(left: 20),
              width: 50,
              height: 50,
              child: CircularProgressIndicator(
                backgroundColor: Colors.transparent,
                value: 1,
                strokeWidth: 5,
                valueColor: AlwaysStoppedAnimation<Color>(
                  Colors.grey,
                ),
              ),
            ),
            Container(
              child: Text(
                "0",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              margin: EdgeInsets.fromLTRB(41, 17, 0, 0),
            ),
          ],
        ),
      ],
    );
  }
}
