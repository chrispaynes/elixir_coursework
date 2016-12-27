defmodule ListServerTest do
  use ExUnit.Case
  doctest ListServer

  setup do
    ListServer.start_link
    ListServer.clear
  end

  test "the list server begins empty" do
    assert Enum.empty?(ListServer.items) == true
  end

  test "items can be added to the list server" do
    ListServer.add("book") 
    assert ListServer.items == ["book"]
  end

  test "items can be removed from the list server" do
    ListServer.add("book") 
    ListServer.remove("book") 
    assert ListServer.items == [] 
  end

end
