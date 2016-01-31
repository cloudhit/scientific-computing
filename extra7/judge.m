function [bad_point] = judge(res, P)
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here
total_number = size(P,1);
FDX = zeros(total_number, 1);
FDY = zeros(total_number, 1);
[TMP1, index1] = sortrows(P,1);
[TMP2, index2] = sortrows(P,2);
res1 = res(index1,:);
res2 = res(index2,:);
for i = 1:total_number - 1
  FDY(i) = abs((res1(i+1)-res1(i))/(TMP1(i+1,2)-TMP1(i,2)));
  FDX(i) = abs((res2(i+1)-res2(i))/(TMP2(i+1,1)-TMP2(i,1)));
end
  FDY(i+1) = FDY(i);
  FDX(i+1) = FDX(i);
FD = zeros(total_number, 1);
for i = 1:total_number - 1 
    FD(i) = abs(FDX(index2(i+1))-FDX(index2(i))) + abs(FDY(index1(i))-FDY(index1(i)));
end
FD(i+1) = FD(i);
bad_point = FD;
pos = [];
for i = 1:size(FD,1)
    if FD(i) > 0.3
      pos = [pos;P(i,:)];  
    end
end
disp(pos);