-module(solution).
-export([main/0]).

read_list({ok, [X]}, List) ->
    read_list(io:fread("", "~d"), [X|List]);
read_list(eof, List) ->
    List.

print_list([]) ->
  ok;
print_list([H|T]) ->
  io:format("~b~n", [H]),
  print_list(T).

main() ->
    List = read_list(io:fread("", "~d"), []),
    print_list([ abs(X) || X <- lists:reverse(List) ]).
