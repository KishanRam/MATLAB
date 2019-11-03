function dcdt = reaction(t,c)
%1=A, 2=B, 3=C, 4=D
global k1 k2 k3 k4 k5 k6;
dcdt(1) = -k1*c(1) + k2*c(2);
dcdt(2) = k1*c(1) - k3*c(2) - k2*c(2) + k4*c(3);
dcdt(3) = k3*c(2) - k5*c(3) - k4*c(3) + k6*c(4);
dcdt(4) = k5*c(3) - k6*c(4);
dcdt = dcdt'; %ode solvers in matlab only takes column vectors
end
