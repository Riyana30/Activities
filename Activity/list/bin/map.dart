void main(){
  Map<String,String>car={
    'Brand': 'BMW',
    'Model': 'xs',
    'Color': 'Black',
  };
  print('keys :');
  car.forEach((key , value){
    print(key);
  });
    print('Values :');
  car.forEach((key , value){
    print(value);
  });
    print('key and value together :');
  car.forEach((key , value){
    print('$key:$value');
  });
}