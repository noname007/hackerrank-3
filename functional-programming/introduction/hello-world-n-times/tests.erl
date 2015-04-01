-module(tests).
-include_lib("eunit/include/eunit.hrl").

solution_test() ->
    Actual   = run_solution(),
    Expected = get_sample_output(),
    ?assertEqual(Expected, Actual).

run_solution() ->
    os:cmd(solution_command()).

solution_command() ->
    "erl -eval 'solution:main(),init:stop()' -noshell < sample_input.txt".

get_sample_output() ->
    {ok, Data} = file:read_file("sample_output.txt"),
    binary_to_list(Data).
