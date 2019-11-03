function ret = locate_in_sphere(v)
mag = norm(v);
if (mag <= 0.25)
    ret = 1;
elseif (mag <= 0.5)
    ret = 2;
elseif (mag <= 1.0)
    ret = 3;
else
    ret = =0;
end
end
