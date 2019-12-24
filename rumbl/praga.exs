
defmodule Rumbl.DataCase do
	def errors_on(changeset) do
	     Ecto.Changeset.traverse_errors(changeset, fn {message, opts} ->
	       IO.puts "message: #{inspect message}, opts: #{inspect opts}"
	       Regex.replace(~r"%{(\w+)}", message, fn _, key ->
	         opts |> Keyword.get(String.to_existing_atom(key), key) |> to_string()
	       end)
	     end)
	end
end
