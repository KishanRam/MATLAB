%Program to solve system of linear eq using Gaussian eleminiation
%Specify A, b, and determine n
A = input('Enter the coefficient matrix A: ');
b = input('Enter the RHS vector b: ');
n = rank(A);

%Forward elimination 
for i = 1:n-1 %Eliminate n-1 variables
    for j = i+1:n %Start with one row below pivot
        ratio = A(j,i)/A(i,i);
        for c = 1:n
            A(j,c) = A(j,c)-ratio*A(i,c);
        end
        b(j) = b(j) - ratio*b(i);
    end
end

%Back Substitution
x = zeros(1,n); x(end) = b(end)/A(end,end);
for i = n-1:-1:1
    sum = 0;
    for j = i+1:n
        sum = sum+(A(i,j)*x(j));
    end
    x(i) = (b(i) - sum)/A(i,i);
end

%output x
x


        
