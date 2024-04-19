defmodule Games.GuessingGame do
  def play(count \\ 0, random_value \\ 0) do
    input_value =
      "Guess a number between 1 and 10: "
      |> IO.gets()
      |> String.trim()
      |> String.to_integer()

    if(random_value == 0) do
      win?(input_value, random_value, count)
    else
      random_value = Enum.random(1..10)
      win?(input_value, random_value, count)
    end
  end

  defp win?(input_value, random_value, _count) when input_value == random_value do
    IO.puts("You Win")
  end

  defp win?(_input_value, _random_value, count) when count >= 4 do
    IO.puts("You lose! the answer was 4")
  end

  defp win?(_input_value, random_value, count) do
    IO.puts("Incorrect!")
    play(count + 1, random_value)
  end
end
