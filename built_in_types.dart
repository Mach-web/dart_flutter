// import 'package:test/test.dart';

import 'dart:ffi';

var x = 1;
var hex = 0xDEADBEEF;

var y = 1.1;
var exponents = 1.42e5;

void main(){
    num x = 1;
    x += 2.5;
    print("Exponents: $exponents Num datatype: $x");
    // string into number
    String strNo = "1";
    var int_number = int.parse(strNo);
    var double_number = double.parse(strNo);
    var str_int_number = 856.toString();
    var str_double_number = 1.3567.toStringAsFixed(3);
    print("String: $strNo Integer: $int_number Double: $double_number int to string: $str_int_number Double to string: $str_double_number");
    // Bitwise operations
    assert((3 << 1) == 6); // 0011 << 1 == 0110
    assert((3 | 4) == 7); // 0011 | 0100 == 0111
    print("Bitwise operations(3|4): ${3|4}  (7&3): ${7&3}");
    const msPerSecond = 1000;
    const secondsUntilRetry = 5;
    const msUntilRetry = secondsUntilRetry * msPerSecond;
    print(msUntilRetry);
    var s = "String Interpolation";
    print("${s.toUpperCase()} is very handy. ${s.toLowerCase()} is very handy.");
    s = "String "
    "concatenation";
    print(s);
    s = "String " + "concatenation";
    print(s);
    s = """
This spans across 
multiple lines""";
    print(s);
    s = r"In a raw string even \n does not get special treatment.";
    print(s);
    // These work in a const string.
    const aConstNum = 0;
    const aConstBool = true;
    const aConstString = 'a constant string';

    // These do NOT work in a const string.
    var aNum = 0;
    var aBool = true;
    var aString = 'a string';
    const aConstList = [1, 2, 3];

    const validConstString = '$aConstNum $aConstBool $aConstString';
    // const invalidConstString = '$aNum $aBool $aString $aConstList';
    print(validConstString);

    var fullName = "";
    var unicorn = null;
    var error = 0/0;
    print("Check if empty: ${fullName.isEmpty} Is null? ${unicorn == null} is Nan? ${error.isNaN}");
}