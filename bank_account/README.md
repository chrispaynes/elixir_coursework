# BankAccount

A stateful Bank Account model. Allows for creating, depositing, withdrawing, and balance_quering of a stateful bank account. Created based on a [Josh Adams/DailyDrip.com](https://www.dailydrip.com) video.

## Todo
* Persist event log to Postgres
* Add ability to rewind/replay events
* Create a CSV document of Account Log

## Features
* Atoms
* Command-Query Responsibility Segregation
* Event Filtering
* Event Sourcing
* Infinite Recursion
* Persisting State
* PID's
* Process Spawning
* Sending and Receiving Messages

## Usage
* Start the PostgreSQL Server
* Configure your PostgreSQL Username, Password and Port in `./config/config.exs`
* Create the application's PostgreSQL Database
```
    $ mix ecto.create -r BankAccount.Repo

    Generated bank_account app
    The database for BankAccount.Repo has been created
```

Use the Mix build tool to get all out of date or missing dependencies.
```
    $ mix deps.get
      Running dependency resolution
      ...
```

Use the Mix build tool to compile the app and start an iex session inside the project.
```
    $ mix compile
    Generated bank_account app

    $ iex -S mix
    Interactive Elixir (x.x.x) ...
    iex(1)>
```

Create a new Bank Account within the IEX shell and send (:query_balance, :deposit_into_account, and :withdraw_from_account) messages to the account.
```   
    iex(1)> account = spawn_link(BankAccount, :start, [])
    -----------------------------------------------------
    EVENT#          ACCOUNT BALANCE         EVENT TYPE
    -----------------------------------------------------
    0               0
    
    #PID<0.167.0>
    
    iex(2)> send(account, {:query_balance, self})
    -----------------------------------------------------
    EVENT#          ACCOUNT BALANCE         EVENT TYPE
    -----------------------------------------------------
    1               0  
    
    {:query_balance, #PID<0.176.0>}
    
    iex(3)> send(account, {:deposit_into_account, 25})
    -----------------------------------------------------
    EVENT#          ACCOUNT BALANCE         EVENT TYPE
    -----------------------------------------------------
    2               25  
    
    {:deposit_into_account, 25}
  
    iex(4)> send(account, {:withdraw_from_account, 20})
    -----------------------------------------------------
    EVENT#          ACCOUNT BALANCE         EVENT TYPE
    -----------------------------------------------------
    3               5  
    
    {:withdraw_from_account, 20}
```

## Running Tests
 * <b>[Elixir Kernel.ExUnit](https://github.com/elixir-lang/elixir):</b>
Unit testing framework for Elixir.<br> 
   ``` $ mix test ```
