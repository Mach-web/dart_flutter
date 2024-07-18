void main(){
    var list = [1, 2, 3,];
    var constantList = const ['hello', 'world'];
    print("Example list: $list Example constant list: $constantList");
    print("List length: ${list.length} Index 1 value: ${list[1]}");
    var elements = {"hydrogen", "helium", 'oxygen', "helium", "lithium", "berilium"};
    var emptySet = <String>{};
    print("Sets: $elements Empty set: $emptySet");
    emptySet.add('flourine');
    emptySet.add('oxygen');
    emptySet.addAll(elements);
    print("Added elements to a set: $emptySet");

    var nobleGases = {
        18: 'argon',
        10: 'neon',
        2: 'helium',
    };
    var gifts = Map<String, String>();
    gifts['Easter'] = "watch";
    gifts['Xmas'] = 'flower';
    gifts['Mashujaa'] = 'necklace';
    print("A map: $nobleGases, Element 10: ${nobleGases[10]}");
    gifts['Xmas'] = 'bangle';
    print("Create map using map constructor: $gifts Length: ${gifts.length}");

    // spread operators
    var list1 = [6, 7, 8, null];
    var set1 = {1, 2, 3};
    print("Spread operators: ${[0, ...set1, 4, 5, ...list1]}");

    // control flow
    var life = false;
    var distance = 'closest';
    var no_of_planets = 9;
    var control_list = ['mercury', 'venus', if (life) 'earth', 
    'mars', 'jupiter', 'saturn', 'uranus', 'neptune', if(no_of_planets case 9) "pluto"];
    print("Use control structure in list: $control_list");
}