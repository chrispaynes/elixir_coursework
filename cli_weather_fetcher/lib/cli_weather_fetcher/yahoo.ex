defmodule CliWeatherFetcher.Yahoo do

  use GenServer
  
  def start_link(name) do
    GenServer.start_link(__MODULE__, :ok, name: name)
  end
  
  #1100661
  def fetch(woeid) do
    body = get(woeid)
    temp = extract_temp(body)
    IO.inspect temp

   Poison.Parser.parse!(body)
  end

  defp extract_temp(body) do
    IO.puts body
  end

  defp get(woeid) do
    {:ok, 200, _headers, client} = woeid |> weather_response |> :hackney.get
    {:ok, body} = :hackney.body(client)
    body
  end

  defp weather_response(woeid) do
    "https://query.yahooapis.com/v1/public/yql?q=select+%2A+from+weather.forecast+where+woeid%3D" <>
    woeid <> "&format=json"
  end

end
