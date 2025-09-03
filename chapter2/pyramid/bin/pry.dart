void main(List<String>arguments){
  for(int i=1;i<6;i++){
    var y='';
    for(int j=(6-i);j>1;j--){
      y+=' ';
    }
    for(int j=1;j<=i;j++){
      y+='* ';
    }
print(y);
  }

}