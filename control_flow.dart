void main(){
  var year = 1800;
  if(year >= 2001){
    print("21st century");
  }
  else if(year >= 1901){
    print("20th century");
  }
  else{
    print("Before 20th century");
  }

  var flyByObjects = ['Mercury', 'Venus', "Saturn", "Pluto"];
  int limit = 0;
  for(final obj in flyByObjects){
    print("Flying object: $obj");
    limit += 1;
    if(limit > 2){
      break;
    }
  }

  for(int month = 1; month <= 12; month++){
    print("Month: $month");
  }
}