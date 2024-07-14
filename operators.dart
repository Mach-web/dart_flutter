void main(){
    int a, a_copy, b, c;
    assert(6 + 5 == 7);
    a = 12;
    a_copy = a;
    b = ++a;
    c = a_copy++;
    print("a = $a \nb == ++a = $b\nc == a++ = $c");
    // Assign value to a
    a = 53;
    // Assign value to b if b is null; otherwise, b stays the same
    b ??= 53;
    print("a = $a, b ??= $b");

    final value = 0x22;
    final bitmask = 0x0f;
    assert((value & bitmask) == 0x02);

    bool isPublic = false;
    var visibility = 1 > 0 ? 'public' : 'private';
    print("Visibility(Short form if): $visibility");

    var Name;
    String PlayerName(String? name)  => name ?? 'Guest';
    var playerName = PlayerName(Name);
    print("if....null: $playerName");

    var sb = StringBuffer();
    sb.write('foo')
    ..write('bar'); // Error: method 'write' isn't defined for 'void'.

    /*
    querySelector('#confirm') // Get an object.
  ?..text = 'Confirm' // Use its members.
  ..classes.add('important')
  ..onClick.listen((e) => window.alert('Confirmed!'))
  ..scrollIntoView();
  */
  /*
  var button = querySelector('#confirm');
button?.text = 'Confirm';
button?.classes.add('important');
button?.onClick.listen((e) => window.alert('Confirmed!'));
button?.scrollIntoView();
*/
}