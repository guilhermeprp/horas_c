import 'package:find_dropdown/find_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:uniphc/app/modules/atividades/widgets/aba_navegacao/aba_navegacao_widget.dart';

import 'home_controller.dart';

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({Key key, this.title = "Home"}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeController> {
  //use 'controller' variable to access controller

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo[900],
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(43),
        child: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
      ),
      drawer: AbaNavegacao(),
      body: Stack(
        children: <Widget>[
          Center(
            child: Column(
              children: <Widget>[
                Container(
                    margin: EdgeInsets.only(top: 10),
                    child: Image.asset('assets/images/logo_app.png')),
              ],
            ),
          ),
          Center(
            child: Container(
                margin: EdgeInsets.only(bottom: 75),
                child: Text('Selecione seu Curso:',
                    style: TextStyle(fontSize: 22, color: Colors.white))),
          ),
          Center(
            child: Container(
              margin: EdgeInsets.only(top:10),
              padding: EdgeInsets.only(left: 30, right: 30, top: 15),
              child: FindDropdown(

                // Alterar tabela de items do dropdown
                items: ["Análise de Sistemas", "Ciência da Computação", "Enfermagem", "Jornalismo"],
                onChanged: (String item) => print(item),
                selectedItem: "Ciência da Computação",
                validate: (String item) {
                  if (item == null)
                    return "Required field";
                  // else if (item == "Brasil")
                  //   return "Invalid item";
                  else
                    return null; //return null to "no error"
                },
              ),
            ),
          ),
          Container(
            alignment: Alignment.center,
            margin: EdgeInsets.only(top:250),
            child: FloatingActionButton(
              
              onPressed: (){ Navigator.pushNamed(context, '/Atividades'); }, 
              child: Icon(Icons.done, size: 50),
              ),
          )
        ],
      ),
    );
  }
}
