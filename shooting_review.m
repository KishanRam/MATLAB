clear all
global Da

phi1 = 1; %BC of phi1(1) = 1
p0(1) = 1; %Guess 1 of phi1(0)
p0(2) = 0; %BC of phi2(0) = 0;
p1(1) = 2; %Guess 2
p1(2) = 0; %BC 
xspan = [0 1];
Da = 1;
Tol = 1e-4;

[x,T] = ode45(@phif,xspan,p0);
err = abs(T(end) - phi1);

while err > Tol
    [x,T] = ode45(@phif,xspan,p1);
    newerr = abs(T(end)-phi1);
    
    old = p1(1);
    p1(1) = p1(1) - newerr*((p1(1)-p0(1))/(newerr-err));
    p0(1) = old;
    
    err = newerr;
end

plot(x,T);
    
    
    
    