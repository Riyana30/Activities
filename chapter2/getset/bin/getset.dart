import 'dart:io';

import 'package:getset/getset.dart' as getset;



void main(){
  print('');print('');print('');print('');
  print('Enter the time:');
  var t=stdin.readLineSync();
  var item=items();
  item.Time=t!;
  print('Time is ${item.Time}');
  main();

}
class items{
  late String time;
  set Time(String time){
    this.time=time;
  }
  String get Time{
    return time;
  }
}