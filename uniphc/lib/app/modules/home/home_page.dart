import 'package:flutter/material.dart';
import 'package:uniphc/app/modules/home/home_bloc.dart';
import 'package:uniphc/app/modules/home/home_module.dart';

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({Key key, this.title = "Home"}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final bloc = HomeModule.to.bloc<HomeBloc>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      
      appBar: AppBar( 
      
          title: Text('data'),
          
         backgroundColor:
          Colors.deepPurple[500], 
          

          // LinearGradient(
          //   colors: [Colors.indigo, Colors.indigoAccent])
          // ),         
          ),
      
      body: Column(
        children: <Widget>[
          TextField(
            controller: bloc.controller,
          )

        ],
      ),
    );
  }
}
