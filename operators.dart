void main(){
    int a, a_copy, b, c;
    assert(6 + 5 == 7);
    a = 12;
    a_copy = a;
    b = ++a;
    c = a_copy++;
    print("a = $a \nb == ++a = $b\n c == a++ = $c");
}