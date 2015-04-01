-module(solution).
-export([main/0]).

read_list({ok, [X]}, List) ->
    read_list(io:fread("", "~d"), [X|List]);
read_list(eof, List) ->
    List.

replicate_list(_, [], ReplicatedList) ->
  ReplicatedList;
replicate_list(S, [H|T], ReplicatedList) ->
    replicate_list(S, T, append_many(S, H, ReplicatedList)).

append_many(0, _, List) ->
  List;
append_many(Amount, Item, List) when Amount > 0 ->
  append_many(Amount-1, Item, [Item|List]).

print_list([]) ->
  ok;
print_list([H|T]) ->
  io:format("~b~n", [H]),
  print_list(T).

main() ->
    {ok, [S]} = io:fread("", "~d"),
    List = read_list(io:fread("", "~d"), []),
    ReplicatedList = replicate_list(S, List, []),
    print_list(ReplicatedList).
