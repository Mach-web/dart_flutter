(int, int) swap((int, int) record){
    var (a, b) = record;
    return (b, a);
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
  print("(int x, int y, String z) == (int a, int b, String C) = (2, 3, 'Hello') is ${recordA == recordB}"); 
}
