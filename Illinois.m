%Illinois
Err = 1;
Tol = 1e-20;
xlb = 0;
xub = 1;
x(1) = 0;
i = 2;
lbcount = 0; ubcount = 0;

while Err > Tol
    if lbcount >= 2
        xnew = xlb - ((givenfunc(xlb)*(xlb-xub))/((givenfunc(xlb)/2)-givenfunc(xub)));
    elseif ubcount >= 2
        xnew = xlb - ((givenfunc(xlb)*(xlb-xub))/(givenfunc(xlb)-(givenfunc(xub)/2)));
    else
        xnew = xlb - ((givenfunc(xlb)*(xlb-xub))/(givenfunc(xlb)-givenfunc(xub)));
    end
    x(i) = xnew;
    if givenfunc(xnew) < 0 
        xlb = xnew;
        ubcount = 0; lbcount = lbcount + 1;
    elseif givenfunc(xnew) > 0
        xub = xnew;
        lbcount = 0; ubcount = ubcount + 1; 
    end
    Err = abs(x(i) - x(i-1));
    i = i+1;
end
i
xnew