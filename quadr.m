function root = quadr(a,b,c)
%Hi mom
if (nargin<3)
    error('Too Few Coefficients');
elseif (nargin>3)
    error('Too Many Coefficients');
else
    disc = b^2 -4*a*c;
    part1 = -b/2/a;
    part2 = sqrt(disc)/2/a;
    if (disc == 0)
        root = part1;
    else
        root = part1+part2;
        root = [root ; part1-part2];
    end
end
end