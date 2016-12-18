# ProcessPlayground

## About
Provides an introduction to sending and receive messages via Process Id Mailboxes.. Sourced from
[Josh Adams of DailyDrip.com](www.dailydrip.com).
* Each Elixir Module file within "lib/src" contains code that solves a coding challenge.
* Each Elixir Module file within "test/src" contains an ExUnit test file to verify module outputs.

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

Call a Module's function with arguments from inside the iex shell
``` ModuleName.functionName(argv) ```

```   
    iex(1)> Ping.start
    
```

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