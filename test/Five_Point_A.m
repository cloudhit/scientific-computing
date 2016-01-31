function [ A, b ] = Five_Point_A(grid,N)
%UNTITLED6 Summary of this function goes here
%   Detailed explanation goes here
A = zeros(N,N);
b = zeros(N,1);
M = size(grid,1)-2;
for i = M + 1 : -1 : 2
    for j = 2 : M + 1
       if grid(i,j).sort == 0
           id = grid(i,j).id;
           A(id, id) = 4;
           cof=-1*ones(2,2);
        if grid(i+1,j).sort == 2  
            cof(2,1) = cof(2,1)*2; 
            cof(1,1) = 0; 
        end
        if grid(i-1,j).sort == 2
            cof(1,1) = cof(1,1)*2;
            cof(2,1) = 0;
        end
        if grid(i,j-1).sort == 2
            cof(2,2) = cof(2,2)*2;
            cof(1,2) = 0;
        end
        if grid(i,j+1).sort == 2
            cof(1,2) = cof(1,2)*2;
            cof(2,2) = 0;
        end
        if grid(i,j-1).sort == 1  
            cof(1,2) = 0;
            b(id,1) = b(id,1) + 1;
        elseif grid(i,j+1).sort == 1
            cof(2,2) = 0;
        end
        A(id, grid(i-1,j).id) = cof(2,1);
        A(id, grid(i+1,j).id) = cof(1,1);
        A(id, grid(i,j+1).id) = cof(2,2);
        A(id, grid(i,j-1).id) = cof(1,2);
       end
    end
end

