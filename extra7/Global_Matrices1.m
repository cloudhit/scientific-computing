function [ Ag, fg ] = Global_Matrices1(vert, Al, fl,  Ag, fg)
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
for i = 1:3
    fg(vert(i).id) = fg(vert(i).id) + fl(i);
    for j = 1:3
        Ag(vert(i).id,vert(j).id) = Ag(vert(i).id, vert(j).id) + Al(i,j);
    end
end
end

