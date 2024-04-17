defmodule Games.GuessingGame do
  def play(count \\ 0, random_value \\ 0) do
    input_value =
      IO.gets("Guess a number between 1 and 10: ") |> String.trim() |> String.to_integer()

    if(random_value == 0) do
      win?(input_value, random_value, count)
    else
      random_value = Enum.random(1..10)
      win?(input_value, random_value, count)
    end
  end

  defp win?(input_value, random_value, count) do
    if(input_value === random_value) do
      IO.puts("You Win")
    else
      if(count >= 4) do
        IO.puts("You lose! the answer was 4")
      else
        IO.puts("Incorrect!")
        play(count + 1, random_value)
      end
    end
  end
end
