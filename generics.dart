void main(){
    var str_list = <String> [];
    str_list.addAll(['Hello', "There", "!!!"]);
    str_list.add('42');
    print("The 42 had to be a string: $str_list");
    var names = <String>['Seth', 'Kathy', 'Lars'];
    var uniqueNames = <String>{'Seth', 'Kathy', 'Lars'};
    var pages = <String, String>{
    'index.html': 'Homepage',
    'robots.txt': 'Hints for web robots',
    'humans.txt': 'We are people, not machines'
    };
    print("Using generics for collection literals: $pages");
    var nameSet = Set<String>.from(names);
    print("Create set from list: $nameSet");
    var views = Map<int, String>();
    views[1] = 'first';
    views[2] = 'second';
    print("Create an empty dictionary then add values $views");

    print("names is List<String>: ${names is List<String>} uniqueNames is Set<String>: ${uniqueNames is Set<String>}");
}