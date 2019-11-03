%secant
Err = 1;
Tol = 1e-10;
x(1) = 20;
x(2) = 30;
i = 3;

while Err > Tol
    x(i) = x(i-1) - ((x(i-1)-x(i-2))*(givenfunc(x(i-1))))/(givenfunc(x(i-1))-givenfunc(x(i-2)));
    Err = abs(x(i)-x(i-1));
    i = i+1;
end
i
x(i-1)
