% Enter your code here. Read input from STDIN. Print output to STDOUT
% Your class should be named solution

-module(solution).
-export([main/0]).

create_list(N) -> create_list(N, []).
create_list(N, List) when N > 0 -> create_list(N-1, [1|List]);
create_list(0, List) -> List.

main() ->
    {ok, [N]} = io:fread("", "~d"),
% Fill up these questions marks to call a function (written by you)
% Which creates an array with N elements
    Arr=create_list(N),
   io:format("~B~n", [length(Arr)]).
% Do not change the lines of code already present.
% That is to assist us in evaluating whether the array you created
% has, indeed N elements.
