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
}