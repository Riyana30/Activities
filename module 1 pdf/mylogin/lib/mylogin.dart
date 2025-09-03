import 'package:flutter/material.dart';
class Mylogin extends StatelessWidget{
Mylogin({super.key});

@override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purpleAccent,
        title: Text(
          "LOGIN",
          style: TextStyle(color: Colors.black,
          fontSize: 25,
          fontWeight: FontWeight.bold),),
          centerTitle: true,
      ),
      body:Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: TextField(
              decoration: InputDecoration(
                labelText: 'Username',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
              ),
            ),
            ),
            SizedBox(height: 20.0),
            Padding(padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: TextField(
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Password',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
              ),
            ),),
            SizedBox(height: 40.0),
            ElevatedButton(onPressed: (){
              print('Login Successfully');
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),

              ),
              padding: EdgeInsets.symmetric(horizontal: 30,vertical: 15),
            ), child: Text(
              'LOGIN',
              style: TextStyle(color: Colors.black,
              fontWeight: FontWeight.bold),)),

              SizedBox(height: 60),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "dont have an account",
                    style: TextStyle(color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),),
                    SizedBox(width: 20.0),
                    TextButton(onPressed: (){
                      print("register clicked");
                    }, child: Text("Register",style: TextStyle(color: Colors.black,fontSize: 15,fontWeight: FontWeight.bold),),)
                    
                ],
              )


          ],
        ),
      ) ,
    );
  }
}