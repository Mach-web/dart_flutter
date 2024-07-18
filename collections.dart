void main(){
    var list = [1, 2, 3,];
    var constantList = const ['hello', 'world'];
    print("Example list: $list Example constant list: $constantList");
    print("List length: ${list.length} Index 1 value: ${list[1]}");
    var elements = {"hydrogen", "helium", "helium", "lithium", "berilium"};
    var emptySet = <String>{};
    print("Sets: $elements Empty set: $emptySet");
    emptySet.add('flourine');
    emptySet.addAll(elements);
    print("Add elements: $emptySet");

}