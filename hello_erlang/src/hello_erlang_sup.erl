% hello_erlang_sup stores the application's supervision tree
-module(hello_erlang_sup).
-behaviour(supervisor).

-export([start_link/0]).
-export([init/1]).

% start_link creates a gen_server process within the supervision tree, and
% allows the supervisor to directly or indirectly call start_link
start_link() ->
% start_link(Module, Args, Options) -> Result
  supervisor:start_link({local, ?MODULE}, ?MODULE, []).

init([]) ->
  Procs = [],
  {ok, {{one_for_one, 1, 5}, Procs}}.
