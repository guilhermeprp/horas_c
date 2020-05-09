import 'package:flutter/material.dart';

class MyActivities extends StatefulWidget {
  
  @override
  _MyActivitiesState createState() => _MyActivitiesState();
}

class _MyActivitiesState extends State<MyActivities> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo[900],
      appBar: AppBar(
        backgroundColor: Colors.indigo[600],      
        centerTitle: true,
        title: Text('UNIP HC'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Card(
            Text('Atividade presencial'),

            ),
          
          
          
          ],
        ),
      ),
    );
  }
}
