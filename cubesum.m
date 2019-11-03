function sum = cubesum(a)
sum = 0; i = 1; n = length(a);
while i <= n
    sum = sum + a(i)^3;
    i = i + 3;
end
end
