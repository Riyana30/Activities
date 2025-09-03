import 'package:flutter/material.dart';
class Myregister extends StatelessWidget{
Myregister({super.key});

@override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        actions: [
          Icon(Icons.search)
        ],
        backgroundColor: Colors.purpleAccent,
        title: Text(
          "Registration form",
          style: TextStyle(color: Colors.black,fontSize: 25,fontWeight: FontWeight.bold),),
          centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(padding: EdgeInsetsGeometry.symmetric(horizontal: 20.0),
            child: TextField(
              decoration: InputDecoration(
                labelText: 'Username',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20.0),
                )
              ),
            ),),
            SizedBox(height: 20.0),
            Padding(padding: EdgeInsetsGeometry.symmetric(horizontal: 20.0),
            child: TextField(
              decoration: InputDecoration(
                labelText: 'Email',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20.0),
                )
              ),
            ),),
            SizedBox(height: 20.0),
            Padding(padding: EdgeInsetsGeometry.symmetric(horizontal: 20.0),
            child: TextField(
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Password',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
              ),
            ),
            ),SizedBox(height: 20.0),
            Padding(padding: EdgeInsetsGeometry.symmetric(horizontal: 20.0),
            child: TextField(
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Confirm password',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
              ),
            ),),
            SizedBox(height: 30),
            ElevatedButton(onPressed: (){
              print('button clicked');

            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.green,
              
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              padding: EdgeInsets.symmetric(horizontal: 20,vertical: 15),
            ),
            
             child: Text('Register',
             style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold),),),
          ],

        ),
      ),
       floatingActionButton: FloatingActionButton(onPressed: (){

       },
       backgroundColor: Colors.red,
       child: Icon(Icons.add,
       color: Colors.white,),),
    );
  }
}