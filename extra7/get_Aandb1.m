function [ Ag, fg ] = get_Aandb1( DT_I, sort, P, Val )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
 element_number = size(DT_I,1);
 total_number = size(P,1);
 Ag = zeros(total_number, total_number);
 fg = zeros(total_number,1);
 for i = 1:element_number
     x = zeros(3,1);
     y = zeros(3,1);
     P_TMP = zeros(3,2);
     vert(3,1) = struct('id',[],'value',[],'sort',[]);
     for j = 1:3
     P_TMP(j,:) = P(DT_I(i,j),:);
     x(j) = P(DT_I(i,j),1);
     y(j) = P(DT_I(i,j),2);
     vert(j).id = DT_I(i,j);
     vert(j).sort = sort(vert(j).id);
     vert(j).value = Val(vert(j).id);
     end
     [Al,fl] = Local_Matrix(x,y,P_TMP);
     [ Ag, fg ] = Global_Matrices1(vert, Al, fl, Ag, fg);
 end
 D = [];
      for i = 1:total_number
          if sort(i,1) == 1
              fg(:,1) = fg(:,1) - Ag(:,i).*Val(i);
              Ag(i,:) = 0;
              Ag(:,i) = 0;
              Ag(i,i) = 1;
              D = [D;i];
          end
      end
      for i = 1:size(D,1)
          fg(D(i)) = Val(D(i));
      end
end

