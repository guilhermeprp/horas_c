import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:uniphc/Controller/atividades_controller.dart';

class CustomSlider extends StatefulWidget {
    @override
  _CustomSliderState createState() => _CustomSliderState();
}

class _CustomSliderState extends State<CustomSlider> {
  Atividade atividade = new Atividade();
  double sliderValue = 0;


  @override
  Widget build(BuildContext context) {
    
    print('${atividade.nome}');

        return Slider(
          min: 0,
          max: 100,
      value: sliderValue,
      onChanged: (newValue) { 
        setState(() {
          sliderValue = newValue;
          
        });
       },
      
    );
  }

}


