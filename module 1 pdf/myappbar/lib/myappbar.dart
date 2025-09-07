import 'package:flutter/material.dart';

class newscreen extends StatefulWidget {
  const newscreen({super.key});
  @override
  State<StatefulWidget> createState()=>_new();
}
  class _new extends State<newscreen>{

  

  @override
  Widget build(BuildContext context) {
    String? isselected='male';
    
    return  Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text('Dropdown'),
      ),
      body:Center(
        child: DropdownButton(value: isselected,items: ['male','female'].map(toElement), onChanged: onChanged),
      )
    );
  }
}