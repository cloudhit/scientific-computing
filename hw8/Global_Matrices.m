function [ Ag, fg ] = Global_Matrices(vert, Al, Ag, fg)
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
for row = 1:3
    for col = 1:3
        if vert(col).sort == 1 
            if col ~= row
                if(vert(row).sort ~= 1)
                fg(vert(row).id) = fg(vert(row).id) - Al(row, col)*vert(col).value;
                end
                Ag(vert(row).id, vert(col).id) = 0;
            else 
                Ag(vert(row).id, vert(col).id) = 1;
            end
                fg(vert(col).id) = vert(col).value;
        elseif vert(row).sort == 1 
                Ag(vert(row).id, vert(col).id) = 0;
                fg(vert(row).id) = vert(row).value;
        else 
            Ag(vert(row).id,vert(col).id) = Ag(vert(row).id,vert(col).id) + Al(row,col);
        end
        
    end       
end
end

