function ret = elements(m)
row = size(m,1);
col = size(m,2);
count = 0;
ret = 0;
for (i = 1:row)
    for (j = 1:col)
        if (m(i,j) >= 0)
            count = count + 1;
        end
    end
end
if (count == 0)
    error ('There are no non negative elements')
else
    for (k = 1:row)
        for (l = 1:col)
            if(m(k,l) >= 0)
                ret = ret + m(k,l);
            end
        end
    end
end
ret = ret/count;
end

