-module(captcha).
-compile(export_all).

solve([H|T]) -> 
    solve(T, H, H, 0).

solve([], F, F, Sum) ->
    Sum+F;

solve([], _, _, Sum) ->
    Sum;

solve([H|T], H, F, Sum) ->
    solve(T, H, F, Sum+H);

solve([H|T], _, F, Sum) ->
    solve(T, H, F, Sum).

solve2(L) ->
    Len = length(L) div 2,
    {L1, L2} = lists:split(Len, L),
    solve2(L1, L2, 0).

solve2([], [], Sum) ->
    Sum;

solve2([H|T1], [H|T2], Sum) ->
    solve2(T1, T2, H*2+Sum);

solve2([_|T1], [_|T2], Sum) ->
    solve2(T1, T2, Sum).
