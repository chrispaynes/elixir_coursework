defmodule CliWeatherFetcher do
  use Application

  def start(_type, _args) do
    CliWeatherFetcher.Supervisor.start_link
  end

end
