function [d,X,Y] = domain(N)
%N = 5; % the number of nodes per line of the domain
d.x = linspace(0,2,N); %x, and y coordiantes of the nodes
d.y = linspace(0,2,N);
[X,Y]=meshgrid(d.x,d.y); % mesh grid of the domain
% justify the interior of the domain. omega = 1 if it's a interior point
% need to be calculated. omega = 0 if it's a boundary or nor a mesh point
d.omega = (abs(X-1)<1)&(abs(Y-1)<=1)&((X-1>=0) |(Y-1>=0));
r = 0; 
d.rr = zeros(N,N); % the geomotry of the domain with the nodes numbered
for i = 1:N
    for k = 1:N
        if d.omega(i,k)
            r = r+1;
            d.ii(r) = i; % the vertical of the first or ... interior node
            d.kk(r) = k;  % the horizontal of the first or ... interior node
            d.rr(i,k) = r;
        end
    end
end
d.NU = r; %numbers of the interior nodes.
end