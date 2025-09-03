import 'package:flutter/material.dart';
class Mycolumn extends StatelessWidget{
  Mycolumn({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text('Aitrich'),

      ),
      body: Center(
        
        child:
        
         Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.home,size: 50),
            SizedBox(height: 20),
            Icon(Icons.search,size: 50),
            SizedBox(height: 20),
            Icon(Icons.notifications,size: 50,),
          ],
        ),


              ),

    );
  }
}