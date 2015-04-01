-module(solution).
-export([main/0]).

read_list({ok, [X]}, List) ->
    read_list(io:fread("", "~d"), [X|List]);
read_list(eof, List) ->
    List.

sizeof(List) -> sizeof(List, 0).
sizeof([], Size) -> Size;
sizeof([_|T], Size) -> sizeof(T, Size+1).

main() ->
    List = read_list(io:fread("", "~d"), []),
    io:format("~b~n", [sizeof(List)]).
