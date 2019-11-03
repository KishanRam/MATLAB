clear all
%This sums all integers from 1 to b
%ask user to input b
b = input('input value to sum up to: ');
%calculate remainder of b after diving
x = rem(b,1);
if x~=0
    error ('b is not an integer')
end
%initialize variable sum
sum = 0;
for i = 1:b
    sum = sum + i;
end
sum
