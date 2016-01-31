function [ res, t2 ] = cal_with_diffMedthods( Ag, fg, M)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
max_it = 30000;
tol = 1e-4;
N = size(Ag,1);
x = zeros(N,1);
Mt = eye(N,N);
t21 = cputime;
[u, error, iter1, flag]  = bicg(Ag, x, fg, Mt, max_it, tol);
t22 = cputime;
t2 = t22-t21;
res = zeros(M + 2, M + 2);
res(floor((M+2)/2)+2:M+2, 1:floor((M+2)/2)) = NaN;
res(1:floor((M+2)/2)+1,1:M+2) = (reshape(u(1:(floor((M+2)/2)+1)*(M+2)),M+2,floor((M+2)/2)+1))';
res(floor((M+2)/2)+2:M+2,floor((M+2)/2)+1:M+2) = (reshape(u((floor((M+2)/2)+1)*(M+2)+1:size(u,1)),floor((M+2)/2)+1,floor((M+2)/2)))';
%trisurf(DT_I, DT.Points(:,1), DT.Points(:,2), res);
%res = u;
end

