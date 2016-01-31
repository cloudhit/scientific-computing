
[ sort, DT_I, P, Val, DT] = generate_grid1( );
[ Ag, fg ] = get_Aandb1( DT_I, sort, P, Val );
[ res ] = cal_with_diffMedthods1( Ag, fg);
trisurf(DT_I,DT.Points(:,1), DT.Points(:,2), res);
%set(gca,'yDir','reverse');
