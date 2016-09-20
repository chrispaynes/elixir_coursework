-module(hello_handler).
-behaviour(cowboy_http_handler).

% Exported functions. Specifies which of the functions, defined within the module, that are visible from outside the module.
-export([init/3]).
-export([handle/2]).
-export([terminate/3]).

% A record is a data structure for storing a fixed number of elements.
% It has named fields and is similar to a struct in C.
% Record expressions are translated to tuple expressions during compilation.
-record(state, {
}).

% init({TransportName, ProtocolName}, Req, Opts) -> {ok, Req, State} | {shutdown, Req, State}
% TransportName = tcp | ssl | atom()
% ProtocolName = http | atom()
% Req = cowboy_req:req()
% Opts = any()
% State = any()
% Initialize the state for this request.
% The shutdown return value can be used to skip the handle/2 call entirely.
init(_, Req, _Opts) ->
	{ok, Req, #state{}}.

% handle(Req, State) -> {ok, Req, State}
% Handle the request.
% This callback is where the request is handled and a response should be sent.
% If a response is not sent, Cowboy will send a 204 No Content response automatically.
% Req = cowboy_req:req()
% State = any()
handle(Req, State=#state{}) ->
    {ok, Req2} = cowboy_req:reply(200,
        [{<<"content-type">>, <<"text/plain">>}],
        <<"Hello Erlang!">>,
        Req),
    {ok, Req2, State}.

% terminate(Reason, Req, State) -> ok
% Reason = {normal, shutdown} | {error, atom()}
% Req = cowboy_req:req()
% State = any()
terminate(_Reason, _Req, _State) ->
	ok.
