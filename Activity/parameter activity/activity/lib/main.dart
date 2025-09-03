import 'package:activity/myapp.dart';
import 'package:flutter/material.dart';


void main(){
  runApp(MaterialApp(
       
    debugShowCheckedModeBanner: false,
    initialRoute: '/',
    routes: {
      '/':(context)=>homestate(),
      '/pro':(context)=>profile1()
     
    },
  ));
}