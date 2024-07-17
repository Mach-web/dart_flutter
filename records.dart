(int, int) swap((int, int) record){
    var (a, b) = record;
    return (b, a);
}

(String name, int age, String color) userInfo (Map<String, dynamic> json){
  return (json['name'] as String, json['age'] as int, json['color'] as String);
}
void main(){
  var record = ('first', a:1, b:true, 'last');
  print("Example record: $record \t ${record.$1} \t ${record.a} \t ${record.b} \t ${record.$2}");
  (String, int, double) records;
  records = ('A String', 23, 3.174);
  print("Record initialization: $records");
  ({int x, int y, double z}) recordX = (x: 1, y: 2, z: 1.345);
  (int x, String y) recordY = (1, "Hello World");
  print("recordX: $recordX \nrecordY: $recordY");

  (num, Object) recordZ = (2, "hello");
  var first = recordZ.$1; // Static type `num`, runtime type `int`.
  var second = recordZ.$2; // Static type `Object`, runtime type `String`
  
  (int x, int y, String z) recordA = (2, 3, "Hello");
  (int a, int b, String C) recordB = (2, 3, "Hello");
  print("(int x, int y, String z) == (int a, int b, String C) is ${recordA == recordB}"); 

  ({int x, int y, int z}) point = (x: 1, y: 2, z: 3);
  ({int r, int g, int b}) colour = (r: 1, g: 2, b: 3);

  print("({int x, int y, int z}) == ({int r, int g, int b}) is ${point == colour}"); // Prints 'false'. Lint: Equals on unrelated types.

  final json = <String, dynamic>{
    'name': "MachTechie",
    'age':21,
    'color':'blue',
  };

  var(name, age, color) = userInfo(json);
  print("Working with json: $json $name, $age, $color");

}
