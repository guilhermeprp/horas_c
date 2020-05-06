import 'package:flutter/material.dart';
import 'package:uniphc/selectionbox.dart';

void main() {
  return runApp(MaterialApp(
  home: Scaffold(
      appBar: AppBar(         
        title: Center(
          child: Text('Unip HC')
        ),
      ),
      body: Container(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text('Selecione seu Curso:',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              // SizedBox(
              //   height: 5.50,
              // ),
              SelectionBox(),
           ] 
         ),
         
        ),
      ),
  ),
));
}
