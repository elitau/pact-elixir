defmodule PactElixir.ResponseOneTwo do
  defstruct [:body, :headers, :status]
  alias PactElixir.Term
  alias TermDetector

  def new(attributes \\ %{}) do # doing 1)
    #IO.puts is_map(attributes)
    attributes
    |> Enum.into(%{})
    |> TermDetector.recursively_update_terms()
    #%{ attributes | body: new_map } # doing 4) and 5)
  end

  def print_map(attributes \\ %{}) do
      Enum.each attributes, fn ({k, v}) ->
      	IO.puts k
      end
  end

  defp get_map(%Term{} = my_struct), # doing 2)
    do: Term.get_my_map(my_struct) # doing 3)

  defp get_map(my_struct),
    do: "Do something because my_struct isn't a Term"
end

#1) take a "response" map as argument to `Response.new`
#2) if there's a struct inside "response" map, check if that struct is a Term
#3) if yes, call a method of Term that returns a map
#4) in Response body, replace the Term with this map
#5) return Response body as map