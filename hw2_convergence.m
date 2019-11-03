tic
Tol = 10e-10;
Err = 1;
V(1) = 20.9;
i = 2;
c = 0.6052;
A = 2.0230e-05;
B= 1.0350e-04;
while Err > Tol
    V(i) = (c*(-1.52*log10(A+(B*(V(i-1))^-0.9152)))^-2.169)^(-1/2);
    Err = abs(V(i) - V(i-1));
    i = i+1;
end
V
toc