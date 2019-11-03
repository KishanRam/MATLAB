function y = etay(x,frac)
s = 1; n = 1; m=1;
st = true;
while (st | err > frac)
    st = false;
    m=m*n;
    term = x^n/m;
    s = s + term;
    err = abs(term/s);
    n = n+1;
end
y = s;
end
