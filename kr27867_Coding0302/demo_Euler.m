function ret = demo_Euler(dt)
k = 1; t(1) = 0; n = 50;
y(1) = 1; ye(1) = y(1); yi(1) = y(1);
for i = 2:n-1
    t(i) = t(i-1)+dt;
    ye(i) = ye(i-1)*(1-(dt*k));
    yi(i) = yi(i-1)/(1+k*dt);
end

%exact solution
y = exp(-k*t);

plot(t,y,'r-',t,ye,'g--',t,yi,'b-.')