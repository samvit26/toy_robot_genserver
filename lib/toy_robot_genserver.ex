defmodule ToyRobotGenserver do
  use GenServer

  def init(_) do
    {:ok, {0, 0, "N"}}
  end

  def place(server, x, y, f) when x in 0..4 and y in 0..4 and f in ["N", "S", "E", "W"] do
    GenServer.call(server, {:place, x, y, f})
  end

  def report(server) do
    GenServer.call(server, :report)
  end

  def move(server) do
    GenServer.call(server, :move)
  end

  def left(server) do
    GenServer.call(server, :left)
  end

   def right(server) do
     GenServer.call(server, :right)
   end

  def handle_call({:place, x, y, f}, _from, {_x, _y, _f} = state) do
    {:reply, :ok, {x, y, f}}
  end
  def handle_call(:report, _from, state) do
    {:reply, state, state}
  end
  def handle_call(:move, _from, {x, y, "N"}) when y < 4 do
    {:reply, :ok, {x, y + 1, "N"}}
  end
  def handle_call(:move, _from, {x, y, "S"}) when y > 0 do
    {:reply, :ok, {x, y - 1, "S"}}
  end
  def handle_call(:move, _from, {x, y, "E"}) when x < 4 do
    {:reply, :ok, {x + 1, y, "E"}}
  end
  def handle_call(:move, _from, {x, y, "W"}) when x > 0 do
    {:reply, :ok, {x - 1, y, "W"}}
  end
  def handle_call(:left, _from, {x, y, "N"}) do
    {:reply, :ok, {x, y, "W"}}
  end
  def handle_call(:left, _from, {x, y, "W"}) do
    {:reply, :ok, {x, y, "S"}}
  end
  def handle_call(:left, _from, {x, y, "S"}) do
    {:reply, :ok, {x, y, "E"}}
  end
  def handle_call(:left, _from, {x, y, "E"}) do
    {:reply, :ok, {x, y, "N"}}
  end
  def handle_call(:right, _from, {x, y, "N"}) do
    {:reply, :ok, {x, y, "E"}}
  end
  def handle_call(:right, _from, {x, y, "E"}) do
    {:reply, :ok, {x, y, "S"}}
  end
  def handle_call(:right, _from, {x, y, "S"}) do
    {:reply, :ok, {x, y, "W"}}
  end
  def handle_call(:right, _from, {x, y, "W"}) do
    {:reply, :ok, {x, y, "N"}}
  end
  def handle_call(_, _from, state) do
    {:reply, :ok, state}
  end
end
