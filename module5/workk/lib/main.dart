import 'package:flutter/material.dart';
import 'package:workk/myapp.dart';

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