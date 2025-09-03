import 'package:flutter/material.dart';
class mycheck extends StatefulWidget{
  mycheck({super.key});
  @override
  State<mycheck> createState()=>_Mycheckboxstate(); 
    // TODO: implement createState
    
  }

class _Mycheckboxstate extends State<mycheck> {
  bool isChecked =false;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.green,
      title: Text('Checkbox'),
      centerTitle: true,),
      body: Center(
        child:
        
         Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Checkbox(value: true, onChanged: ( value){
                           
                },),
                 Text('spanish',style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
              ],
            ),
           
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              
              children: [
                Checkbox(value: false, onChanged: (value){}),
                 Text('English',style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),)
              ],
            ),
           
          ],
        ),

        
      ),

    );
  }
}