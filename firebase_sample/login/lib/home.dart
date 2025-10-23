import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:login/log.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> _logout(BuildContext context)async{
   await _auth.signOut();
   Navigator.pushReplacement(context,MaterialPageRoute(builder: (context)=> LoginPage()));

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 5, 58, 101),
        title: Text("HomePage",
        style: TextStyle(
          color: Colors.white,
        ),),
        centerTitle: true,
        actions: [
          IconButton(onPressed: ()=> _logout(context),
           icon: Icon(Icons.logout),
           color: Colors.white,)
        ],
      ),
      body: Center(child: Text("welcome! You Are Logged In.")),

    );
  }
}