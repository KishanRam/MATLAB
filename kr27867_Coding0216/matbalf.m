%define functions for material balance
%species 1=A, 2=B, 3=D, 4=E
function matbal = matbalf(c)
global k1 k2 tau c0;
matbal(1) = c0(1) - c(1) - k1*c(1)*c(2)*tau;
matbal(2) = c0(2) - c(2) - k1*c(1)*c(2)*tau - k2*c(2)*c(3)*tau;
matbal(3) = c0(3) - c(3) + k1*c(1)*c(2)*tau - k2*c(2)*c(3)*tau;
matbal(4) = c0(4) - c(4) + k2*c(2)*c(3)*tau;
end