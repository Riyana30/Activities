void main()async{
  await for (var count in countstream(8)){
    print(count);
  }
}
Stream<int> countstream(int max)async*{
  for(int i=0;i<=max;i++){
    await Future.delayed(Duration(seconds: 1));
    yield i;
  }
}