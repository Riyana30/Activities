import 'package:fibnocci/fibnocci.dart' as fibnocci;

void main(List<String> arguments) {
  var x =0;
  print('$x');
  var y= 1;
  print('$y');
  var z;
  var i;
 for(i=0;i<10;i++)
 {
 
  z=x+y;
  x=y;
  y=z;
  print('$z');
 }

}
