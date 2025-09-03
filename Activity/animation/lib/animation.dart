import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Animatedposition extends StatefulWidget{
  @override
  State<StatefulWidget> createState() =>_animatedstate();
}
class _animatedstate extends State<Animatedposition>{
  bool _ismoved=false;
  
  void _toggleposition(){
    setState(() {
      _ismoved=!_ismoved;
    });
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text('AnimatedPositioned Example'),centerTitle: true,
      ),body: Center(
        child: Stack(
          children: [
            AnimatedPositioned(left: _ismoved?200:50,top: _ismoved?400:50,curve: Curves.easeInOut, duration: Duration(seconds: 1),child: GestureDetector(
              onTap: _toggleposition,
              child: Container(
                width: 100,
                height: 100,
                color: Colors.blue,
                child: Center(
                  child: Text('Tap me',style: TextStyle(color: Colors.white,fontSize: 18),),
                ),
              ),
            ),)
          ],
        ),
      ),
    );
  }
}