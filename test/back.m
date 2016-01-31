function [ new_grid ] = back( X,grid )
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here
M = size(grid,1)-2; 
new_grid = ones(M,M);
for i = M+1 : -1 : 2
    for j = 2 : M+1 
      if grid(i,j).sort == 0
          new_grid(i-1,j-1) = X(grid(i,j).id,1);
      end
    end
end
new_grid(:,M) = zeros(M,1);
new_grid(1:floor(M/2),1:floor(M/2)) = NaN;
