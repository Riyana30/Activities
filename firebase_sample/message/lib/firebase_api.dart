

import 'dart:async';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

class FirebaseApi {
  final firebasemessaging =FirebaseMessaging.instance;
  Future<void> initNotification()async{
    await firebasemessaging.requestPermission();
    final fcmtocken=await firebasemessaging.getToken();
    print('Tocken:$fcmtocken');
    initPushNotification();
  }
  void handlemessage(RemoteMessage? message, dynamic navigatorKey){
    if(message==null)return;
    navigatorKey.currentState?.pushNamed(arguments: message, '/mynoti');
  }
  Future initPushNotification()async{
    FirebaseMessaging.instance.getInitialMessage().then(handlemessage as FutureOr Function(RemoteMessage? value));
    FirebaseMessaging.onMessageOpenedApp.listen(handlemessage as void Function(RemoteMessage event)?);
  }
}