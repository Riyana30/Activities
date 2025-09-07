import 'package:empetz/empetz.dart';
import 'package:empetz/favcart.dart';
import 'package:empetz/pets.dart';

import 'package:flutter/material.dart';

void main(){
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: '/',
    routes: {
      '/':(context)=>empetz(),
      '/login':(context)=>login(),
      '/signup':(context)=>reg(),
      '/homepage':(context)=>home(),
      '/profile':(context)=>profile1 (),
      '/fav':(context)=>Favourite(),
      '/report':(context)=>reporting(),
      '/adcart':(context)=>cart(),
      '/chtai':(context)=>ai(),
      '/settingss':(context)=>settings(),
      '/pet':(context)=>pets(),
      '/sell':(context)=>seller1(),
      '/post':(context)=>postpet(),
      '/chatpage':(context)=>chat(),
      '/repos':(context)=>repo()
      
   
    
    },
  ));
}