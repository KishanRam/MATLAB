function ret = simpson(a,b,N)
tic
ret = 0; area = 0; dx = (b-a)/N; dstep = dx*2;
for i = a:dstep:b-dstep
    area = (dx/3)*(givenfunc(i)+4*givenfunc(i+dx)+givenfunc(i+2*dx));
    ret = ret + area;
end
toc
end
