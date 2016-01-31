function [ sort, DT_I, P, Val, DT,M ] = generate_grid( h )
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here

figure()
axis([0 2 0 2]);
axis equal;
M = floor(2/h) - 1;
sort = [];
Val = [];
P = [];
for i = 0:h:2
    for j = 0:h:2
        P = [P;j i];
    end
end
total_number = size(P,1);
n1 = 1;
n2 = M+2;
n3 = (M+2)*(M+2);
n4 = (M+2)*(M+1)+floor((M+2)/2)+1;
n5 = (M+2)*floor((M+2)/2)+floor((M+2)/2)+1;
n6 = (M+2)*floor((M+2)/2)+1;
for id = 1:total_number
    if (mod(id,M+2) == 1) && (id <= n6)
        sort = [sort;1];
        Val = [Val;1];
    elseif mod(id,M+2) == 0
        sort = [sort;1];
        Val = [Val;0];
    elseif mod(id,M+2) <= floor((M+2)/2) && mod(id,M+2) >= 1 && id > n5
        sort = [sort;2];
        Val = [Val; NaN];
    else
        sort = [sort;0];
        Val = [Val; NaN];
    end
end     
C = [n1 n2;n2 n3;n3 n4;n4 n5;n5 n6;n6 n1];
%plot(P(C'),P(C'+size(P,1)),'-r','LineWidth', 3);
DT = delaunayTriangulation(P, C);
IO = isInterior(DT);
hold on
triplot(DT(IO, :),DT.Points(:,1), DT.Points(:,2),'LineWidth', 1)
hold off
DT_I = DT(IO,:);
end

