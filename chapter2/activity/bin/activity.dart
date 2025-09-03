import 'package:activity/activity.dart' as activity;

void main(List<String> arguments) {
  print('CASE 1:');
  try{
    int result=10~/0;
    print('The result is $result');
  }on IntegerDivisionByZeroException{
    print('Cannot divided by zero');
  }
print("");
print("CASE 2:");
try{
  int result=10~/0;
  print("The result is $result");

}catch(e){
  print('The exception throw is $e');
}
print("");
print("CASE 3:");
try{
  int result=10~/0;
  print("The result is $result");

}catch(e){
  print('The exception throw is $e');
}
finally{
  print('This is final clause');
}


}

