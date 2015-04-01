-module(solution).
-export([main/0]).

read_list({ok, [X]}, List) ->
    read_list(io:fread("", "~d"), [X|List]);
read_list(eof, List) ->
    List.

sum_odd_elements(List) -> sum_odd_elements(List, 0).
sum_odd_elements([], Sum) -> Sum;
sum_odd_elements([H|T], Sum) when H rem 2 /= 0 ->
    sum_odd_elements(T, Sum+H);
sum_odd_elements([H|T], Sum) when H rem 2 == 0 ->
    sum_odd_elements(T, Sum).

main() ->
    List = read_list(io:fread("", "~d"), []),
    Sum  = sum_odd_elements(List),
    io:format("~b~n", [Sum]).
