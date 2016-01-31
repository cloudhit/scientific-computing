function [b,c,Area_A] = Diff_Triangle( x,y )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
Area = x(2)*y(3) - x(3)*y(2) + x(3)*y(1) - x(1)*y(3) + x(1)*y(2) - x(2)*y(1);
Area_A = abs(Area)/2;
b = zeros(3,1);
c = zeros(3,1);
for i = 1:3
  i1 = mod(i,3) + 1;
  i2 = mod(i1,3) + 1;
  b(i) = (y(i1) - y(i2))/Area;
  c(i) = (x(i2) - x(i1))/Area;
end
end

