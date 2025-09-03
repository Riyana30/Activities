void main(List<String>arguments){
var y;
  for(int i=6;i>=1;i--){
    y='';
    for(int k=0;k<6-i;k++){
      y+=' ';
    }
    for(int j=0;j<i;j++){
      y+='* ';
    }
    print(y);
  }
}