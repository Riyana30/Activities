void main(){
  List<List<int>>nestedlist=[
    [1,2,3],
    [4,5,6],
    [7,8,9],
  ];
  print('Complete nested list : ');
  print(nestedlist);
   print('First inner list : ');
  print(nestedlist[0]);
   print('Second element of the second inner list : ');
  print(nestedlist[1][1]);
   print('Elements in each inner list : ');
   for(var innerlist in nestedlist){
      print(innerlist);
   }
   print('Individual elements :');
   for(var innerlist in nestedlist){
    for(var element in innerlist){
      print(element);
    }
   }
  
}