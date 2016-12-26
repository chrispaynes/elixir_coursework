# ElixirExercises

## About
A collection of Elixir challenges and exercises accompanied by ExUnit tests. Challenges were sourced from
[FreeCodeCamp](https://www.freecodecamp.com), [Exercism.IO](http://exercism.io),
[Josh Adams of DailyDrip.com](https://www.dailydrip.com) and [Codewars](https://www.codewars.com).
* Each Elixir Module file within "lib/src" contains code that solves a coding challenge.
* Each Elixir Module file within "test/src" contains an ExUnit test file to verify module outputs.

## Features
 * Comprehensions
 * Enumerable Algorithms
 * ExDoc Documentation
 * ExUnit Tests
 * Doctests
 * Guard Clauses
 * Module Attributes
 * Recursion
 * Streams
 * Typespecs

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
    Generated elixir_exercises app

    $ iex -S mix
    Interactive Elixir (x.x.x) ...
    iex(1)>
```

Call a Module's function with arguments from inside the iex shell
``` ModuleName.functionName(argv) ```

```   
    iex(1)> ArgumentsOptional.addTogether(1,2)
    3
```

Access Documentation Within IEX
```   
    iex(1)> h(ModuleName) 
            ...
    iex(1)> h(ModuleName.functionName)
            ...    
```

## Running Tests and Static Analysis
 * <b>[Credo](https://github.com/rrrene/credo):</b>
 Static code analysis with a focus on code consistency and teaching. 
 <br>
  ``` $ mix credo --strict ```
 * <b>[Dialyxir](https://github.com/jeremyjh/dialyxir):</b>
 Static analysis tool for Erlang and other languages that compile to BEAM bytecode for the Erlang VM.<br>
   ``` $ mix dialyzer ```
 * <b>[ExCoveralls](https://github.com/parroty/excoveralls):</b>
 Coverage report tool for Elixir. <br>
   ``` $ mix coveralls ```
 * <b>[Elixir Kernel.ExUnit](https://github.com/elixir-lang/elixir):</b>
 Static code analysis with a focus on code consistency and teaching.<br> 
   ``` $ mix test ```


## Generate ExDoc HTML Documentation

```
    $ mix docs
      Generated elixir_exercises app
      Docs successfully generated.
      View them at "doc/index.html".
    $ open doc/index.html
```
