clear all
%simple while loop to add integers from 1 to b 
%b is a user input
b = input('enter integer b ');
%initialize sum
sum = 0;
%initialize index j
j = 1;
while j <= b
    sum = sum + j; %add j to sum
    j = j + 1; %iterate j
end
sum
