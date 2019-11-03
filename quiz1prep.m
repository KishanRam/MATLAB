% R = input('Enter R : ');
% r = input('Enter r : ');
% L = input('Enter L : ');
% y = input('Enter y : ');
% Vend = (pi()*r*(3*R-y)*y^2)/3/R;
% Vcyl = L*(sqrt(y*(2*R-y))*(y-R)+R^2*acos(1-y/R));
% Vtot = 2*Vend+Vcyl;
% fprintf('\nVolume of the endpcap is : %0.1f',Vend);
% fprintf('\nVolume of the cyl is : %0.1f',Vcyl);
% fprintf('\nTotal volume is : %0.1f\n', Vtot);

%Question 2
function ang = quiz1prep(a,b,c)
ang = acos(-(c^2-a^2-b^2)/(2*a*b));
end