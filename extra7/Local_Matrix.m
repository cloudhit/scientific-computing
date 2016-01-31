function [ A, f ] = Local_Matrix(x,y,P_TMP)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
[a,b,c, Area_A] = Diff_Triangle(x,y);
A = zeros(3,3);
res = [];
res1 = [];
sign = 0;
sign1 = 0;
for i = 1:3
    if P_TMP(i,1) == 0 
        res = [res;P_TMP(i,2)];
        sign = sign + 1;
    end
    if P_TMP(i,2) == 2
        res1 = [res1;P_TMP(i,1)];
        sign1 = sign1 + 1;
    end
end
f = zeros(3,1);
for i = 1:3
    %{
    if sign < 2 && sign1 < 2
        f(i) = 0;
    elseif sign == 2
        
        if res(2) < res(1)
            res = res([2;1],:);
        end
        syms y;
        f(i) = int(-10*(a(i)+c(i)*y),res(1),res(2));
        
    elseif sign1 == 2
        
        if res1(2) < res1(1)
            res1 = res1([2;1],:);
        end
        syms x;
        f(i) = int(5*(a(i)+b(i)*x),res1(1),res1(2));
    end
  
    %}
   for j = 1:3
       A(i,j) = Area_A*(b(i)*b(j) + c(i)*c(j));
   end
end
end

