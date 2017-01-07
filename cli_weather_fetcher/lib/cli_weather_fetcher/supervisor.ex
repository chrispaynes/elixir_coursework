defmodule CliWeatherFetcher.Supervisor do
  use Supervisor

  def start_link do
    Supervisor.start_link(__MODULE__, :ok)
    #result = {:ok, sup} = :supervisor.start_link(__MODULE__, [])
    #start_workers(sup)
    #result
  end

  def init(:ok) do
    children = [worker(CliWeatherFetcher.Yahoo, [CliWeatherFetcher.Yahoo])]

    supervise(children, strategy: :one_for_one)
  end


end
