M = 10000;
dt = 0.0001;
dx = 0.01;
Da = 1;
const1 = dt/dx^2;
const2 = 1 - dt*Da;
CL = 1;
CI = 0;
x = -1:dx:1;
N = length(x);

C(1) = CL;
for i = 2:N-1
    C(i) = CI;
end
C(N) = CL;

t(1) = 0;
for i = 1:M
    Cnew(1) = CL;
    for j = 2:N-1
        Cnew(j) = const1*(C(j+1)-2*C(j)+C(j-1))+const2*C(j);
    end
    Cnew(N) = CL;
    t(i+1) = t(i) + dt;
    C = Cnew;
end
