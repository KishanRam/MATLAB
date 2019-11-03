%Input
T = input ('Enter T(K) : ');
Tc = input ('Enter Tc (K) : ');
Pc = input ('Enter Pc (atm) : ');
V = input ('Enter Specific Volume (L/mole) : '); 
%Can use \n to force input on the next line
%Calculations
R = 0.0821;
a = 1/9/(nthroot(2,3)-1)*R^2*Tc^2.5/Pc;
b = (nthroot(2,3)-1)/3*R*Tc/Pc;
P = R*T/(V-b) - a/(sqrt(T)*V*(V+b));
P


