%script file to solve batch reactor problem
%initializations
global k1 k2 k3 k4 k5 k6;
k1 = 1; k2 = 2; k3 = 2; k4 = 2; k5 = 3; k6 = 4;
tspan = [0 10];
c0 = [0.5 0 0 0.5];

%integrate ODE
[t,c] = ode45(@reaction,tspan,c0);

%create graph
plot(t,c(:,1),'r-',t,c(:,2),'b--',t,c(:,3),'g.-',t,c(:,4),'y');