import 'package:flutter/material.dart';

class Mydrop extends StatefulWidget{
  Mydrop({super.key});
  @override
  State<Mydrop> createState() => _Mydropstate();
    // TODO: implement createState
   
  }
 class _Mydropstate extends State <Mydrop>{
  String? _selecteditem='item 1';
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.yellow,),
      body: 
      
      Center(
        child: DropdownButton(value: _selecteditem,
        items: ['item 1', 'item 2', 'item 3','item 4'].map<DropdownMenuItem<String>>
        ((String value){
          return DropdownMenuItem<String>(value: value,child: Text(value),);
        }).toList(),
         onChanged: (String? newvalue){
          setState(() {
            _selecteditem=newvalue;
          });
         }),
      ),

    );
  } 
  
 }