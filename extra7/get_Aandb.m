function [ Ag, fg ] = get_Aandb( DT_I, sort, P, Val )
 element_number = size(DT_I,1);
 total_number = size(P,1);
 Ag = zeros(total_number, total_number);
 fg = zeros(total_number,1);
 cur = 0;
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
     [Al,fl,judge] = Local_Matrix(x,y,P_TMP);
     if judge == 1
         cur = cur + 1;
     end
     [ Ag, fg ] = Global_Matrices(vert, Al, fl, Ag, fg);
 end
 disp(cur);
 end


