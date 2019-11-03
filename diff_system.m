N = 100; %Number of points
Tol = 1e-5;
L = 0.01; %Length of membrane is 100 um
x = linspace(0,L,N);
dx = x(3)-x(2);

%Declare random Ca and Cb, set boundary conditions
cA = rand(N,1); cA(1) = 1; cA(N) = 0;
cB = rand(N,1); cb(1) = 0.1; cB(N) = 0.8;
dcA = cA; dcB = cB; %keeps track of changes in cA and cB

DA = 1e-5; DB = 1e-6; k = 1;

betaA = -(2+k*dx^2/DB*cA(2:N-1));
betaB = -(2+k*dx^2/DA*cB(2:N-1));

c = ones(N-2,1); e = ones(N-2,1);