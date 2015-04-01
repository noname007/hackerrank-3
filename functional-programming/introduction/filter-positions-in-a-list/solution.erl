-module(solution).
-export([main/0]).

read_list({ok, [Y]}, List) ->
    read_list(io:fread("", "~d"), [Y|List]);
read_list(eof, List) ->
    List.

print_list([], _) -> ok;
print_list([_|T], false) -> print_list(T, true);
print_list([H|T], true) ->
    io:format("~b~n", [H]),
    print_list(T, false).


main() ->
    List = read_list(io:fread("", "~d"), []),
    print_list(lists:reverse(List), false).
