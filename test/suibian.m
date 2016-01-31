for i = 1:9
  h = exp(-1*i);  
syms x;
f(x) = exp(x); 
a = exp(2*h);
b = exp(-2*h);
c = exp(h);
d = exp(-1*h);
ee(x) = diff(f(x),5);
test(x) = diff(f(x),3);
e = ee(0);
appro = 1/(2*h^3)*(a-b-2*c+2*d) - (h^2)/4*e;
format long;
%disp(double(appro));
disp(abs(double(appro)-double(test(0))))
end