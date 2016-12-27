# OTPSupervision

Basic OTP Process Supervision. Created based on a [Josh Adams/DailyDrip.com](https://www.dailydrip.com) video.


## Features
* Asynchronous GenServer Casts
* Handling GenServer Casts and Calls
* OTP Supervision
* State Persistence
* Synchronous GenServer Calls

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
    Generated otp_supervision app

    $ iex -S mix
    Interactive Elixir (x.x.x) ...
    iex(1)>
```

#### WITHOUT SUPERVISION
Create a new ListServer within the IEX shell and add and remove items from the server. Crash the server and attempt to call the server. Notice the IEX shell prefix `iex(x)>` resets back to `iex(1)` and the system EXITS from PID after the crash. Also notice the ListServer crashes again when attempting to access state through ListServer.items.
```
    $ iex -S mix
    Interactive Elixir (x.x.x) ...

    iex(1)> ListServer.start_link
    {:ok, #PID<0.151.0>}

    iex(2)> ListServer.add("Milo")
    :ok

    iex(3)> ListServer.add("Otis")
    :ok

    iex(4)> ListServer.items
    ["Milo", "Otis"]

    iex(5)> ListServer.remove("Milo")
    :ok

    iex(6)> ListServer.items
    ["Otis"]

    iex(7)> ListServer.crash
    ** (EXIT from #PID<0.151.0>) bad return value: false

    Interactive Elixir (1.x.x) - press Ctrl+C to exit (type h() ENTER for help)
    iex(1)>
    20:08:02.987 [error] GenServer :state terminating
    ** (stop) bad return value: false
    Last message: {:"$gen_cast", :crash}
    State: ["Otis"]    

    nil

    iex(2)> ListServer.items
    ** (exit) exited in: GenServer.call(:state, :items, 5000)
    ** (EXIT) no process
    (elixir) lib/gen_server.ex:596: GenServer.call/3    
```

#### WITH SUPERVISION
Use the ListSupervisor to create a new ListServer within the IEX shell and add and remove items from the server. Crash the server and attempt to call the server. Notice the IEX shell prefix `iex(x)>` does not reset back to `iex(1)` after recovering from the crash. Also notice the ListServer does not crash when attempting to access state through ListServer.items. Make sure to start_link with ListSupervisor instead of the ListServer.
```
    iex(1)> ListSupervisor.start_link
    {:ok, #PID<0.108.0>}

    iex(2)> ListServer.add("Milo")
    :ok

    iex(3)> ListServer.add("Otis")
    :ok

    iex(4)> ListServer.items
    ["Milo", "Otis"]

    iex(5)> ListServer.remove("Milo")
    :ok

    iex(6)> ListServer.items
    ["Otis"]

    iex(7)> ListServer.crash
    20:04:40.584 [error] GenServer :state terminating
    ** (stop) bad return value: false
    Last message: {:"$gen_cast", :crash}
    State: []

    nil
    
    iex(8)> ListServer.items
    []
```

## Running Tests
 * <b>[Elixir Kernel.ExUnit](https://github.com/elixir-lang/elixir):</b>
Unit testing framework for Elixir.<br>
   ``` $ mix test ```
