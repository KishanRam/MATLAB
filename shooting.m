global Da

%Initialize
Da = 1; 
phi1 = 1; %Boundary condition
p0(1) = 1; %First guess of initial condition
p0(2) = 0; %Initial condition of phi2
p1(1) = 2; %Second guess
p1(2) = 0; %Initial condition of phi2
xspan = [0 1];

%Solve system of ode's
[x phi] = ode45(@phif,xspan,p0);
n = length(phi);
err = phi(n) - phi1;
tol = 1e-5;

%Secant method search
while abs(err) > tol
    [x phi] = ode45(@phif,xspan,p1);
    
    n = length(phi);
    errnew = phi(n)-phi1;
    
    oldp1 = p1(1);
    p1(1) = p1(1) - errnew*(p1(1)-p0(1))/(errnew-err);
    p0(1) = oldp1;
    err = abs(errnew);
end

plot(x,phi(:,1));

