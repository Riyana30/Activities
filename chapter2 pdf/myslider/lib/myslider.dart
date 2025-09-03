import 'package:flutter/material.dart';

class Myslider extends StatefulWidget{
  Myslider({super.key});

  @override
  State<Myslider> createState() => _Mysliderstate();
    // TODO: implement createState
    
  
}
class _Mysliderstate extends State <Myslider> {
  double _slidervalue=10.0;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body:

      
       Slider(value: _slidervalue,min: 0.0,max: 100.0,divisions: 100,
       label: _slidervalue.toStringAsFixed(0) ,onChanged: (double newvalue){
        setState(() {
          
          _slidervalue=newvalue;
        });
      }),




    );
  }
}