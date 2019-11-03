function dcdt = phif(t,N)
global a b c d
dcdt(1) = a*N(1) - b*N(1)*N(2);
dcdt(2) = -c*N(2) + d*N(1)*N(2);
dcdt = dcdt';
end