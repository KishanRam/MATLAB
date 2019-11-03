%CHE 372 Recitation 1
%Kishan Ramachandran
%1/17/17

clear;
clc;

%Define initial values 
%Units of K, initial values: mmols/s
k1 = 1.0;
k_1 = 0.5;
k2 = 1.0;
k3 = 0.1;
a0 = 5000;
c0 = 4000;
b0 = 0; d0 = 0; e0 = 0;

conc0 = [a0 b0 c0 d0 e0]; %define initial conditions

n = 1000;
t_final = 100; %in seconds
t_interval = linspace(0,t_final,n);

%X(1) is A, x(2) is B etc.

dConc_dt = @(t,x)[(-k1*x(1)+k_1*x(2)); (k1*x(1)-k_1*x(2)-k2*x(2)*x(3)-k3*x(2));
    (-k2*x(2)*x(3));(k2*x(2)*x(3));(k3*x(2))];

%Ode syntax: function, x variable, y variable
[t,x] = ode45(dConc_dt, t_interval, conc0);

%Plot ode solution
figure(1)
plot(t_interval, x)
%plot(t_interval, x(:,1),t_interval, x(:,2),t_interval, x(:,3),t_interval,
%x(:,4),t_interval, x(:,5))
legend('[A]','[B]','[C]','[D]','[E]');
xlabel('time(s)');
ylabel('concentration(mmol/L)');











