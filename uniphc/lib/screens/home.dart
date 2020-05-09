import 'package:flutter/material.dart';
import 'package:uniphc/screens/activities.dart';

class MyHomePage extends StatefulWidget {
  // MyHomePage({this.title});
  
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String nomecurso = 'Ciência da Computação';
  var _selectedColor = Colors.black;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo[900],
     
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            
            //logohome
            LogoUnipImageAsset(),
            
            //texto acima da selection box
            Text(
              'Escolha seu Curso:',
              style: TextStyle(
                fontSize: 17,
                color: Colors.white,
                height: 2,
                ),
            ),
            
                //selection box
                    new Container(
                      padding: EdgeInsets.symmetric(horizontal: 10,vertical: 0),
                decoration: new BoxDecoration(
                  
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(9.0),
                            
                    ),

                child: DropdownButton<String>(
                
                value: nomecurso,
                underline: Container(
                  height: 2,
                  color: Colors.lightBlueAccent,
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
                
                child: Text(value,
                style: TextStyle(
                fontSize: 20,
                color: _selectedColor,
                ),),
              );  
        })                  
      .toList(),
            ),  
            
                    ),                   
          ],  
        ),
      ),
      
      //botão confirmar
      floatingActionButton: FloatingActionButton.extended(
        label: Text('Confirmar'),
        onPressed: () {
                
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => MyActivities())
          );

          } , 
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
    Image image = Image(image: assetImage, width: 250, height: 310,);
    return Container( child: image,);
  }
}
  
