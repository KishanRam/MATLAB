function ret = fact(n)
ret = 1;
if (n == 0)
    ret = 1;
else
    for (i = 1:n)
        ret = ret*i;
    end
end
