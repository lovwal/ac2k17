-module(checksum).
-compile(export_all).


solve(L) ->
	solve(L, 0).

solve([], Sum) ->
	Sum;
solve([H|T], Sum) ->
	solve(T, Sum+diff(H, nil, nil)).

diff([], Hi, Lo) ->
	Hi-Lo;
diff([H|T], nil, nil) ->
	diff(T, H, H);
diff([H|T], Hi, Lo) when H > Hi ->
	diff(T, H, Lo);
diff([H|T], Hi, Lo) when H < Lo ->
	diff(T, Hi, H);
diff([_|T], Hi, Lo) ->
	diff(T, Hi, Lo).

solve2(L) ->
	solve2(L, 0).

solve2([], Sum) ->
	Sum;
solve2([H|T], Sum) ->
	solve2(T, Sum+diffdiv(H)).

diffdiv([H|T]) ->
	diffdiv(T, H, T).

diffdiv([], _, []) ->
	[];
diffdiv([], _, [H|T]) ->
	diffdiv(T, H, T);
diffdiv([H|_], N, _) when H rem N == 0 ->
	H div N;
diffdiv([H|_], N, _) when N rem H == 0 ->
	N div H;
diffdiv([_|T], N, Rest) ->
	diffdiv(T, N, Rest).
