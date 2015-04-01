-module(solution).
-export([main/0]).

read_list({ok, [Y]}, List) ->
    read_list(io:fread("", "~d"), [Y|List]);
read_list(eof, List) ->
    List.

filter_list([H|T], {smaller_than, X}, FilteredList) when H < X ->
    filter_list(T, {smaller_than, X}, [H] ++ FilteredList);
filter_list([_|T], {smaller_than, X}, FilteredList) ->
    filter_list(T, {smaller_than, X}, FilteredList);
filter_list([], _, FilteredList) ->
    FilteredList.

print_list([]) ->
    ok;
print_list([H|T]) ->
    io:format("~b~n", [H]),
    print_list(T).

main() ->
    {ok, [X]} = io:fread("", "~d"),
    List = read_list(io:fread("", "~d"), []),
    FilteredList = filter_list(List, {smaller_than, X}, []),
    print_list(FilteredList).
