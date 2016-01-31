function [ sort, DT_I, P, Val, DT ] = generate_grid1()
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here

figure()
axis([0 2 0 2]);
axis equal;
MK = textread('point.txt');
total_number = size(MK,1);
sort = [];
Val = [];
n1 = 30;
n2 = 34;
n3 = 40;
n4 = 26;
n5 = 17;
n6 = 33;
P = [];
%for i = 
for i = 0.1:0.2:0.8
    for j = 0:0.2:1
    %    total_number = total_number + 1;
    %   MK=[MK;total_number,i,j];
    end
end
for i = 0.81:0.13:1.00
    for j = 0:0.1:1
    %    total_number = total_number + 1;
    %    MK=[MK;total_number,i,j];
    end
end
for i = 1.01:0.13:1.4
    for j = 0:0.1:1.3
    %   total_number = total_number + 1;
    %    MK=[MK;total_number,i,j];
    end
end
for i = 0:0.167:0.667
   % total_number = total_number + 1;
    %    MK=[MK;total_number,0.85,i];
end
for i = 0:0.167:1
   % total_number = total_number + 1;
    %    MK=[MK;total_number,0.5,i];
end
for i = 1:total_number
    if MK(i,2) == 2
        sort =[sort;1];
        Val = [Val;0];
    elseif MK(i,2) == 0 && MK(i,3) <= 1
        sort = [sort;1];
        Val = [Val;1];
    elseif MK(i,2) >= 0 && MK(i,2) <1 && MK(i,3) > 1
        sort = [sort;2];
        Val = [Val;NaN];
    else
        sort = [sort;0];
        Val = [Val;NaN];
    end
end
P = MK(:,2:3);
C = [n1 n2;n2 n3;n3 n4;n4 n5;n5 n6;n6 n1];
plot(P(C'),P(C'+size(P,1)),'-r','LineWidth', 3);
DT = delaunayTriangulation(P, C);
IO = isInterior(DT);
hold on
triplot(DT(IO, :),DT.Points(:,1), DT.Points(:,2),'LineWidth', 1)
hold off
DT_I = DT(IO,:);


