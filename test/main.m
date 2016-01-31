h = 0.3;
[grid,N] = generate_grid(h);
[ A, b ] = Five_Point_A( grid , N);
max_it = 30000;
m = size(grid,1);
tol = 1e-4;
x = zeros(N,1);
M = eye(N,N);

%bicg
t11 = cputime;
[x1, error, iter1, flag]  = bicg(A, x, b, M, max_it, tol)
t12 = cputime;
t1 = t12 - t11;
[ new_grid ] = back( x1,grid );
contour(new_grid);
set(gca,'yDir','reverse');




