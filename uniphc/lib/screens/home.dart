import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  // MyHomePage({this.title});

  // final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(      
        title: Text('UnipHC'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Escolha seu Curso:',
            ),
            DropdownButton(
              items: null,
              onChanged: null
            ),
            
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        label: Text('Confirmar'),
        onPressed: null,
        tooltip: 'Increment',
        backgroundColor: Colors.green,
        icon: Icon(Icons.thumb_up),
        
      ), 
      );
  }
}
