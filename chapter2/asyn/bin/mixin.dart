mixin Swimmable{
  void swim(){
    print("Swimming....");
  }
}
mixin flyable{
  void fly(){
    print("Flying....");
  }
}
class Duck with Swimmable,flyable{}
class Fish with Swimmable{}

void main(){
  var duck=Duck();
  duck.swim();
  duck.fly();
  var fish=Fish();
  fish.swim();

}