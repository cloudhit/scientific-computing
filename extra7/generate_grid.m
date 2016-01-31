function [ sort, P1, Val, DT, DT_I ] = generate_grid( h )
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here

figure()
axis([0 2 0 2]);
axis equal;
% 1 known 2 neu 10 3 neu -5 0 unkown
M = floor(2/h);
h = 2/M;
sort = [];
Val = [];
%{
P = [];
for i = 0:h:1
    for j = 0:h:2
        P = [P;j,i];
    end
end
for i = 1+h:h:2
    for j = 1:h:2
        P = [P;j,i];
    end
end
total_number = size(P,1);

for id = 1:total_number
    if P(id,1) == 0 && P(id, 2) == 0
        n1 = id;
    elseif P(id,1) == 2 && P(id,2) == 0
        n2 = id;
    elseif P(id,1) == 2 && P(id,2) == 2
        n3 = id;
    elseif P(id,1) == 1 && P(id,2) == 2
        n4 = id;
    elseif P(id,1) == 1 && P(id,2) == 1
        n5 = id;
    elseif P(id,1) == 0 && P(id,2) == 1
        n6 = id;
    end
    if P(id, 2) == 0 || (P(id, 2) == 1 && P(id, 1) <= 1) || (P(id,1) == 1 && P(id,2) >= 1)|| P(id,1) == 2
        sort = [sort;1];
        Val = [Val;0];
    elseif P(id,1) == 0 
        sort = [sort;2];
        Val = [Val;NaN];
    elseif P(id,2) == 2
        sort = [sort;3];
        Val = [Val;NaN];
    else    
        sort = [sort;0];
        Val = [Val;NaN];
    end
end 
 C = [n1 n2;n2 n3;n3 n4;n4 n5;n5 n6;n6 n1];

%}
MK = textread('point.txt');
TMP = [];
P1 = MK(:,2:3);

for j = 0:0.25:1
    for i = 0:0.25:0.6       
        TMP = [TMP;i,j];
    end
end
for j = 0:0.25:0.25
    for i = 0.6:0.25:2       
        TMP = [TMP;i,j];
    end
end
for j = 0:0.25:2
    for i = 1.61:0.25:2       
        TMP = [TMP;i,j];
    end
end
for j = 1.31:0.25:2
    for i = 1:0.25:1.6       
        TMP = [TMP;i,j];
    end
end

for j = 0.4:0.1:1
    for i = 0.6:0.1:1.6        
       TMP = [TMP;i,j];
    end
end
for j = 1.1:0.1:1.3
    for i = 1:0.1:1.6        
       TMP = [TMP;i,j];    
    end
end    
for i = 1:size(TMP,1)
    judge = 0;
        for k = 1:50
            if P1(k,1) == TMP(i,1) && P1(k,2) == TMP(i,2)
                judge = 1;
                break;
            end
        end
        if judge == 0
            P1 = [P1;TMP(i,:)];
        end     
end

total_number = size(P1,1);
n1 = 30;
n2 = 34;
n3 = 40;
n4 = 26;
n5 = 17;
n6 = 33;
C = [n1 n2;n2 n3;n3 n4;n4 n5;n5 n6;n6 n1];

for id = 1:total_number
    if P1(id,1) == 0 && P1(id,2) <= 1
        sort = [sort;1];
        Val = [Val;1];
    elseif P1(id,1) == 2 
        sort = [sort;1];
        Val = [Val;0];
    else  
        sort = [sort;0];
        Val = [Val;NaN];
    end
end 

plot(P1(C'),P1(C'+size(P1,1)),'-b','LineWidth', 3);
DT = delaunayTriangulation(P1, C);
IO = isInterior(DT);
hold on
triplot(DT(IO, :),DT.Points(:,1), DT.Points(:,2),'LineWidth', 1)
hold off
DT_I = DT(IO,:);
end

