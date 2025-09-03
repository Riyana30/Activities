import 'package:acti/acti.dart' as acti;

void main(List<String> arguments) {
 var li=[1,'kkk',330];

 print(li);
 var li1=[];
 li1.add("One");
 li1.add("Two");
 print(li1);
 var li2=List.filled(5, 0);
 li2[3]=6;
 print(li2);
 var li3=[];
 for(var i=0;i<5;i++){
  li3.add("The current index is $i");
 }
 for (var x in li3){
  print(x);
 }
}
