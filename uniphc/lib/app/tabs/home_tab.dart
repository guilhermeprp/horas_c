import 'package:flutter/material.dart';
class HomeTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
  
    Widget _buildBodyBack() => Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors:[
            Colors.indigo[900],
            Colors.indigoAccent[700]
          ],
          begin: Alignment.bottomLeft,
          end: Alignment.topRight
        )
      ),
    );

    return Stack(
      children: <Widget>[
        _buildBodyBack()
      ],
    );



  }
}