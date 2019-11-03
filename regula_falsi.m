%Regula falsi
Err = 1;
Tol = 1e-20;
xlb = 0;
xub = 1;
x(1) = 0;
i = 2;

while Err > Tol
    xnew = xlb - ((givenfunc(xlb)*(xlb-xub))/(givenfunc(xlb)-givenfunc(xub)));
    x(i) = xnew;
    if givenfunc(xnew) < 0
        xlb = xnew;
    elseif givenfunc(xnew) > 0
        xub = xnew;
    end
    Err = abs(x(i) - x(i-1));
    i = i+1;
end
i
xnew