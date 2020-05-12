import 'package:flutter/material.dart';
import 'package:uniphc/widgets/activities_tile.dart';

class MyActivities extends StatefulWidget {
  @override
  _MyActivitiesState createState() => _MyActivitiesState();
}

class _MyActivitiesState extends State<MyActivities> {
  @override
  Widget build(BuildContext context) {
    //appbar
    return Scaffold(
      backgroundColor: Colors.indigo[900],
      appBar: AppBar(
        title: Text('UNIP HC'),
        backgroundColor: Colors.indigo[600],
        centerTitle: true,
      ),

      //lista
      body: Stack(
        children: <Widget>[
           ActivitiesTile(),
        FloatingActionButton.extended(
          label: Text('Punheta o Like'),
          
          onPressed: null,
          ),
        ],
      ),
          floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat, 
    );
  }
}
