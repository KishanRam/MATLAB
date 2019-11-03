%Starting intervals
a = input('Input lower bound');
b = input('Input upper bound');
maxerror = input('Enter the max allowable error');
i = 0; m = 0; err = 1;

while err > maxerror
    i = i+1;
    fa = givenfunc(a); fb = givenfunc(b);
    
    if fa*fb > 0
        b = m;
    elseif
        givenfunc(a)*givenfunc(m)