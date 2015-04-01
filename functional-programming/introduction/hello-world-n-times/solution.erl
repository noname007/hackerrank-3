-module(solution).
-export([main/0]).

main() ->
    {ok, [N]} = io:fread("", "~d"),
    print_hello_world(N).

print_hello_world(0) -> ok;

print_hello_world(N) when N > 0 ->
    io:format("Hello World~n"),
    print_hello_world(N-1).
