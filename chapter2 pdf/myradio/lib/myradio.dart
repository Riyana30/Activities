import 'package:flutter/material.dart';
class Myradio extends StatefulWidget{
  Myradio({super.key});

  @override
  State<Myradio> createState()=> _MyradioState(); 
    // TODO: implement createState
    
  }
  class _MyradioState extends State<Myradio>{
    int _selectedValue=1;
    @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.orange,title: Text('Radio',style: TextStyle(fontSize: 20),),centerTitle: true,),
      body: Center(
        child: 
        
        Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('Choose an option:'),
            SizedBox(height: 10),
            RadioListTile<int>(title:Text('Option 1'),
            value:  1, groupValue: _selectedValue,
             onChanged: (int? value){
              setState(() {
                _selectedValue=value!;
              });
            },),
            RadioListTile<int>(title: Text('Option 2'),
            value: 2, groupValue: _selectedValue,
             onChanged: (int? value){
              setState(() {
                _selectedValue=value!;
              });
            })
          ],
        ),
      ),


    );
  }
  }
  

  
