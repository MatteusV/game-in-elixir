defmodule Games.GuessingGame do
  def play(count \\ 0) do
    inputValue =
      IO.gets("Guess a number between 1 and 10: ") |> String.trim() |> String.to_integer()

    random_value = Enum.random(1..10)

    if(inputValue === random_value) do
      IO.puts("You Win")
    else
      if(count >= 4) do
        IO.puts("You lose! the answer was 4")
      else
        IO.puts("Incorrect!")
        play(count + 1)
      end
    end
  end
end
