# GenFsm
Create a Generic Finite State Machine (FSM). Originally based off a [Josh Adams/DailyDrip.com](https://www.dailydrip.com) video, but later adapted to use GenStateMachine API.

## Features
* Calling Generic State Machine Server References
* Finite State Machines
* GenStateMachine API and Erlang's :gen_statem
* Handling Generic State Machine Event Calls
* Persisting State
* Process Spawning

## Usage
Use the Mix build tool to get all out of date or missing dependencies.
```
    $ mix deps.get
      Running dependency resolution
      ...
```

Use the Mix build tool to compile the app and start an iex session inside the project.
```
    $ mix compile
    Generated gen_fsm app

    $ iex -S mix
    Interactive Elixir (x.x.x) ...
    iex(1)>
```

Create a new gen_fsm app within the IEX shell. The goal is to send the state machine each character sequently to spell out the word "sips". First send "s", then "i", then "p", and then another "s". Sequentially and one by one, send individual atoms to the FSM. After successfully sending the correct character atom, the application with return an atom confirming the state machine was sent the correct character atom. The finite state is the atom, `:got_sips`.
```   
    iex(1)> fsm = SipsMatcher.start_link(SipsMatcher, [])
    #PID<0.153.0>

    iex(2)> SipsMatcher.consume(fsm, :s)
    :got_s

    iex(3)> SipsMatcher.consume(fsm, :i)
    :got_i

    iex(4)> SipsMatcher.consume(fsm, :j)
    :got_si

    iex(5)> SipsMatcher.consume(fsm, :i)
    :got_si

    iex(6)> SipsMatcher.consume(fsm, :p)
    :got_p

    iex(7)> SipsMatcher.consume(fsm, :s)
    :got_sips

    iex(8)> SipsMatcher.consume(fsm, :x)
    :got_sips

    iex(9)> SipsMatcher.consume(fsm, :i)
    :got_sips
```

## Running Tests
 * <b>[Elixir Kernel.ExUnit](https://github.com/elixir-lang/elixir):</b>
Unit testing framework for Elixir.<br> 
   ``` $ mix test ```