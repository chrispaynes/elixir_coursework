defmodule Mix.Tasks.Rebuild do
  use Mix.Task

  def run(_) do
    System.cmd("rm", ["-rf", "build/"])
    System.cmd("mix", [])
  end
end
