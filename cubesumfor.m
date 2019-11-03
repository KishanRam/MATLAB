function sum = cubesumfor(a)
sum = 0; n = length(a);
for i = 1:n
    if rem(i,3) == 0
        sum = sum + a(i)^3;
    end
end
end
