defmodule CowboyBlog.Handler do
  def init({:tcp, :http}, req, opts) do
    headers = [{"content-type", "text/plain"}]
    body = "Cowboy Blog 1.0"

    # :cowboy_req.reply sends the response status line headers and body to the client.
    {:ok, resp} = :cowboy_req.reply(200, headers, body, req)
    {:ok, resp, opts}
  end

  # handle handles the request.
  def handle(req, state) do
    {:ok, req, state}
  end

  # terminate performs any necessary cleanup of the state.
  # This callback should release any resource currently in use,
  # clear any active timer and reset the process to its original state,
  # as it might be reused for future requests sent on the same connection.
  def terminate(_reason, _req, _state) do
    :ok
  end
end



