defmodule ToyRobotGenserverTest do
  use ExUnit.Case
  doctest ToyRobotGenserver

  test "greets the world" do
    assert ToyRobotGenserver.hello() == :world
  end
end
