function [ Ag, fg ] = get_Aandb1( DT_I, sort, P, Val )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
 element_number = size(DT_I,1);
 total_number = size(P,1);
 Ag = zeros(total_number, total_number);
 fg = zeros(total_number,1);
 for i = 1:element_number
     x = zeros(3,1);
     y = zeros(3,1);
     vert(3,1) = struct('id',[],'value',[],'sort',[]);
     for j = 1:3
     x(j) = P(DT_I(i,j),1);
     y(j) = P(DT_I(i,j),2);
     vert(j).id = DT_I(i,j);
     vert(j).sort = sort(vert(j).id);
     vert(j).value = Val(vert(j).id);
     end
     Al = Local_Matrix(x,y);
     if i == 14
         disp(Al)
         disp(x);
         disp(y);
     end
     [ Ag, fg ] = Global_Matrices(vert, Al, Ag, fg);
 end
 
end

