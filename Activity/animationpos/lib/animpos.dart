import 'package:flutter/material.dart';

class animatedpos extends StatefulWidget{
  @override
  State<StatefulWidget> createState()=>_animatedpposstate();
}
class _animatedpposstate extends State<animatedpos>{
  bool _ismoved=false;
  bool _islarge=false;

  void _toggleposition(){
    setState(() {
      _ismoved=!_ismoved;
      _islarge=!_islarge;
    });
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text('AnimatedPositioned Example'),centerTitle: true,
      ),
      body: Center(
        child: Stack(
          children: [
            AnimatedPositioned(curve: Curves.easeInOut,left: _ismoved?200:50,top: _ismoved?400:
            50, duration: Duration(seconds: 1),child: GestureDetector(
              onTap: _toggleposition,
              child: AnimatedContainer(duration: Duration(seconds: 1),width: _islarge?150:100,height: _islarge?150:100,color: Colors.blue,child: Center(
                child: Text('Tap me',style: TextStyle(color: Colors.white,fontSize: 18),),
              ),),
            ),)
          ],
        ),
      ),
    );
  }
}