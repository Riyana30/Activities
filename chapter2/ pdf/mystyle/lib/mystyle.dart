import 'package:flutter/material.dart';
class Mystyle extends StatelessWidget{
  Mystyle({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text('FONT'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Aitrich",style: TextStyle(
              fontSize: 50,
              fontFamily: 'IrishGrover',
            ),),
          ],
        ),
      ),
    );
  }
}