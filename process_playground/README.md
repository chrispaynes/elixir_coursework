# ProcessPlayground

## About
Provides an introduction to sending and receive messages via Process Id Mailboxes.
Sourced from [Josh Adams of DailyDrip.com](https://www.dailydrip.com).
* Each Elixir Module contains an ExUnit test file located in "test/src".

## Features
 * Actor Model
 * Pattern Matching
 * Process Ids
 * Sending/Receiving Messages
 * Spawning 
 * Testing Message Passing

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
    Generated process_playground app

    $ iex -S mix
    Interactive Elixir (x.x.x) ...
    iex(1)>
```

Start the Process Playground from inside the iex shell

```   
    $ iex -S mix
    Interactive Elixir (x.x.x) ...

    iex(1)> pong = spawn_link(Pong, :start, [])
    #PID<0.154.0>
    
    iex(2)> send pong, {:ping, self}
    Pong received a ping 1 times
    {:ping, #PID<0.152.0>}
    
    iex(3)> send pong, {:ping, self}
    Pong received a ping 2 times
    {:ping, #PID<0.152.0>}
    
    iex(4)> ping = spawn_link(Ping, :start, [])
    #PID<0.160.0>

    iex(5)> pong = spawn_link(Pong, :start, [])
    #PID<0.162.0>

    iex(6)> send ping, {:pong, self}
    {:pong, #PID<0.152.0>}

    iex(7)> send ping, {:pong, self}
    Pong received a ping 1 times
    ...
    ...
    Pong received a ping 18388 times

    iex(8)>
    BREAK: (a)bort (c)ontinue (p)roc info (i)nfo (l)oaded
           (v)ersion (k)ill (D)b-tables (d)istribution
```
*

Access Documentation Within IEX
```   
    iex(1)> h(ModuleName) 
            ...
    iex(1)> h(ModuleName.functionName)
            ...    
```

## Generate ExDoc HTML Documentation
```
    $ mix docs
      Generated elixir_exercises app
      Docs successfully generated.
      View them at "doc/index.html".
    $ open doc/index.html
```