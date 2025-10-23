
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:login/home.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
   final TextEditingController _emailController = TextEditingController();
    final TextEditingController _passwordController = TextEditingController();
    final FirebaseAuth _auth = FirebaseAuth.instance;

    bool _isPasswordVisible = false; // state to manage password visibility


Future<void> _SignUp()async{
  try{
    await _auth.createUserWithEmailAndPassword(
      email: _emailController.text.trim(),
      password: _passwordController.text.trim(),
      );
      Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context)=>  HomePage())
        );
  }catch(e){
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("SignUp Failed:${e.toString()}"))
    );
  }

}
  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 3, 57, 101),
        title: Text("SignUp Page",

        style: TextStyle(
          color: Colors.white
        ),
        ),
        centerTitle: true,
      ),
      body: Column(mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _emailController,
              decoration: InputDecoration(
                labelText: "Email"
               
              ),
              keyboardType: TextInputType.emailAddress,
            ),
          ),
          SizedBox(
            height: 20,
          ),
Padding(
  padding: const EdgeInsets.all(8.0),
  child: TextField(
    controller: _passwordController,
              decoration: InputDecoration(
                labelText: "Password",
                suffixIcon: IconButton(
                 
                  onPressed: (){
                    setState(() {
                      _isPasswordVisible = !_isPasswordVisible;    
                    });
                  }, icon: Icon(_isPasswordVisible ? Icons.visibility_off : Icons.visibility))
               
              ),
              obscureText: _isPasswordVisible,
            ),
           
),
SizedBox(
  height: 30,
),
ElevatedButton(
  onPressed: _SignUp,
   child: Text("Signup")),
   
        ],
      ),


    );
  }
}