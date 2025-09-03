import 'package:asyn/asyn.dart' as asyn;

void main(List<String> arguments) 
async{
  print("Task 1 completed");

   await Future.delayed(Duration(seconds: 3),(){
    print("Task 2 completed");
  });
  print("Task 3 complete");
}
                              