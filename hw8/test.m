h=0.125;
[ sort, DT_I, P, Val, DT,M ] = generate_grid( h );
[ Ag, fg ] = get_Aandb( DT_I, sort, P, Val );
[ res, t2 ] = cal_with_diffMedthods( Ag, fg ,M);
trisurf(DT(:,:),DT.Points(:,1), DT.Points(:,2), res);
set(gca,'yDir','reverse');
x = 1:M+2;
y = 1:M+2;
[X,Y] = meshgrid(x,y);
reverse = [];
for i = 1:M+2
    reverse = [reverse;M+3-i];
end
res1 = res(reverse,:);
%contour(X,Y,res);