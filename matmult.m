function z  = matmult(A,B)
[ma na] = size(A);
[mb nb] = size(B);

%Check to see if col of one equals row of other
if na ~= mb
    error('Matrix dimensions do not agree');
end

%Creating new matrix
z = zeros(ma,nb);
for i = 1:ma
    for j = 1:nb
        sum = 0;
        for k = 1:na
            sum = sum + A(i,k).*B(k,j);
        end
        z(i,j) = sum;
    end
end
end

        