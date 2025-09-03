import 'package:sum/sum.dart' as sum;

void main(List<String> arguments) {
for(int i=6;i<=1;i--){
    var y='';
    for(int k=0;k<(6-i);k++){
        y+=' ';
    }
    for(int j=0;j<i;j++){
        y+='* ';
    }
    print(y);
}
}
