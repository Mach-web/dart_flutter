/*
https://dart.dev/language/variables
*/
late String description;
void main(){
  var name = "Bob";
 /*The type of the name variable is inferred to be String,
  but you can change that type by specifying it. If an object 
  isn't restricted to a single type, specify the Object type 
  (or dynamic if necessary).*/
  Object names = "Mark";
  String name1 = "Mach";
  print("var: $name Object: $names String: name1");

  // Null safety
  String? name2;
  int? number;
  print("Nullable String: $name2 Nullable integer: $number");
  String name3;
  // The code below raises an error
  // print("Non nullable variables: $name3");
  description = "This is a late variable";
  print("Late variable: $description");

  // Final and constant variables
  final myConstant = "MachTechie";
  const int myConstNo = 10000 * 3;
  // myConstant = "Mach";
  var foo = const [];
  const bar = const [];
  const baz = []; // Equivalent to `const []`
  // bar = [42, 33];
  // baz = [1, 3, 4];
  // This surprisingly works
  foo = [1, 3];
  print("Constants: $myConstant, $myConstNo, $baz");

  // Constants that use type checks
  var list = [1, 2, 5, 6, 3];
  const Object obj = 23;
  const intList = [obj as int];//Type cast
  const map = {if(obj is int) obj:"int"};
  const set = {if(intList is List<int>) ...intList};
  print("Constant Object: $obj, Type cast: $intList , Using is and collection if: $map ...and a spread: $set");
}
