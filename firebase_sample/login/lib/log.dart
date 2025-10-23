
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:login/home.dart';
import 'package:login/signup.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
    final TextEditingController _passwordController = TextEditingController();
    final FirebaseAuth _auth = FirebaseAuth.instance;

    bool _obscurePassword = true; 


Future<void> _login()async{
  try{
    await _auth.signInWithEmailAndPassword(
      email: _emailController.text.trim(),
      password: _passwordController.text.trim(),
      );
      Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context)=>  HomePage())
        );
  }catch(e){
    ScaffoldMessenger.of(context).showSnackBar(          
      SnackBar(content: Text("Login Failed:${e.toString()}"))
    );
  }

}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 3, 57, 101),
        title: Text("Login Page",
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
                      _obscurePassword = !_obscurePassword;    // toggle state
                    });
                  }, icon: Icon(_obscurePassword ? Icons.visibility_off : Icons.visibility))
               
              ),
            ),
),
SizedBox(
  height: 30,
),
ElevatedButton(
  onPressed: _login,
   child: Text("save")),
   TextButton(onPressed: (){
    Navigator.push(
      context,MaterialPageRoute(builder: (context)=> Signup()));
   }, child: Text("donot have an account ? Sign UP"))

        ],
      ),
    );
  }
}
