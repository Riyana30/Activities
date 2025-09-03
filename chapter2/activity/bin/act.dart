void main(List<String>arguments){
  try{
    throwException();
  
  }on CustomEcception catch(e){
    print(e.cause);
  }
}

void throwException(){
  throw CustomEcception('This is my first custom exception');
}

class CustomEcception implements Exception{
  String cause;
  CustomEcception(this.cause);
}