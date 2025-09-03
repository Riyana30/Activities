import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
class phone extends StatelessWidget{
  phone({super.key});
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: Text('Phone number'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
            children: [TextField(keyboardType: TextInputType.name,
             decoration: InputDecoration(border: OutlineInputBorder(),labelText: 'Name'),
            
            ),SizedBox(height: 20,),
            TextField(
              keyboardType: TextInputType.number,
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
                // LengthLimitingTextInputFormatter(10)
              ],decoration: InputDecoration(
                border: OutlineInputBorder(),labelText: 'Phone NUmber',
                counterText: '',
              ),maxLength: 10,
            )
            ]
          ),
        ),
      ),
    );
  }

}