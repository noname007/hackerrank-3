-module(solution).
-export([main/0]).

read_list({ok, [X]}, List) ->
    read_list(io:fread("", "~f"), [X|List]);
read_list(eof, List) -> List.

expandList(_, []) -> ok;
expandList(N, [H|T]) ->
    expandList(N, T),
    io:format("~.4f~n", [expand(N, H)]).

expand(1, X) -> 1 + X;
expand(N, X) when N > 1 ->
     (math:pow(X, N)/factorial(N)) + expand(N-1, X).

factorial(1) -> 1;
factorial(X) when X > 1 -> X * factorial(X-1).

main() ->
    {ok, [_]} = io:fread("", "~d"),
    List = read_list(io:fread("", "~f"), []),
    expandList(9, List).
