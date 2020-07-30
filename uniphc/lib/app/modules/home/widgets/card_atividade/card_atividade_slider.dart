import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

class SliderWidget extends StatefulWidget {
  final double max;  

  const SliderWidget({Key key, this.max}) : super(key: key);
  
  @override
  _SliderWidgetState createState() => _SliderWidgetState();
}

class _SliderWidgetState extends State<SliderWidget> {
  double value = 0;
  DateTime _dateTime = DateTime.now();

  @override
  Widget build(BuildContext context) {
      // if ( max >100) {}; 
    return Slider(
      min: 0,
      max: 60,
      label: '$value',
      divisions: 30,
      inactiveColor: Colors.blueGrey[400],
      activeColor: Colors.indigo,
      value: value,
      onChanged: (newValue){
        setState(() => value = newValue 
         );
         print("$value");
      },
    );
  }

}
