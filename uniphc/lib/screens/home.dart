import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  // MyHomePage({this.title});
  
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String nomecurso = 'Ciência da Computação';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(      
        centerTitle: true,
        title: Text('Unip HC'),
      ),
     
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            
            LogoUnipImageAsset(),
            
            Text(
              'Escolha seu Curso:',
            ),
            

                                       
              DropdownButton<String>(
                value: nomecurso,
                underline: Container(
                  height: 2,
                  color: Colors.blue,
                ),
                onChanged: (String newValue) {
                  setState(() {
                    nomecurso = newValue;
                  });
                },

                items: <String>['Ciência da Computação', 'Analise de Sistemas', 'Jornalismo', 'Enfermagem']
                .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );  
        })  
      .toList(),
            ),  
            
          ],  
        ),
      ),
      
      floatingActionButton: FloatingActionButton.extended(
        label: Text('Confirmar'),
        onPressed: null,
        backgroundColor: Colors.green,
        icon: Icon(Icons.thumb_up),
        
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      );
  }
}

class LogoUnipImageAsset extends  StatelessWidget {
  @override
  Widget build(BuildContext context) {
    AssetImage assetImage = AssetImage('images/logo-unip-home.png');
    Image image = Image(image: assetImage, width: 250, height: 265,);
    return Container( child: image,);
  }
}
  
