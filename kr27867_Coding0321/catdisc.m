%this program solves for the dimensionless steady-state
%concentration profile within a catalytic disk
clear all
%discretize space
%set a delta y
delta_y = 0.001;
N = 2/delta_y-1;
%calculate y
y = linspace(0,1,N+2); %N+2 because of two boundaries

%defie Da
Da = 0.01;

%define three diagonals and RHS vector
%RHS vector
b = zeros(N,1);
b(1) = -1; b(N) = 0; 

% diagonal
a = zeros(N,1);
%subdiagonal
c = ones(N,1);
%superdiagonal
d = ones(N,1);

for i=1:1:N
    a(i) = -(2+Da*delta_y^2);
end

psi = tridiagonal_solver(a,c,d,b);
psi = [1 psi 1];
plot(y,psi);