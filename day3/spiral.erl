-module(spiral).
-compile(export_all).


solve(In) ->
	calc(In, 0, 1).

calc(In, Grid, Fac) when In =< Fac*Fac ->
	calc(In, Grid, Fac, Fac*Fac, Fac);
calc(In, Grid, Fac) ->
	calc(In, Grid+1, Fac+2).

calc(In, Grid, Base, In, Pos) ->
	Mid = round(Base/2),
	if Mid >= Pos -> Grid+Mid-Pos;
	true -> Grid+Pos-Mid
	end;
calc(In, Grid, Base, Num, 0) ->
	calc(In, Grid, Base, Num-1, Base);
calc(In, Grid, Base, Num, Pos) ->
	calc(In, Grid, Base, Num-1, Pos-1).


