import 'package:flutter/material.dart';

class Mydialogue extends StatelessWidget{
  Mydialogue({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text(
          "Aitrich",
          style: TextStyle(color: Colors.black),
          ),
          centerTitle: true,
      ),
      body: Center(
        child: 
        
        ElevatedButton(onPressed: (){
          showDialog(context: context,
           builder: (BuildContext context){
            return AlertDialog(
              title: Text('Dialog Title'),
              content: Text('This is the content of the dialog'),
              actions: <Widget>[
                TextButton(child: Text('cancel'),onPressed: (){
                  Navigator.of(context).pop();
                },),
                TextButton( child: Text('ok'),onPressed: (){
                  Navigator.of(context).pop();
                },) 
              ],
            );
           });
        }, child: Text('Show Dialog'),
        ),

        
      ),
    );
  }
}