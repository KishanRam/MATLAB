function ret = tridiagonal_solver(c,d,e,b) %initialize function

%find size of tridiagonal matrix and create return vector
% [nrow ncol] = size(A);
% ret = zeros(1,nrow);

nrow = length(c);

%c = zeros(1,nrow); d = zeros(1,nrow); e = zeros(1,nrow);
% d(1) = A(1,1); e(1) = A(1,2); d(nrow) = A(end,end); c(end) = A(end,end-1);
% for i = 2:nrow-1
%     d(i) = A(i,i); c(i) = A(i,i-1); e(i) = A(i,i+1);
% end

for j = 2:nrow
        d(j)=d(j)-e(j-1)*c(j)/d(j-1);
        b(j)=b(j)-b(j-1)*c(j)/d(j-1);
end


%back substitution
ret(nrow) = b(nrow)/d(nrow); %solving for first variable
for j = nrow-1:-1:1
    ret(j) = (b(j)-e(j)*ret(j+1))/d(j);
end


