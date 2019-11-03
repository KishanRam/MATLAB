function ret = trapezoid(a,b)
tic
times = [0]; count = 1;
for j = [1 10 100 1000 10000 100000]
    ret = 0; dx = (b-a)/j; 
    for i = a:dx:b-dx
        area = ((givenfunc(i+dx)+givenfunc(i))/2)*dx;
        ret = ret + area;
    end
    times(count) = toc;
    count = count + 1;
end
vec = [1 10 100 1000 10000 100000];
plot(vec,times);
end
