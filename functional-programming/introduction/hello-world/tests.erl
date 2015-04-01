-module(tests).
-include_lib("eunit/include/eunit.hrl").

solution_test() ->
    Actual   = run_solution(),
    Expected = "Hello World",
    ?assertEqual(Expected, Actual).

run_solution() ->
    os:cmd(solution_command()).

solution_command() ->
    "erl -eval 'solution:main(),init:stop()' -noshell".
