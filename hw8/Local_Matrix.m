function [ A ] = Local_Matrix(x,y)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
[b,c,Area_A] = Diff_Triangle(x,y);
A = zeros(3,3);
for i = 1:3
   for j = 1:3
       A(i,j) = Area_A*(b(i)*b(j) + c(i)*c(j));
   end
end
end

