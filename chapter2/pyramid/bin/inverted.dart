void main(List<String> arguments){
  var y;
     for(int i = 1 ; i<=6; i++){
       y='';
        for(int j = i; j <2*i ;j++) {
           y += ' ';
        }
      for(int k= 0; k <6-i ;k++){
         y += ' ';
          
           y += '*';
    }
      print(y);
}
}