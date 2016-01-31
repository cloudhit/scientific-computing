function [ grid,N ] = generate_grid(h)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
M = 2*floor(1/h) + 1;
x = linspace(0,2,M);
y = linspace(0,2,M);
[X,Y] = meshgrid(x,y);
grid (M+2,M+2) = struct('sort', [],'id',[]);

for i = 2 : M+1
    for j = 2 : M+1
      grid(i,j).sort = 0; 
    end
end
for i = 1 : M+2
    grid(i,1).sort = 2;
    grid(1,i).sort = 2;
    grid(M+2,i).sort = 2;
    grid(i,M+2).sort = 2;
end
for i = 2 : floor(M/2) + 1
    for j = 2 : floor(M/2) + 1
      grid(i,j).sort = 2;
    end
end
for i = floor(M/2) + 2 : M + 1
   grid(i,2).sort = 1;
end

for i = 2 : M + 1
   grid(i,M+1).sort = 1;
end

cur = 1;
for i = M + 2: -1 : 1
   for j = 1 : M + 2
       if grid(i,j).sort == 0
          grid(i,j).id = cur;
          cur = cur + 1;
       end
   end
end
N = cur - 1;
x1 = [0,1];
y1 = [1,1];
y2 = [0,0];
fill([x1,fliplr(x1)],[y1,fliplr(y2)],'r');
hold on
x2 = [1,2];
y3 = [2,2];
y4 = [0,0];
fill([x2,fliplr(x2)],[y3,fliplr(y4)],'r');
hold on
plot(X,Y,'b-x',Y,X,'b-x');
hold off

end

