(int, int) swap((int, int) record){
    var (a, b) = record;
    return (b, a);
}

void main(){
  var record = ('first', a:1, b:true, 'last');
  print("Example record: $record");
  (String, int, double) records;
  records = ('A String', 23, 3.174);
  print("Record initialization: $records");
}
