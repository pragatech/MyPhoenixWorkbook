defmodule InfoSys.Counter do
  use GenServer

  def inc(pid) do
    GenServer.cast(pid, :inc)
  end

  def dec(pid) do
    GenServer.cast(pid, :dec)
  end

  def val(pid) do
    GenServer.call(pid, :val)
  end

  def start_link(init_val) do
    GenServer.start_link(__MODULE__, init_val)
  end

  def init(initial_val) do
    {:ok, initial_val}
  end

  def handle_info(:tick, val) when val <= 0, do: raise "boom!"
  def handle_info(:tick, val) do
    IO.puts "tick #{val}"
    Process.send_after(self(), :tick, 1000)
    {:noreply, val - 1}
  end

  def handle_cast(:inc, val) do
    {:noreply, val+1}
  end

  def handle_cast(:dec, val) do
    {:noreply, val-1}
  end

  def handle_call(:val, _from, val) do
    {:reply, val, val}
  end
end
