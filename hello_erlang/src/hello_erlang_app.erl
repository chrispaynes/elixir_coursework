-module(hello_erlang_app).
% Behaviour holds a formalized structural pattern
-behaviour(application).

-export([start/2]).
-export([stop/1]).

start(_Type, _Args) ->
% cowboy_router middleware handles requests by mapping the requested host
% and path to the handler function. The handler then processes the request.
% compile(Routes) -> Dispatch
% Routes = routes()
% Dispatch = dispatch_rules()

    Dispatch = cowboy_router:compile([
        {'_', [{"/", hello_handler, []}]}
    ]),
    % cowboy:start_http starts listening for HTTP connections.
    % Returns the pid for this listener's supervisor.
    % start_http(Ref, NbAcceptors, TransOpts, ProtoOpts) -> {ok, pid()}
    % Ref accepts unique name used to refer to a listener.
    % NbAcceptors accepts a non negative integer
    % TransOpts accepts a list of TCP listening options from ranch_tcp:opts()
    % ProtoOpts accepts HTTP protocol handler configuration from cowboy_protocol:opts()
    cowboy:start_http(my_http_listener, 100, [{port, 8080}],
        [{env, [{dispatch, Dispatch}]}]
    ),
    % hello_erlang_sup:start_link() calls the start_link function
    % within the supervisor module. Start_link creates a gen_server
    % process within the supervision tree
    hello_erlang_sup:start_link().

stop(_State) ->
	ok.