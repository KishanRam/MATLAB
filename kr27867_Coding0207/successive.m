%matlab code for sucessive substitution method
%find x such that x = cos(x)
clear all
Tol = 10e-5;    %define a tolerance
Err = 1;        %initialize error
x(1) = 1;       %initialize guess for x
i = 1;          %initialize index
while Err > Tol
    x(i+1) = cos(x(i));     %successive substitution method
    Err = abs(cos(x(i))-x(i));
    i = i + 1;
    if i > 10000
        error('Nope');
    end
end    
x