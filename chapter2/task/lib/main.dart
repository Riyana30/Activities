import 'package:flutter/material.dart';
import 'package:task/log.dart';

void main(){
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: '/',
    routes: {
      '/':(context)=>Login(),
      '/home':(context)=>Homepage(),
    },
  ));
}