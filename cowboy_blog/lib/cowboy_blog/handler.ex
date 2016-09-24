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

    # IO.inspect returns the URL search binding.
    IO.inspect param

    {:ok, req} = get_file(method, param, req)
    {:ok, req, state}
  end

  # get_file/3 returns a list a the contents in the "priv/contents/".
  # folder when an undefined value is requested.
  def get_file("GET", :undefined, req) do
    headers = [{"content-type", "text/html"}]
    # file_lists stores a file listing for the contents inside "priv/contents/".
    file_lists = File.ls! "priv/contents/"
    title = "Cowboy Blog"
    # Content stores the concatenated contents of all files within the "priv/contents".
    content = print_articles file_lists, ""
    body = EEx.eval_file "priv/themes/index.html.eex", [content: content, title: title]
    # :cowboy_req.reply sends the response status line headers and body to the client.
    {:ok, resp} = :cowboy_req.reply(200, headers, body, req)
  end

  # get_file/3 reads a file within "priv/contents/"
  # and parses it from markdown to HTML.
  def get_file("GET", param, req) do
    headers = [{"content-type", "text/html"}]
    {:ok, file} = File.read "priv/contents/" <> param <> ".md"
    title = String.capitalize(param) 
    content = Earmark.to_html file
    body = EEx.eval_file "priv/themes/index.html.eex", [content: content, title: title]
    {:ok, resp} = :cowboy_req.reply(200, headers, body, req)
  end


  # print_articles reads a list of files and parses each file to HTML.
  def print_articles [h|t], index_contents do
    {:ok, article} = File.read "priv/contents/" <> h
    sliced = String.slice article, 0, 1000
    # Marked stores the HTML parsed markdown files.
    marked = Earmark.to_html sliced
    # File stores the filename minus the file extension.
    file = Path.rootname(h)
    more = "<a class='button' href='#{file}'>More</a><hr />"
    print_articles t, index_contents <> marked <> more
  end


  def print_articles [], index_contents do
    index_contents
  end

  # terminate performs any necessary cleanup of the state.
  # This callback should release any resource currently in use,
  # clear any active timer and reset the process to its original state,
  # as it might be reused for future requests sent on the same connection.
  def terminate(_reason, _req, _state) do
    :ok
  end
end
