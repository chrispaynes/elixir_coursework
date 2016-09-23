defmodule CowboyBlog.Handler do
  # init/4 Initialize the state for this request.
  # init({TransportName, ProtocolName}, Req, Opts)
  def init({:tcp, :http}, req, opts) do
    {:ok, req, opts}
  end

  # handle/2 handles the request.
  def handle(req, state) do
    # :cowboy_req.method returns the HTTP Request method.
    {method, req} = :cowboy_req.method(req)

    # :cowboy_req.binding returns specified :filename atoms bound to the request.
    {param, req} = :cowboy_req.binding(:filename, req)

    IO.inspect param

    {:ok, req} = get_file(method, param, req)
    {:ok, req, state}
  end

  # get_file/3
  def get_file("GET", :undefined, req) do
    headers = [{"content-type", "text/plain"}]
    body = "No articles exist using"
    # :cowboy_req.reply sends the response status line headers and body to the client.
    {:ok, resp} = :cowboy_req.reply(200, headers, body, req)
  end

  def get_file("GET", param, req) do
    headers = [{"content-type", "text/html"}]
    {:ok, file} = File.read "priv/contents/" <> param <> ".md"
    body = Earmark.to_html file
    {:ok, resp} = :cowboy_req.reply(200, headers, body, req)
  end

  # terminate performs any necessary cleanup of the state.
  # This callback should release any resource currently in use,
  # clear any active timer and reset the process to its original state,
  # as it might be reused for future requests sent on the same connection.
  def terminate(_reason, _req, _state) do
    :ok
  end
end



