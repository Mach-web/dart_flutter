void main(){
  var name = "Bob";
 /*The type of the name variable is inferred to be String,
  but you can change that type by specifying it. If an object 
  isn't restricted to a single type, specify the Object type 
  (or dynamic if necessary).*/
  Object names = "Mark";
  String name1 = "Mach";
  print("var: $name Object: $names String: name1");
}