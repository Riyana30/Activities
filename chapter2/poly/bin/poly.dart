

void main(List<String> arguments) {
  animal a;
  a=dog();
  a.makesound();
  a=cat();
  a.makesound() ; 
}
class animal{
  void makesound(){
print('Animal makes sound');
  }
}
class dog extends animal{
  void makesound(){
    print('Dog barks');
  }
}
class cat extends animal{
  void makesound(){
    print('cat meows');
  }
}
